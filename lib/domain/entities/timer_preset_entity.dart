import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_preset_entity.freezed.dart';

/// 자주 사용하는 타이머 프리셋을 나타내는 엔티티
@freezed
class TimerPresetEntity with _$TimerPresetEntity {
  const factory TimerPresetEntity({
    required String id,
    required String name, // 예: "파스타 면 삶기", "달걀 완숙"
    required int durationMinutes, // 분 단위 시간
    required int durationSeconds, // 초 단위 시간 (추가)
    String? description, // 타이머 설명
    String? icon, // 아이콘 이름 (예: "pasta", "egg")
    required DateTime createdAt,
    DateTime? lastUsedAt, // 마지막 사용 시간
    @Default(0) int usageCount, // 사용 횟수
    @Default(false) bool isDefault, // 기본 제공 프리셋인지 여부
  }) = _TimerPresetEntity;

  const TimerPresetEntity._();

  /// 전체 시간을 초 단위로 반환
  int get totalSeconds => (durationMinutes * 60) + durationSeconds;

  /// 시간을 "MM:SS" 형식으로 포맷
  String get formattedDuration {
    final minutes = durationMinutes.toString().padLeft(2, '0');
    final seconds = durationSeconds.toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  /// 사용 횟수 증가
  TimerPresetEntity incrementUsage() {
    return copyWith(
      usageCount: usageCount + 1,
      lastUsedAt: DateTime.now(),
    );
  }

  /// Map에서 TimerPresetEntity 생성
  factory TimerPresetEntity.fromMap(Map<String, dynamic> map) {
    return TimerPresetEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      durationMinutes: map['durationMinutes'] as int,
      durationSeconds: map['durationSeconds'] as int,
      description: map['description'] as String?,
      icon: map['icon'] as String?,
      createdAt: DateTime.parse(map['createdAt'] as String),
      lastUsedAt: map['lastUsedAt'] != null 
          ? DateTime.parse(map['lastUsedAt'] as String)
          : null,
      usageCount: map['usageCount'] as int? ?? 0,
      isDefault: (map['isDefault'] as int? ?? 0) == 1,
    );
  }

  /// TimerPresetEntity를 Map으로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'durationMinutes': durationMinutes,
      'durationSeconds': durationSeconds,
      'description': description,
      'icon': icon,
      'createdAt': createdAt.toIso8601String(),
      'lastUsedAt': lastUsedAt?.toIso8601String(),
      'usageCount': usageCount,
      'isDefault': isDefault ? 1 : 0,
    };
  }
}