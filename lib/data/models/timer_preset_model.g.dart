// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_preset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimerPresetModel _$TimerPresetModelFromJson(Map<String, dynamic> json) =>
    _TimerPresetModel(
      id: json['id'] as String,
      name: json['name'] as String,
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      durationSeconds: (json['durationSeconds'] as num).toInt(),
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      createdAt: json['createdAt'] as String,
      lastUsedAt: json['lastUsedAt'] as String?,
      usageCount: (json['usageCount'] as num?)?.toInt() ?? 0,
      isDefault: json['isDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$TimerPresetModelToJson(_TimerPresetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'durationMinutes': instance.durationMinutes,
      'durationSeconds': instance.durationSeconds,
      'description': instance.description,
      'icon': instance.icon,
      'createdAt': instance.createdAt,
      'lastUsedAt': instance.lastUsedAt,
      'usageCount': instance.usageCount,
      'isDefault': instance.isDefault,
    };
