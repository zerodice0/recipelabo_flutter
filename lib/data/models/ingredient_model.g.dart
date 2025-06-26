// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientModelImpl _$$IngredientModelImplFromJson(
  Map<String, dynamic> json,
) => _$IngredientModelImpl(
  id: json['id'] as String,
  recipeVersionId: json['recipeVersionId'] as String?,
  name: json['name'] as String,
  quantity: (json['quantity'] as num).toDouble(),
  unit: json['unit'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isDeleted: json['isDeleted'] as bool? ?? false,
);

Map<String, dynamic> _$$IngredientModelImplToJson(
  _$IngredientModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'recipeVersionId': instance.recipeVersionId,
  'name': instance.name,
  'quantity': instance.quantity,
  'unit': instance.unit,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isDeleted': instance.isDeleted,
};
