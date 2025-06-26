// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seasoning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeasoningModelImpl _$$SeasoningModelImplFromJson(Map<String, dynamic> json) =>
    _$SeasoningModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      usageCount: (json['usageCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SeasoningModelImplToJson(
  _$SeasoningModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': instance.category,
  'description': instance.description,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'usageCount': instance.usageCount,
};
