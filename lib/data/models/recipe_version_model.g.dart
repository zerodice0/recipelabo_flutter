// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeVersionModelImpl _$$RecipeVersionModelImplFromJson(
  Map<String, dynamic> json,
) => _$RecipeVersionModelImpl(
  id: json['id'] as String,
  recipeId: json['recipeId'] as String,
  versionNumber: (json['versionNumber'] as num).toInt(),
  name: json['name'] as String,
  versionName: json['versionName'] as String?,
  description: json['description'] as String,
  ingredients:
      (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  steps:
      (json['steps'] as List<dynamic>)
          .map((e) => StepModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  authorId: json['authorId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isDeleted: json['isDeleted'] as bool? ?? false,
  changeLog: json['changeLog'] as String?,
);

Map<String, dynamic> _$$RecipeVersionModelImplToJson(
  _$RecipeVersionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'recipeId': instance.recipeId,
  'versionNumber': instance.versionNumber,
  'name': instance.name,
  'versionName': instance.versionName,
  'description': instance.description,
  'ingredients': instance.ingredients,
  'steps': instance.steps,
  'authorId': instance.authorId,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isDeleted': instance.isDeleted,
  'changeLog': instance.changeLog,
};
