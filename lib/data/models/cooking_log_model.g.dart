// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooking_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CookingLogModel _$CookingLogModelFromJson(Map<String, dynamic> json) =>
    _CookingLogModel(
      id: json['id'] as String,
      recipeVersionId: json['recipeVersionId'] as String,
      authorId: json['authorId'] as String,
      title: json['title'] as String,
      memo: json['memo'] as String?,
      base64EncodedImageData: json['base64EncodedImageData'] as String?,
      cookedAt: DateTime.parse(json['cookedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$CookingLogModelToJson(_CookingLogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipeVersionId': instance.recipeVersionId,
      'authorId': instance.authorId,
      'title': instance.title,
      'memo': instance.memo,
      'base64EncodedImageData': instance.base64EncodedImageData,
      'cookedAt': instance.cookedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };
