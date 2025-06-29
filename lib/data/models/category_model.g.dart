// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      description: json['description'] as String?,
      iconCode: json['iconCode'] as String?,
      colorCode: json['colorCode'] as String?,
      type: json['type'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      usageCount: (json['usageCount'] as num?)?.toInt() ?? 0,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'description': instance.description,
      'iconCode': instance.iconCode,
      'colorCode': instance.colorCode,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'usageCount': instance.usageCount,
      'isActive': instance.isActive,
    };
