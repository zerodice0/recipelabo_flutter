import 'dart:async';
import 'dart:convert';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recipick_flutter/core/services/alarm_timer_storage.dart';
import 'package:recipick_flutter/domain/entities/cooking_timer_entity.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';

class AlarmTimerScheduleException implements Exception {
  const AlarmTimerScheduleException(this.message);

  final String message;

  @override
  String toString() => message;
}

class _ScheduledAlarm {
  const _ScheduledAlarm({required this.id, required this.dateTime});

  final int id;
  final DateTime dateTime;
}

/// flutter alarm 패키지를 사용한 요리 타이머 관리 서비스
/// 시스템 레벨의 강력한 알람 기능을 제공합니다.
class AlarmTimerService extends ChangeNotifier {
  static final AlarmTimerService _instance = AlarmTimerService._internal();
  factory AlarmTimerService() => _instance;
  AlarmTimerService._internal();

  static const _firstAlarmId = 1000;
  static const _alarmPayloadType = 'cooking_timer';

  final AlarmTimerStorage _storage = AlarmTimerStorage();
  final Map<String, Timer> _activeTimers = {};
  final Map<String, CookingTimerEntity> _runningTimers = {};
  final Map<int, String> _alarmIdToTimerIdMap = {};
  final Map<String, int> _timerIdToAlarmIdMap = {};

  StreamSubscription<dynamic>? _ringingSubscription;
  Future<void> _alarmScheduleQueue = Future<void>.value();

  bool _isInitialized = false;
  bool _hasNotificationPermission = false;
  int _nextAlarmId = _firstAlarmId;

  /// 초기화
  Future<void> initialize() async {
    if (_isInitialized) return;

    await Alarm.init();
    _isInitialized = true;

    _ringingSubscription ??= Alarm.ringing.listen(_handleRingingAlarms);

    _hasNotificationPermission = await _readPermissionStatus();
    await _restorePersistedTimers();

    debugPrint('AlarmTimerService initialized');
  }

  /// 타이머 시작
  Future<void> startTimer(
    CookingTimerEntity timer, [
    BuildContext? context,
  ]) async {
    final notificationTitle = _getNotificationTitle(timer.name, context);
    final notificationBody = _getNotificationBody(
      timer.formattedTotalTime,
      context,
    );

    await _ensureInitialized();

    debugPrint('=== ALARM TIMER START ===');
    debugPrint('Timer ID: ${timer.id}');
    debugPrint('Timer name: ${timer.name}');
    debugPrint('Timer duration: ${timer.totalSeconds} seconds');

    await _cancelTimerAlarm(timer.id);
    _cancelActiveTimer(timer.id);

    final now = DateTime.now();
    final completionTime = now.add(Duration(seconds: timer.totalSeconds));
    var runningTimer = timer.copyWith(
      status: TimerStatus.running,
      remainingSeconds: timer.totalSeconds,
      startTime: now,
      endTime: completionTime,
    );

    final scheduledAlarm = await _scheduleAlarmForTimer(
      runningTimer,
      notificationTitle: notificationTitle,
      notificationBody: notificationBody,
      requireSystemAlarm: true,
    );
    runningTimer = runningTimer.copyWith(endTime: scheduledAlarm!.dateTime);

    _runningTimers[timer.id] = runningTimer;
    _startActiveTimer(runningTimer.id);
    await _persistState();

    notifyListeners();
    debugPrint('=== ALARM TIMER START COMPLETE ===');
  }

  /// 알림 제목 생성
  String _getNotificationTitle(String timerName, BuildContext? context) {
    if (context != null && context.mounted) {
      return AppLocalizations.of(
        context,
      ).timerNotificationCompleteTitle(timerName);
    }
    return '🍳 $timerName 완료!';
  }

  /// 알림 내용 생성
  String _getNotificationBody(String duration, BuildContext? context) {
    if (context != null && context.mounted) {
      return AppLocalizations.of(
        context,
      ).timerNotificationCompleteBody(duration);
    }
    return '$duration 타이머가 끝났습니다.';
  }

  /// 타이머 업데이트 (매초 호출)
  void _updateTimer(String timerId, Timer activeTimer) {
    final timer = _runningTimers[timerId];
    if (timer == null || !timer.isRunning) {
      activeTimer.cancel();
      _activeTimers.remove(timerId);
      return;
    }

    final remainingSeconds = _remainingSecondsFor(timer, DateTime.now());

    if (remainingSeconds <= 0) {
      unawaited(_completeTimer(timerId));
      return;
    }

    _runningTimers[timerId] = timer.copyWith(
      remainingSeconds: remainingSeconds,
    );
    notifyListeners();
  }

  /// 타이머 완료 처리 (알람이 울릴 때 호출)
  Future<void> _completeTimer(String timerId) async {
    debugPrint('=== TIMER COMPLETION ===');
    debugPrint('Completing timer: $timerId');

    final timer = _runningTimers[timerId];
    if (timer == null) {
      debugPrint('Timer not found in running timers');
      return;
    }

    _cancelActiveTimer(timerId);
    _runningTimers[timerId] = timer.copyWith(
      status: TimerStatus.completed,
      remainingSeconds: 0,
      endTime: DateTime.now(),
    );

    await _persistState();
    notifyListeners();
    debugPrint('=== TIMER COMPLETION COMPLETE ===');
  }

  /// 특정 알람 정지 (알람이 울릴 때 사용)
  Future<void> stopAlarm(int alarmId) async {
    await _ensureInitialized();

    final timerId =
        _alarmIdToTimerIdMap[alarmId] ??
        _timerIdFromPayload((await Alarm.getAlarm(alarmId))?.payload);

    await Alarm.stop(alarmId);
    _unregisterAlarmMapping(alarmId);

    if (timerId != null) {
      await _completeTimer(timerId);
      debugPrint('Alarm stopped manually: $alarmId for timer: $timerId');
    } else {
      await _persistState();
      debugPrint('Alarm stopped manually without timer mapping: $alarmId');
    }
  }

  /// 타이머 일시정지
  Future<void> pauseTimer(String timerId) async {
    await _ensureInitialized();

    final timer = _runningTimers[timerId];
    if (timer == null || !timer.isRunning) return;

    final remainingSeconds = _remainingSecondsFor(timer, DateTime.now());
    if (remainingSeconds <= 0) {
      await _completeTimer(timerId);
      return;
    }

    await _cancelTimerAlarm(timerId);
    _cancelActiveTimer(timerId);

    _runningTimers[timerId] = timer.copyWith(
      status: TimerStatus.paused,
      remainingSeconds: remainingSeconds,
      endTime: null,
    );

    await _persistState();
    notifyListeners();

    debugPrint('Timer paused: $timerId');
  }

  /// 타이머 재개
  Future<void> resumeTimer(String timerId) async {
    await _ensureInitialized();

    final timer = _runningTimers[timerId];
    if (timer == null || !timer.isPaused) return;

    if (timer.remainingSeconds <= 0) {
      await _completeTimer(timerId);
      return;
    }

    final now = DateTime.now();
    var resumedTimer = timer.copyWith(
      status: TimerStatus.running,
      startTime: now,
      endTime: now.add(Duration(seconds: timer.remainingSeconds)),
    );

    final scheduledAlarm = await _scheduleAlarmForTimer(
      resumedTimer,
      requireSystemAlarm: true,
    );
    resumedTimer = resumedTimer.copyWith(endTime: scheduledAlarm!.dateTime);

    _runningTimers[timerId] = resumedTimer;
    _startActiveTimer(timerId);
    await _persistState();

    notifyListeners();
    debugPrint('Timer resumed: $timerId');
  }

  /// 타이머 정지
  Future<void> stopTimer(String timerId) async {
    await _ensureInitialized();

    debugPrint('Stopping timer: $timerId');

    await _cancelTimerAlarm(timerId);
    _cancelActiveTimer(timerId);

    final timer = _runningTimers[timerId];
    if (timer != null) {
      _runningTimers[timerId] = timer.copyWith(
        status: TimerStatus.cancelled,
        endTime: null,
      );
      await _persistState();
      notifyListeners();
    }
  }

  /// 타이머 완전 제거
  Future<void> removeTimer(String timerId) async {
    await _ensureInitialized();

    await _cancelTimerAlarm(timerId);
    _cancelActiveTimer(timerId);
    _runningTimers.remove(timerId);

    await _persistState();
    notifyListeners();
    debugPrint('Timer removed: $timerId');
  }

  /// 모든 타이머 정지
  Future<void> stopAllTimers() async {
    await _ensureInitialized();

    debugPrint('Stopping all timers');

    final timerIds = _runningTimers.keys.toList(growable: false);
    for (final timerId in timerIds) {
      await _cancelTimerAlarm(timerId);
      _cancelActiveTimer(timerId);

      final timer = _runningTimers[timerId];
      if (timer != null) {
        _runningTimers[timerId] = timer.copyWith(
          status: TimerStatus.cancelled,
          endTime: null,
        );
      }
    }

    await _persistState();
    notifyListeners();
  }

  /// 현재 실행 중인 타이머들 가져오기
  List<CookingTimerEntity> get runningTimers => _runningTimers.values.toList();

  /// 특정 타이머 가져오기
  CookingTimerEntity? getTimer(String timerId) => _runningTimers[timerId];

  /// 활성 타이머 개수
  int get activeTimerCount => _runningTimers.values
      .where((timer) => timer.isRunning || timer.isPaused)
      .length;

  /// 완료된 타이머 개수
  int get completedTimerCount =>
      _runningTimers.values.where((timer) => timer.isCompleted).length;

  /// 권한 확인
  Future<bool> checkNotificationPermission() async {
    await _ensureInitialized();
    _hasNotificationPermission = await _readPermissionStatus();
    return _hasNotificationPermission;
  }

  /// 권한 요청
  Future<bool> requestNotificationPermission() async {
    await _ensureInitialized();

    try {
      var notificationStatus = await Permission.notification.status;
      if (!_isNotificationPermissionUsable(notificationStatus)) {
        notificationStatus = await Permission.notification.request();
      }

      var exactAlarmGranted = true;
      if (Alarm.android) {
        var exactAlarmStatus = await Permission.scheduleExactAlarm.status;
        if (!exactAlarmStatus.isGranted) {
          exactAlarmStatus = await Permission.scheduleExactAlarm.request();
        }
        exactAlarmGranted = exactAlarmStatus.isGranted;
      }

      _hasNotificationPermission =
          _isNotificationPermissionUsable(notificationStatus) &&
          exactAlarmGranted;

      if (_hasNotificationPermission) {
        await _ensureRunningTimersScheduled();
        await _persistState();
        notifyListeners();
      }

      return _hasNotificationPermission;
    } catch (e) {
      debugPrint('Failed to request timer notification permission: $e');
      _hasNotificationPermission = false;
      return false;
    }
  }

  /// 테스트 알람
  Future<void> testAlarm([BuildContext? context]) async {
    await _ensureInitialized();

    debugPrint('=== TEST ALARM ===');

    try {
      final notificationSettings = NotificationSettings(
        title: '🧪 테스트 알람',
        body: '알람이 정상적으로 작동합니다!',
        stopButton: '타이머 종료',
      );

      final volumeSettings = VolumeSettings.fade(
        volume: 0.8,
        fadeDuration: const Duration(seconds: 3),
      );

      final success = await Alarm.set(
        alarmSettings: AlarmSettings(
          id: 9999,
          dateTime: DateTime.now().add(const Duration(seconds: 3)),
          assetAudioPath: 'assets/sounds/alarm.mp3',
          loopAudio: false,
          vibrate: true,
          androidStopAlarmOnTermination: false,
          volumeSettings: volumeSettings,
          notificationSettings: notificationSettings,
          payload: jsonEncode({
            'type': 'cooking_timer_test',
            'createdAt': DateTime.now().toIso8601String(),
          }),
        ),
      );

      if (success) {
        debugPrint('Test alarm set successfully');
      } else {
        debugPrint('Failed to set test alarm');
      }
    } catch (e) {
      debugPrint('Test alarm error: $e');
    }

    debugPrint('=== TEST ALARM COMPLETE ===');
  }

  Future<void> _ensureInitialized() async {
    if (!_isInitialized) {
      await initialize();
    }
  }

  Future<void> _restorePersistedTimers() async {
    final snapshot = await _storage.load();
    final alarms = await Alarm.getAlarms();
    final alarmById = {for (final alarm in alarms) alarm.id: alarm};

    _cancelAllActiveTimers();
    _runningTimers.clear();
    _alarmIdToTimerIdMap.clear();
    _timerIdToAlarmIdMap.clear();

    for (final alarm in alarms) {
      final timerId = _timerIdFromPayload(alarm.payload);
      if (timerId != null) {
        _registerAlarmMapping(alarm.id, timerId);
      }
    }

    for (final entry in snapshot.timerIdToAlarmIdMap.entries) {
      if (alarmById.containsKey(entry.value)) {
        _registerAlarmMapping(entry.value, entry.key);
      }
    }

    _nextAlarmId = _maxInt([
      _firstAlarmId,
      snapshot.nextAlarmId,
      ...alarms.map((alarm) => alarm.id + 1),
      ...snapshot.timerIdToAlarmIdMap.values.map((alarmId) => alarmId + 1),
    ]);

    final now = DateTime.now();
    for (final timer in snapshot.timers) {
      final restoredTimer = await _restoreTimer(timer, now, alarmById);
      if (restoredTimer != null) {
        _runningTimers[restoredTimer.id] = restoredTimer;
      }
    }

    await _persistState();
    notifyListeners();
  }

  Future<CookingTimerEntity?> _restoreTimer(
    CookingTimerEntity timer,
    DateTime now,
    Map<int, AlarmSettings> alarmById,
  ) async {
    switch (timer.status) {
      case TimerStatus.running:
        return _restoreRunningTimer(timer, now, alarmById);
      case TimerStatus.paused:
        await _cancelTimerAlarm(timer.id);
        return timer.copyWith(endTime: null);
      case TimerStatus.completed:
        await _restoreCompletedTimerAlarmState(timer.id);
        return timer.copyWith(remainingSeconds: 0);
      case TimerStatus.cancelled:
        await _cancelTimerAlarm(timer.id);
        return timer.copyWith(endTime: null);
    }
  }

  Future<CookingTimerEntity> _restoreRunningTimer(
    CookingTimerEntity timer,
    DateTime now,
    Map<int, AlarmSettings> alarmById,
  ) async {
    final alarmId = _timerIdToAlarmIdMap[timer.id];
    final alarm = alarmId == null ? null : alarmById[alarmId];
    final storedEndTime = _expectedEndTime(timer);
    final endTime = alarm != null && alarm.dateTime.isAfter(storedEndTime)
        ? alarm.dateTime
        : storedEndTime;
    final remainingSeconds = _remainingSecondsUntil(endTime, now);

    if (remainingSeconds <= 0) {
      await _restoreCompletedTimerAlarmState(timer.id);
      return timer.copyWith(
        status: TimerStatus.completed,
        remainingSeconds: 0,
        endTime: endTime,
      );
    }

    var restoredTimer = timer.copyWith(
      status: TimerStatus.running,
      remainingSeconds: remainingSeconds,
      endTime: endTime,
    );

    final hasValidAlarm = alarm != null && alarm.dateTime.isAfter(now);

    if (!hasValidAlarm) {
      if (alarmId != null) {
        _unregisterAlarmMapping(alarmId);
      }
      final scheduledAlarm = await _scheduleAlarmForTimer(
        restoredTimer,
        preferredAlarmId: alarmId,
      );
      if (scheduledAlarm != null) {
        restoredTimer = restoredTimer.copyWith(
          endTime: scheduledAlarm.dateTime,
          remainingSeconds: _remainingSecondsUntil(
            scheduledAlarm.dateTime,
            now,
          ),
        );
      }
    }

    _startActiveTimer(timer.id);
    return restoredTimer;
  }

  Future<void> _restoreCompletedTimerAlarmState(String timerId) async {
    final alarmId = _timerIdToAlarmIdMap[timerId];
    if (alarmId == null) return;

    final isRinging = await Alarm.isRinging(alarmId);
    if (!isRinging) {
      await Alarm.stop(alarmId);
      _unregisterAlarmMapping(alarmId);
    }
  }

  Future<void> _ensureRunningTimersScheduled() async {
    final now = DateTime.now();
    final timers = _runningTimers.values.toList(growable: false);

    for (final timer in timers) {
      if (!timer.isRunning) continue;

      final remainingSeconds = _remainingSecondsFor(timer, now);
      if (remainingSeconds <= 0) {
        await _completeTimer(timer.id);
        continue;
      }

      if (_timerIdToAlarmIdMap.containsKey(timer.id)) continue;

      var updatedTimer = timer.copyWith(remainingSeconds: remainingSeconds);
      try {
        final scheduledAlarm = await _scheduleAlarmForTimer(updatedTimer);
        if (scheduledAlarm != null) {
          updatedTimer = updatedTimer.copyWith(
            endTime: scheduledAlarm.dateTime,
            remainingSeconds: _remainingSecondsUntil(
              scheduledAlarm.dateTime,
              now,
            ),
          );
        }
      } on AlarmTimerScheduleException catch (e) {
        debugPrint('Failed to reschedule running timer ${timer.id}: $e');
      }
      _runningTimers[timer.id] = updatedTimer;
    }
  }

  Future<_ScheduledAlarm?> _scheduleAlarmForTimer(
    CookingTimerEntity timer, {
    String? notificationTitle,
    String? notificationBody,
    int? preferredAlarmId,
    bool requireSystemAlarm = false,
  }) async {
    if (!_hasNotificationPermission) {
      final message =
          'Skipping system alarm for ${timer.id}: notification permission denied';
      debugPrint(message);
      if (requireSystemAlarm) {
        throw AlarmTimerScheduleException('알림 권한이 없어 타이머 알람을 예약할 수 없습니다.');
      }
      return null;
    }

    final now = DateTime.now();
    final completionTime = timer.endTime ?? _expectedEndTime(timer);
    if (!completionTime.isAfter(now)) {
      if (requireSystemAlarm) {
        throw AlarmTimerScheduleException('이미 종료된 타이머는 알람을 예약할 수 없습니다.');
      }
      return null;
    }

    return _runSerializedAlarmSchedule(() async {
      final alarmId = _allocateAlarmId(preferredAlarmId);

      try {
        final alarmDateTime = await _resolveUniqueAlarmDateTime(
          completionTime,
          alarmId,
        );

        if (!alarmDateTime.isAtSameMomentAs(completionTime)) {
          debugPrint(
            'Adjusted alarm time for ${timer.id} from $completionTime to $alarmDateTime',
          );
        }

        final notificationSettings = NotificationSettings(
          title: notificationTitle ?? _getNotificationTitle(timer.name, null),
          body:
              notificationBody ??
              _getNotificationBody(timer.formattedTotalTime, null),
          stopButton: '타이머 종료',
        );

        final volumeSettings = VolumeSettings.fade(
          volume: 0.8,
          fadeDuration: const Duration(seconds: 3),
        );

        final success = await Alarm.set(
          alarmSettings: AlarmSettings(
            id: alarmId,
            dateTime: alarmDateTime,
            assetAudioPath: 'assets/sounds/alarm.mp3',
            loopAudio: true,
            vibrate: true,
            androidStopAlarmOnTermination: false,
            volumeSettings: volumeSettings,
            notificationSettings: notificationSettings,
            payload: _buildAlarmPayload(timerId: timer.id, alarmId: alarmId),
          ),
        );

        if (!success) {
          final message = 'Failed to set alarm for ${timer.name}';
          debugPrint(message);
          if (requireSystemAlarm) {
            throw AlarmTimerScheduleException(
              '타이머 알람을 예약하지 못했습니다. 알림 설정을 확인해주세요.',
            );
          }
          return null;
        }

        _registerAlarmMapping(alarmId, timer.id);
        debugPrint('Alarm set successfully for ${timer.name}: $alarmId');
        return _ScheduledAlarm(id: alarmId, dateTime: alarmDateTime);
      } catch (e) {
        debugPrint('Error setting alarm for ${timer.id}: $e');
        _unregisterAlarmMapping(alarmId);
        if (requireSystemAlarm) {
          throw AlarmTimerScheduleException(
            '타이머 알람을 예약하지 못했습니다. 알림 설정을 확인해주세요.',
          );
        }
        return null;
      }
    });
  }

  Future<void> _cancelTimerAlarm(String timerId) async {
    final alarmId = _timerIdToAlarmIdMap[timerId] ?? _findAlarmId(timerId);
    if (alarmId == null) return;

    await Alarm.stop(alarmId);
    _unregisterAlarmMapping(alarmId);
    debugPrint('Stopped alarm: $alarmId');
  }

  void _startActiveTimer(String timerId) {
    _cancelActiveTimer(timerId);
    _activeTimers[timerId] = Timer.periodic(
      const Duration(seconds: 1),
      (activeTimer) => _updateTimer(timerId, activeTimer),
    );
  }

  void _cancelActiveTimer(String timerId) {
    final activeTimer = _activeTimers.remove(timerId);
    activeTimer?.cancel();
  }

  void _cancelAllActiveTimers() {
    for (final activeTimer in _activeTimers.values) {
      activeTimer.cancel();
    }
    _activeTimers.clear();
  }

  void _handleRingingAlarms(dynamic alarmSet) {
    for (final alarm in alarmSet.alarms) {
      final timerId =
          _alarmIdToTimerIdMap[alarm.id] ?? _timerIdFromPayload(alarm.payload);
      if (timerId != null) {
        unawaited(_completeTimer(timerId));
      }
    }
  }

  Future<bool> _readPermissionStatus() async {
    try {
      final notificationStatus = await Permission.notification.status;
      var exactAlarmGranted = true;

      if (Alarm.android) {
        exactAlarmGranted = await Permission.scheduleExactAlarm.isGranted;
      }

      return _isNotificationPermissionUsable(notificationStatus) &&
          exactAlarmGranted;
    } catch (e) {
      debugPrint('Failed to read timer notification permission: $e');
      return false;
    }
  }

  bool _isNotificationPermissionUsable(PermissionStatus status) {
    return status.isGranted || status.isLimited || status.isProvisional;
  }

  DateTime _expectedEndTime(CookingTimerEntity timer) {
    return timer.endTime ??
        timer.startTime.add(Duration(seconds: timer.remainingSeconds));
  }

  int _remainingSecondsFor(CookingTimerEntity timer, DateTime now) {
    return _remainingSecondsUntil(_expectedEndTime(timer), now);
  }

  int _remainingSecondsUntil(DateTime endTime, DateTime now) {
    if (!endTime.isAfter(now)) return 0;

    final remainingMicroseconds = endTime.difference(now).inMicroseconds;
    return (remainingMicroseconds + Duration.microsecondsPerSecond - 1) ~/
        Duration.microsecondsPerSecond;
  }

  Future<T> _runSerializedAlarmSchedule<T>(Future<T> Function() action) async {
    final previous = _alarmScheduleQueue;
    final completer = Completer<void>();
    _alarmScheduleQueue = completer.future;

    try {
      await previous.catchError((Object error, StackTrace stackTrace) {});
      return await action();
    } finally {
      if (!completer.isCompleted) {
        completer.complete();
      }
    }
  }

  Future<DateTime> _resolveUniqueAlarmDateTime(
    DateTime requestedDateTime,
    int alarmId,
  ) async {
    var candidate = requestedDateTime;
    final scheduledAlarms = await Alarm.getAlarms();

    while (scheduledAlarms.any(
      (alarm) =>
          alarm.id != alarmId && _isSameSecond(alarm.dateTime, candidate),
    )) {
      candidate = candidate.add(const Duration(seconds: 1));
    }

    return candidate;
  }

  bool _isSameSecond(DateTime first, DateTime second) {
    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day &&
        first.hour == second.hour &&
        first.minute == second.minute &&
        first.second == second.second;
  }

  int _allocateAlarmId(int? preferredAlarmId) {
    if (preferredAlarmId != null &&
        preferredAlarmId != 0 &&
        preferredAlarmId != -1) {
      if (preferredAlarmId >= _nextAlarmId) {
        _nextAlarmId = preferredAlarmId + 1;
      }
      return preferredAlarmId;
    }

    while (_alarmIdToTimerIdMap.containsKey(_nextAlarmId) ||
        _nextAlarmId == 9999) {
      _nextAlarmId++;
    }

    return _nextAlarmId++;
  }

  void _registerAlarmMapping(int alarmId, String timerId) {
    final previousAlarmId = _timerIdToAlarmIdMap[timerId];
    if (previousAlarmId != null && previousAlarmId != alarmId) {
      _alarmIdToTimerIdMap.remove(previousAlarmId);
    }

    final previousTimerId = _alarmIdToTimerIdMap[alarmId];
    if (previousTimerId != null && previousTimerId != timerId) {
      _timerIdToAlarmIdMap.remove(previousTimerId);
    }

    _alarmIdToTimerIdMap[alarmId] = timerId;
    _timerIdToAlarmIdMap[timerId] = alarmId;
  }

  void _unregisterAlarmMapping(int alarmId) {
    final timerId = _alarmIdToTimerIdMap.remove(alarmId);
    if (timerId != null && _timerIdToAlarmIdMap[timerId] == alarmId) {
      _timerIdToAlarmIdMap.remove(timerId);
    }
  }

  int? _findAlarmId(String timerId) {
    for (final entry in _alarmIdToTimerIdMap.entries) {
      if (entry.value == timerId) return entry.key;
    }
    return null;
  }

  String _buildAlarmPayload({required String timerId, required int alarmId}) {
    return jsonEncode({
      'type': _alarmPayloadType,
      'timerId': timerId,
      'alarmId': alarmId,
    });
  }

  String? _timerIdFromPayload(String? payload) {
    if (payload == null || payload.isEmpty) return null;

    try {
      final decoded = jsonDecode(payload);
      if (decoded is! Map<String, dynamic>) return null;
      if (decoded['type'] != _alarmPayloadType) return null;
      return decoded['timerId'] as String?;
    } catch (_) {
      return null;
    }
  }

  int _maxInt(Iterable<int> values) {
    var max = _firstAlarmId;
    for (final value in values) {
      if (value > max) max = value;
    }
    return max;
  }

  Future<void> _persistState() async {
    await _storage.save(
      timers: _runningTimers.values,
      timerIdToAlarmIdMap: _timerIdToAlarmIdMap,
      nextAlarmId: _nextAlarmId,
    );
  }

  @override
  void dispose() {
    _cancelAllActiveTimers();
    _ringingSubscription?.cancel();
    super.dispose();
  }
}
