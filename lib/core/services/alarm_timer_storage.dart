import 'dart:convert';

import 'package:recipick_flutter/domain/entities/cooking_timer_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmTimerStorageSnapshot {
  const AlarmTimerStorageSnapshot({
    required this.timers,
    required this.timerIdToAlarmIdMap,
    required this.nextAlarmId,
  });

  final List<CookingTimerEntity> timers;
  final Map<String, int> timerIdToAlarmIdMap;
  final int nextAlarmId;
}

class AlarmTimerStorage {
  static const _snapshotKey = 'alarm_timer_service.snapshot.v1';
  static const _currentVersion = 1;
  static const _defaultNextAlarmId = 1000;

  Future<AlarmTimerStorageSnapshot> load() async {
    final prefs = await SharedPreferences.getInstance();
    final rawSnapshot = prefs.getString(_snapshotKey);

    if (rawSnapshot == null || rawSnapshot.isEmpty) {
      return const AlarmTimerStorageSnapshot(
        timers: [],
        timerIdToAlarmIdMap: {},
        nextAlarmId: _defaultNextAlarmId,
      );
    }

    try {
      final decoded = jsonDecode(rawSnapshot) as Map<String, dynamic>;
      final rawTimers = decoded['timers'] as List<dynamic>? ?? [];
      final rawMappings =
          decoded['timerIdToAlarmIdMap'] as Map<String, dynamic>? ?? {};
      final nextAlarmId =
          (decoded['nextAlarmId'] as num?)?.toInt() ?? _defaultNextAlarmId;

      return AlarmTimerStorageSnapshot(
        timers: rawTimers
            .whereType<Map<String, dynamic>>()
            .map(_timerFromJson)
            .whereType<CookingTimerEntity>()
            .toList(growable: false),
        timerIdToAlarmIdMap: rawMappings.map(
          (timerId, alarmId) => MapEntry(timerId, (alarmId as num).toInt()),
        ),
        nextAlarmId: nextAlarmId < _defaultNextAlarmId
            ? _defaultNextAlarmId
            : nextAlarmId,
      );
    } catch (_) {
      return const AlarmTimerStorageSnapshot(
        timers: [],
        timerIdToAlarmIdMap: {},
        nextAlarmId: _defaultNextAlarmId,
      );
    }
  }

  Future<void> save({
    required Iterable<CookingTimerEntity> timers,
    required Map<String, int> timerIdToAlarmIdMap,
    required int nextAlarmId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _snapshotKey,
      jsonEncode({
        'version': _currentVersion,
        'timers': timers.map(_timerToJson).toList(growable: false),
        'timerIdToAlarmIdMap': timerIdToAlarmIdMap,
        'nextAlarmId': nextAlarmId,
        'updatedAt': DateTime.now().toIso8601String(),
      }),
    );
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_snapshotKey);
  }

  Map<String, dynamic> _timerToJson(CookingTimerEntity timer) {
    return {
      'id': timer.id,
      'name': timer.name,
      'totalSeconds': timer.totalSeconds,
      'remainingSeconds': timer.remainingSeconds,
      'startTime': timer.startTime.toIso8601String(),
      'endTime': timer.endTime?.toIso8601String(),
      'status': timer.status.name,
      'description': timer.description,
      'icon': timer.icon,
      'recipeId': timer.recipeId,
      'stepId': timer.stepId,
    };
  }

  CookingTimerEntity? _timerFromJson(Map<String, dynamic> json) {
    final id = json['id'] as String?;
    final name = json['name'] as String?;
    final startTime = _parseDate(json['startTime']);
    final status = _parseStatus(json['status']);

    if (id == null || name == null || startTime == null || status == null) {
      return null;
    }

    final totalSeconds = (json['totalSeconds'] as num?)?.toInt();
    final remainingSeconds = (json['remainingSeconds'] as num?)?.toInt();

    if (totalSeconds == null || remainingSeconds == null) {
      return null;
    }

    return CookingTimerEntity(
      id: id,
      name: name,
      totalSeconds: totalSeconds,
      remainingSeconds: remainingSeconds,
      startTime: startTime,
      endTime: _parseDate(json['endTime']),
      status: status,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      recipeId: json['recipeId'] as String?,
      stepId: json['stepId'] as String?,
    );
  }

  DateTime? _parseDate(Object? value) {
    if (value is! String || value.isEmpty) return null;
    return DateTime.tryParse(value);
  }

  TimerStatus? _parseStatus(Object? value) {
    if (value is! String) return null;

    for (final status in TimerStatus.values) {
      if (status.name == value) return status;
    }

    return null;
  }
}
