// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => _RecipeModel(
  id: json['id'] as String,
  authorId: json['authorId'] as String,
  latestVersionId: json['latestVersionId'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  sourceUrl: json['sourceUrl'] as String?,
  sourceName: json['sourceName'] as String?,
  importedAt: json['importedAt'] == null
      ? null
      : DateTime.parse(json['importedAt'] as String),
  isPublic: json['isPublic'] as bool? ?? true,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isDeleted: json['isDeleted'] as bool? ?? false,
);

Map<String, dynamic> _$RecipeModelToJson(_RecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'latestVersionId': instance.latestVersionId,
      'name': instance.name,
      'description': instance.description,
      'sourceUrl': instance.sourceUrl,
      'sourceName': instance.sourceName,
      'importedAt': instance.importedAt?.toIso8601String(),
      'isPublic': instance.isPublic,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };
