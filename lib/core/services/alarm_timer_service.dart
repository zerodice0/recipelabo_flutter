import 'dart:async';
import 'package:flutter/material.dart';
import 'package:alarm/alarm.dart';
import 'package:recipick_flutter/domain/entities/cooking_timer_entity.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';

/// flutter alarm 패키지를 사용한 요리 타이머 관리 서비스
/// 시스템 레벨의 강력한 알람 기능을 제공합니다.
class AlarmTimerService extends ChangeNotifier {
  static final AlarmTimerService _instance = AlarmTimerService._internal();
  factory AlarmTimerService() => _instance;
  AlarmTimerService._internal();

  final Map<String, Timer> _activeTimers = {};
  final Map<String, CookingTimerEntity> _runningTimers = {};
  final Map<int, String> _alarmIdToTimerIdMap = {}; // alarm ID와 timer ID 매핑

  bool _isInitialized = false;
  int _nextAlarmId = 1000; // alarm ID는 1000부터 시작

  /// 초기화
  Future<void> initialize() async {
    if (_isInitialized) return;

    await Alarm.init();

    // 기존 알람들을 정리
    await _cleanupExistingAlarms();

    _isInitialized = true;
    debugPrint('AlarmTimerService initialized');
  }

  /// 기존 알람들 정리
  Future<void> _cleanupExistingAlarms() async {
    final alarms = await Alarm.getAlarms();
    for (final alarm in alarms) {
      // 요리 타이머 관련 알람만 정리 (ID가 1000 이상)
      if (alarm.id >= 1000) {
        await Alarm.stop(alarm.id);
        debugPrint('Cleaned up existing alarm: ${alarm.id}');
      }
    }
  }

  /// 타이머 시작
  Future<void> startTimer(
    CookingTimerEntity timer, [
    BuildContext? context,
  ]) async {
    debugPrint('=== ALARM TIMER START ===');
    debugPrint('Timer ID: ${timer.id}');
    debugPrint('Timer name: ${timer.name}');
    debugPrint('Timer duration: ${timer.totalSeconds} seconds');

    // 기존 타이머가 있다면 정지
    await stopTimer(timer.id);

    final now = DateTime.now();
    final completionTime = now.add(Duration(seconds: timer.totalSeconds));
    final alarmId = _nextAlarmId++;

    debugPrint('Start time: $now');
    debugPrint('Completion time: $completionTime');
    debugPrint('Alarm ID: $alarmId');

    // 타이머 상태 업데이트
    _runningTimers[timer.id] = timer.copyWith(
      status: TimerStatus.running,
      startTime: now,
      endTime: completionTime,
    );

    // alarm ID와 timer ID 매핑
    _alarmIdToTimerIdMap[alarmId] = timer.id;

    try {
      if (context?.mounted == true) {
        final notificationSettings = NotificationSettings(
          title: _getNotificationTitle(timer.name, context),
          body: _getNotificationBody(timer.formattedTotalTime, context),
          stopButton: "타이머 종료",
        );

        final volumeSettings = VolumeSettings.fade(
          volume: 0.8,
          fadeDuration: const Duration(seconds: 3),
        );

        final success = await Alarm.set(
          alarmSettings: AlarmSettings(
            id: alarmId,
            dateTime: completionTime,
            assetAudioPath: 'assets/sounds/alarm.mp3',
            loopAudio: true, // 지속적으로 울림
            vibrate: true,
            volumeSettings: volumeSettings,
            notificationSettings: notificationSettings,
          ),
        );

        if (success) {
          debugPrint('✅ Alarm set successfully for ${timer.name}');

          // UI 업데이트용 타이머 시작 (매초마다)
          _activeTimers[timer.id] = Timer.periodic(
            const Duration(seconds: 1),
            (Timer activeTimer) => _updateTimer(timer.id, activeTimer),
          );

          notifyListeners();
        }
      } else {
        debugPrint('❌ Failed to set alarm for ${timer.name}');
        throw Exception('Failed to set alarm');
      }
    } catch (e) {
      debugPrint('❌ Error setting alarm: $e');
      // 알람 설정 실패 시 매핑 정리
      _alarmIdToTimerIdMap.remove(alarmId);
      _runningTimers.remove(timer.id);
      rethrow;
    }

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
    if (timer == null) {
      activeTimer.cancel();
      return;
    }

    final newRemainingSeconds = timer.remainingSeconds - 1;

    if (newRemainingSeconds <= 0) {
      // 타이머 완료 - 알람이 울릴 예정이므로 여기서는 상태만 업데이트
      _runningTimers[timerId] = timer.copyWith(
        remainingSeconds: 0,
        status: TimerStatus.completed,
      );
      activeTimer.cancel();
      _activeTimers.remove(timerId);
    } else {
      // 타이머 업데이트
      _runningTimers[timerId] = timer.copyWith(
        remainingSeconds: newRemainingSeconds,
      );
    }

    notifyListeners();
  }

  /// 타이머 완료 처리 (알람이 울릴 때 호출)
  void _completeTimer(String timerId) {
    debugPrint('=== TIMER COMPLETION ===');
    debugPrint('Completing timer: $timerId');

    final timer = _runningTimers[timerId];
    if (timer == null) {
      debugPrint('Timer not found in running timers');
      return;
    }

    debugPrint('Timer name: ${timer.name}');
    debugPrint('Timer completed at: ${DateTime.now()}');

    // 타이머 상태를 완료로 변경
    _runningTimers[timerId] = timer.copyWith(
      status: TimerStatus.completed,
      remainingSeconds: 0,
    );

    // 활성 타이머에서 제거
    _activeTimers.remove(timerId);

    notifyListeners();
    debugPrint('=== TIMER COMPLETION COMPLETE ===');
  }

  /// 특정 알람 정지 (알람이 울릴 때 사용)
  Future<void> stopAlarm(int alarmId) async {
    final timerId = _alarmIdToTimerIdMap[alarmId];
    if (timerId != null) {
      await Alarm.stop(alarmId);
      _alarmIdToTimerIdMap.remove(alarmId);

      // 타이머 완료 처리
      _completeTimer(timerId);

      debugPrint('Alarm stopped manually: $alarmId for timer: $timerId');
    }
  }

  /// 타이머 일시정지
  Future<void> pauseTimer(String timerId) async {
    final timer = _runningTimers[timerId];
    if (timer == null || !timer.isRunning) return;

    // 관련 알람 찾기 및 중지
    final alarmIdEntry = _alarmIdToTimerIdMap.entries
        .where((entry) => entry.value == timerId)
        .firstOrNull;

    if (alarmIdEntry != null) {
      await Alarm.stop(alarmIdEntry.key);
      _alarmIdToTimerIdMap.remove(alarmIdEntry.key);
    }

    // UI 업데이트 타이머 중지
    final activeTimer = _activeTimers[timerId];
    if (activeTimer != null) {
      activeTimer.cancel();
      _activeTimers.remove(timerId);
    }

    // 상태 업데이트
    _runningTimers[timerId] = timer.copyWith(status: TimerStatus.paused);
    notifyListeners();

    debugPrint('Timer paused: $timerId');
  }

  /// 타이머 재개
  Future<void> resumeTimer(String timerId) async {
    final timer = _runningTimers[timerId];
    if (timer == null || !timer.isPaused) return;

    // 새로운 타이머로 재시작
    final newTimer = timer.copyWith(
      totalSeconds: timer.remainingSeconds,
      status: TimerStatus.running,
      startTime: DateTime.now(),
    );

    await startTimer(newTimer);
    debugPrint('Timer resumed: $timerId');
  }

  /// 타이머 정지
  Future<void> stopTimer(String timerId) async {
    debugPrint('Stopping timer: $timerId');

    // 관련 알람 찾기 및 중지
    final alarmIdEntry = _alarmIdToTimerIdMap.entries
        .where((entry) => entry.value == timerId)
        .firstOrNull;

    if (alarmIdEntry != null) {
      await Alarm.stop(alarmIdEntry.key);
      _alarmIdToTimerIdMap.remove(alarmIdEntry.key);
      debugPrint('Stopped alarm: ${alarmIdEntry.key}');
    }

    // UI 업데이트 타이머 중지
    final activeTimer = _activeTimers[timerId];
    if (activeTimer != null) {
      activeTimer.cancel();
      _activeTimers.remove(timerId);
    }

    // 상태 업데이트
    final timer = _runningTimers[timerId];
    if (timer != null) {
      _runningTimers[timerId] = timer.copyWith(status: TimerStatus.cancelled);
      notifyListeners();
    }
  }

  /// 타이머 완전 제거
  Future<void> removeTimer(String timerId) async {
    await stopTimer(timerId);
    _runningTimers.remove(timerId);
    notifyListeners();
    debugPrint('Timer removed: $timerId');
  }

  /// 모든 타이머 정지
  Future<void> stopAllTimers() async {
    debugPrint('Stopping all timers');

    // 모든 알람 중지
    for (final alarmId in _alarmIdToTimerIdMap.keys) {
      await Alarm.stop(alarmId);
    }
    _alarmIdToTimerIdMap.clear();

    // 모든 활성 타이머 중지
    for (final activeTimer in _activeTimers.values) {
      activeTimer.cancel();
    }
    _activeTimers.clear();

    // 모든 타이머 상태를 취소로 변경
    final timerIds = _runningTimers.keys.toList();
    for (final timerId in timerIds) {
      final timer = _runningTimers[timerId];
      if (timer != null) {
        _runningTimers[timerId] = timer.copyWith(status: TimerStatus.cancelled);
      }
    }

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

  /// 권한 확인 (alarm 패키지는 자동으로 처리)
  Future<bool> checkNotificationPermission() async {
    // alarm 패키지는 자체적으로 권한을 관리합니다
    return true;
  }

  /// 권한 요청 (alarm 패키지는 자동으로 처리)
  Future<bool> requestNotificationPermission() async {
    // alarm 패키지는 자체적으로 권한을 관리합니다
    return true;
  }

  /// 테스트 알람
  Future<void> testAlarm([BuildContext? context]) async {
    debugPrint('=== TEST ALARM ===');

    try {
      final notificationSettings = NotificationSettings(
        title: '🧪 테스트 알람',
        body: '알람이 정상적으로 작동합니다!',
        stopButton: "타이머 종료",
      );

      final volumeSettings = VolumeSettings.fade(
        volume: 0.8,
        fadeDuration: const Duration(seconds: 3),
      );

      final success = await Alarm.set(
        alarmSettings: AlarmSettings(
          id: 9999, // 테스트용 고정 ID
          dateTime: DateTime.now().add(const Duration(seconds: 3)),
          assetAudioPath: 'assets/sounds/alarm.mp3',
          loopAudio: false,
          vibrate: true,
          volumeSettings: volumeSettings,
          notificationSettings: notificationSettings,
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

  @override
  void dispose() {
    stopAllTimers();
    super.dispose();
  }
}
