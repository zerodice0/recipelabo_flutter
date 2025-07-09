import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_entity.freezed.dart';

/// 레시피 재료 엔티티
@freezed
abstract class IngredientEntity with _$IngredientEntity {
  const factory IngredientEntity({
    required String id,
    String? recipeVersionId,
    required String name,
    required double quantity,
    required String unit,
  }) = _IngredientEntity;
}
