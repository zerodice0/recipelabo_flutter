import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/domain/repositories/ingredient_repository.dart';
import 'package:recipick_flutter/core/di/provider.dart';

part 'get_recipes_by_ingredients_usecase.g.dart';

class GetRecipesByIngredientsUseCase {
  final IngredientRepository _repository;

  GetRecipesByIngredientsUseCase(this._repository);

  Future<List<RecipeEntity>> call(List<String> ingredientNames) {
    return _repository.getRecipesByIngredients(ingredientNames);
  }
}

@riverpod
GetRecipesByIngredientsUseCase getRecipesByIngredientsUseCase(Ref ref) {
  final repository = ref.watch(ingredientRepositoryProvider);
  return GetRecipesByIngredientsUseCase(repository);
}
