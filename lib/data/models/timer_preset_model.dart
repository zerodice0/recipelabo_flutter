import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saucerer_flutter/domain/entities/timer_preset_entity.dart';

part 'timer_preset_model.freezed.dart';
part 'timer_preset_model.g.dart';

/// 타이머 프리셋 데이터 모델
@freezed
class TimerPresetModel with _$TimerPresetModel {
  const factory TimerPresetModel({
    required String id,
    required String name,
    required int durationMinutes,
    required int durationSeconds,
    String? description,
    String? icon,
    required String createdAt, // ISO string format
    String? lastUsedAt, // ISO string format
    @Default(0) int usageCount,
    @Default(false) bool isDefault,
  }) = _TimerPresetModel;

  const TimerPresetModel._();

  /// JSON 직렬화
  factory TimerPresetModel.fromJson(Map<String, Object?> json) => 
      _$TimerPresetModelFromJson(json);

  /// Map으로부터 생성 (SQLite용)
  factory TimerPresetModel.fromMap(Map<String, dynamic> map) {
    return TimerPresetModel(
      id: map['id'],
      name: map['name'],
      durationMinutes: map['durationMinutes'],
      durationSeconds: map['durationSeconds'],
      description: map['description'],
      icon: map['icon'],
      createdAt: map['createdAt'],
      lastUsedAt: map['lastUsedAt'],
      usageCount: map['usageCount'] ?? 0,
      isDefault: (map['isDefault'] as int?) == 1,
    );
  }

  /// Map으로 변환 (SQLite용)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'durationMinutes': durationMinutes,
      'durationSeconds': durationSeconds,
      'description': description,
      'icon': icon,
      'createdAt': createdAt,
      'lastUsedAt': lastUsedAt,
      'usageCount': usageCount,
      'isDefault': isDefault ? 1 : 0,
    };
  }

  /// 엔티티로 변환
  TimerPresetEntity toEntity() {
    return TimerPresetEntity(
      id: id,
      name: name,
      durationMinutes: durationMinutes,
      durationSeconds: durationSeconds,
      description: description,
      icon: icon,
      createdAt: DateTime.parse(createdAt),
      lastUsedAt: lastUsedAt != null ? DateTime.parse(lastUsedAt!) : null,
      usageCount: usageCount,
      isDefault: isDefault,
    );
  }

  /// 엔티티로부터 생성
  factory TimerPresetModel.fromEntity(TimerPresetEntity entity) {
    return TimerPresetModel(
      id: entity.id,
      name: entity.name,
      durationMinutes: entity.durationMinutes,
      durationSeconds: entity.durationSeconds,
      description: entity.description,
      icon: entity.icon,
      createdAt: entity.createdAt.toIso8601String(),
      lastUsedAt: entity.lastUsedAt?.toIso8601String(),
      usageCount: entity.usageCount,
      isDefault: entity.isDefault,
    );
  }
}