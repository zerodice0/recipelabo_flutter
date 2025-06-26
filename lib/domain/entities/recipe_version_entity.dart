import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saucerer_flutter/domain/entities/ingredient_entity.dart';
import 'package:saucerer_flutter/domain/entities/step_entity.dart';

part 'recipe_version_entity.freezed.dart';

/// 레시피 버전 엔티티
@freezed
class RecipeVersionEntity with _$RecipeVersionEntity {
  const factory RecipeVersionEntity({
    required String id,
    required String recipeId,
    required int versionNumber,
    required String name,
    required String description,
    required List<IngredientEntity> ingredients,
    required List<StepEntity> steps,
    required String authorId,
    required DateTime createdAt,
  }) = _RecipeVersionEntity;
}
