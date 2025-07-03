import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:saucerer_flutter/domain/entities/cooking_timer_entity.dart';
import 'package:saucerer_flutter/l10n/app_localizations.dart';

/// 요리 타이머 관리 서비스
/// 백그라운드에서 타이머를 실행하고 완료 시 로컬 알림을 보냅니다.
class TimerService extends ChangeNotifier {
  static final TimerService _instance = TimerService._internal();
  factory TimerService() => _instance;
  TimerService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final Map<String, Timer> _activeTimers = {};
  final Map<String, CookingTimerEntity> _runningTimers = {};

  bool _isInitialized = false;
  bool _hasNotificationPermission = false;

  /// 초기화 (권한 요청하지 않음)
  Future<void> initialize() async {
    if (_isInitialized) return;

    // 시간대 데이터 초기화
    tz.initializeTimeZones();

    // Android 설정 (권한 요청하지 않음)
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS 설정 (권한 요청하지 않음)
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationResponse,
    );

    _isInitialized = true;
  }

  /// 알림 권한 요청
  Future<bool> requestNotificationPermission() async {
    if (!_isInitialized) {
      await initialize();
    }

    if (Platform.isAndroid) {
      final androidPlugin = _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      // 정확한 알람 권한 요청
      await androidPlugin?.requestExactAlarmsPermission();
      
      // 알림 권한 요청
      final result = await androidPlugin?.requestNotificationsPermission();
      _hasNotificationPermission = result ?? false;
      
      return _hasNotificationPermission;
    } else if (Platform.isIOS) {
      // iOS 권한 요청
      final result = await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      
      _hasNotificationPermission = result ?? false;
      return _hasNotificationPermission;
    }

    return false;
  }

  /// 알림 권한 상태 확인
  Future<bool> checkNotificationPermission() async {
    if (!_isInitialized) {
      await initialize();
    }

    if (Platform.isAndroid) {
      final androidPlugin = _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      
      final granted = await androidPlugin?.areNotificationsEnabled();
      _hasNotificationPermission = granted ?? false;
      return _hasNotificationPermission;
    } else if (Platform.isIOS) {
      // iOS는 정확한 권한 상태를 확인하기 어려우므로 저장된 상태 반환
      return _hasNotificationPermission;
    }

    return false;
  }

  /// 알림 응답 처리
  void _onNotificationResponse(NotificationResponse response) {
    // 알림을 탭했을 때의 동작을 여기에 구현
    debugPrint('Timer notification tapped: ${response.payload}');
  }

  /// 타이머 시작
  Future<void> startTimer(CookingTimerEntity timer, [BuildContext? context]) async {
    debugPrint('=== TIMER START DEBUG ===');
    debugPrint('Timer ID: ${timer.id}');
    debugPrint('Timer name: ${timer.name}');
    debugPrint('Timer duration: ${timer.totalSeconds} seconds');
    
    // 알림 권한 확인
    final permissionStatus = await checkNotificationPermission();
    debugPrint('Notification permission: $permissionStatus');
    
    // 기존 타이머가 있다면 정지
    stopTimer(timer.id);

    final now = DateTime.now();
    final completionTime = now.add(Duration(seconds: timer.totalSeconds));
    debugPrint('Start time: $now');
    debugPrint('Completion time: $completionTime');

    _runningTimers[timer.id] = timer.copyWith(
      status: TimerStatus.running,
      startTime: now,
      endTime: completionTime,
    );

    // 스케줄된 로컬 노티피케이션 설정 (백그라운드/앱 종료 시에도 작동)
    if (_hasNotificationPermission) {
      debugPrint('Scheduling notification...');
      await _scheduleNotification(timer.id, timer.name, timer.formattedTotalTime, completionTime, context);
    } else {
      debugPrint('Notification permission not granted, skipping notification scheduling');
    }
    
    // 추가: 대체 방안으로 앱 내에서 Timer 기반 노티피케이션도 설정
    debugPrint('Setting up fallback timer-based notification...');
    Timer(Duration(seconds: timer.totalSeconds), () async {
      debugPrint('⏰ Fallback timer completed for ${timer.name}');
      // 타이머가 아직 실행 중인 상태라면 완료 처리
      final currentTimer = _runningTimers[timer.id];
      if (currentTimer != null && currentTimer.isRunning) {
        debugPrint('Force completing timer via fallback');
        await _completeTimer(timer.id);
      }
    });

    // 매초마다 업데이트하는 타이머 시작 (앱 내 UI 업데이트용)
    _activeTimers[timer.id] = Timer.periodic(
      const Duration(seconds: 1),
      (Timer activeTimer) => _updateTimer(timer.id, activeTimer),
    );

    notifyListeners();
    debugPrint('=== TIMER START COMPLETE ===');
  }

  /// 스케줄된 로컬 노티피케이션 설정
  Future<void> _scheduleNotification(String timerId, String timerName, String duration, DateTime scheduledTime, [BuildContext? context]) async {
    debugPrint('=== SCHEDULE NOTIFICATION DEBUG ===');
    debugPrint('Timer ID: $timerId');
    debugPrint('Timer Name: $timerName');
    debugPrint('Duration: $duration');
    debugPrint('Scheduled Time: $scheduledTime');
    debugPrint('Current Time: ${DateTime.now()}');
    debugPrint('Time difference: ${scheduledTime.difference(DateTime.now()).inSeconds} seconds');
    
    try {
      // 다국어화를 위해 기본 텍스트 사용 (context가 없는 경우)
      final channelName = context != null 
          ? AppLocalizations.of(context).cookingTimerChannel 
          : '요리 타이머';
      final channelDescription = context != null
          ? AppLocalizations.of(context).timerNotificationDescription
          : '요리 타이머 완료 알림';
      final notificationTitle = context != null
          ? AppLocalizations.of(context).timerCompleteTitle(timerName)
          : '🍳 $timerName 완료!';
      final notificationBody = context != null
          ? AppLocalizations.of(context).timerCompleteBody(duration)
          : '$duration 타이머가 끝났습니다.';
      
      final AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        'cooking_timer_channel',
        channelName,
        channelDescription: channelDescription,
        importance: Importance.max, // max로 변경
        priority: Priority.max, // max로 변경
        showWhen: true,
        enableVibration: true,
        playSound: true,
        icon: '@mipmap/ic_launcher',
      );

      const DarwinNotificationDetails iosNotificationDetails =
          DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        sound: 'default',
      );

      final NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: iosNotificationDetails,
      );

      final tzDateTime = tz.TZDateTime.from(scheduledTime, tz.local);
      debugPrint('TZ DateTime: $tzDateTime');
      debugPrint('Using notification ID: ${timerId.hashCode}');

      await _flutterLocalNotificationsPlugin.zonedSchedule(
        timerId.hashCode, // 고유 ID
        notificationTitle,
        notificationBody,
        tzDateTime, // timezone 패키지 사용
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // 정확한 시간에 알림
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        payload: timerId,
      );
      
      debugPrint('✅ Scheduled notification successfully for $timerName at $scheduledTime');
    } catch (e) {
      debugPrint('❌ Failed to schedule notification: $e');
      debugPrint('Error type: ${e.runtimeType}');
      debugPrint('Error details: ${e.toString()}');
    }
    debugPrint('=== SCHEDULE NOTIFICATION DEBUG END ===');
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
      // 타이머 완료
      _completeTimer(timerId);
      activeTimer.cancel();
    } else {
      // 타이머 업데이트
      _runningTimers[timerId] = timer.copyWith(
        remainingSeconds: newRemainingSeconds,
      );
      notifyListeners();
    }
  }

  /// 타이머 완료 처리
  Future<void> _completeTimer(String timerId) async {
    debugPrint('=== TIMER COMPLETION DEBUG ===');
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

    // 로컬 알림 전송 (즉시 알림 - 백업용)
    debugPrint('Showing immediate completion notification...');
    await _showCompletionNotification(timer);
    
    // 추가: 스케줄된 노티피케이션이 실패했을 경우를 대비해 강제로 한 번 더 전송
    if (_hasNotificationPermission) {
      debugPrint('Sending backup immediate notification...');
      try {
        await _flutterLocalNotificationsPlugin.show(
          (timer.id.hashCode + 1000), // 다른 ID 사용
          '🔔 ${timer.name} 완료!',
          '타이머가 완료되었습니다.',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'cooking_timer_backup_channel',
              '타이머 백업 알림',
              channelDescription: '타이머 완료 백업 알림',
              importance: Importance.max,
              priority: Priority.max,
              showWhen: true,
              enableVibration: true,
              playSound: true,
            ),
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              sound: 'default',
            ),
          ),
          payload: '${timer.id}_backup',
        );
        debugPrint('Backup notification sent successfully');
      } catch (e) {
        debugPrint('Backup notification failed: $e');
      }
    }

    // 활성 타이머에서 제거
    _activeTimers.remove(timerId);

    notifyListeners();
    debugPrint('=== TIMER COMPLETION COMPLETE ===');
  }

  /// 완료 알림 표시
  Future<void> _showCompletionNotification(CookingTimerEntity timer) async {
    debugPrint('=== NOTIFICATION DEBUG ===');
    debugPrint('Attempting to show notification for: ${timer.name}');
    debugPrint('Has notification permission: $_hasNotificationPermission');
    
    // 알림 권한이 없으면 알림을 보내지 않음
    if (!_hasNotificationPermission) {
      debugPrint('Notification permission not granted, skipping notification');
      return;
    }

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'cooking_timer_channel',
      '요리 타이머',
      channelDescription: '요리 타이머 완료 알림',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      enableVibration: true,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('timer_complete'),
      icon: '@mipmap/ic_launcher',
    );

    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: 'timer_complete.aiff',
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    try {
      debugPrint('Showing notification with ID: ${timer.id.hashCode}');
      debugPrint('Notification title: 🍳 ${timer.name} 완료!');
      debugPrint('Notification body: ${timer.formattedTotalTime} 타이머가 끝났습니다.');
      
      await _flutterLocalNotificationsPlugin.show(
        timer.id.hashCode, // 고유 ID
        '🍳 ${timer.name} 완료!',
        '${timer.formattedTotalTime} 타이머가 끝났습니다.',
        notificationDetails,
        payload: timer.id,
      );
      
      debugPrint('Notification sent successfully');
    } catch (e) {
      debugPrint('Failed to show notification: $e');
    }
    debugPrint('=== NOTIFICATION DEBUG COMPLETE ===');
  }

  /// 타이머 일시정지
  void pauseTimer(String timerId) {
    final activeTimer = _activeTimers[timerId];
    final timer = _runningTimers[timerId];

    if (activeTimer != null && timer != null) {
      activeTimer.cancel();
      _activeTimers.remove(timerId);
      
      // 스케줄된 노티피케이션 취소
      _cancelScheduledNotification(timerId);
      
      _runningTimers[timerId] = timer.copyWith(status: TimerStatus.paused);
      notifyListeners();
    }
  }

  /// 타이머 재개
  void resumeTimer(String timerId) {
    final timer = _runningTimers[timerId];
    if (timer != null && timer.isPaused) {
      startTimer(timer);
    }
  }

  /// 타이머 정지
  void stopTimer(String timerId) {
    final activeTimer = _activeTimers[timerId];
    if (activeTimer != null) {
      activeTimer.cancel();
      _activeTimers.remove(timerId);
    }

    // 스케줄된 노티피케이션 취소
    _cancelScheduledNotification(timerId);

    final timer = _runningTimers[timerId];
    if (timer != null) {
      _runningTimers[timerId] = timer.copyWith(status: TimerStatus.cancelled);
      notifyListeners();
    }
  }

  /// 타이머 완전 제거
  void removeTimer(String timerId) {
    stopTimer(timerId);
    _runningTimers.remove(timerId);
    notifyListeners();
  }

  /// 스케줄된 노티피케이션 취소
  Future<void> _cancelScheduledNotification(String timerId) async {
    try {
      await _flutterLocalNotificationsPlugin.cancel(timerId.hashCode);
      debugPrint('Cancelled scheduled notification for timer: $timerId');
    } catch (e) {
      debugPrint('Failed to cancel notification: $e');
    }
  }

  /// 모든 타이머 정지
  void stopAllTimers() {
    for (final activeTimer in _activeTimers.values) {
      activeTimer.cancel();
    }
    _activeTimers.clear();

    // 모든 스케줄된 노티피케이션 취소
    for (final timerId in _runningTimers.keys) {
      _cancelScheduledNotification(timerId);
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
  int get completedTimerCount => _runningTimers.values
      .where((timer) => timer.isCompleted)
      .length;

  /// 테스트용 즉시 노티피케이션 전송
  Future<void> testNotification([BuildContext? context]) async {
    debugPrint('=== TEST NOTIFICATION ===');
    
    if (!_isInitialized) {
      await initialize();
    }
    
    // 권한 확인
    final hasPermission = await checkNotificationPermission();
    debugPrint('Permission status for test: $hasPermission');
    
    if (!hasPermission) {
      debugPrint('No permission, requesting...');
      await requestNotificationPermission();
    }
    
    try {
      // 다국어화를 위해 기본 텍스트 사용 (context가 없는 경우)
      final channelName = context != null 
          ? AppLocalizations.of(context).testNotificationChannel 
          : '테스트 알림';
      final channelDescription = context != null
          ? AppLocalizations.of(context).testNotificationDescription
          : '노티피케이션 테스트용';
      final notificationTitle = context != null
          ? AppLocalizations.of(context).testNotificationTitle
          : '🔔 테스트 알림';
      final notificationBody = context != null
          ? AppLocalizations.of(context).testNotificationBody
          : '노티피케이션이 정상적으로 작동합니다!';
      
      final AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        'cooking_timer_test_channel',
        channelName,
        channelDescription: channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        showWhen: true,
        enableVibration: true,
        playSound: true,
      );

      const DarwinNotificationDetails iosNotificationDetails =
          DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        sound: 'default',
      );

      final NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: iosNotificationDetails,
      );

      await _flutterLocalNotificationsPlugin.show(
        999, // 테스트용 고정 ID
        notificationTitle,
        notificationBody,
        notificationDetails,
        payload: 'test',
      );
      
      debugPrint('Test notification sent successfully');
    } catch (e) {
      debugPrint('Test notification failed: $e');
    }
    
    debugPrint('=== TEST NOTIFICATION COMPLETE ===');
  }

  @override
  void dispose() {
    stopAllTimers();
    super.dispose();
  }
}