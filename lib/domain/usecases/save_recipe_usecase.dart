import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/domain/entities/recipe_version_entity.dart';
import 'package:recipick_flutter/domain/repositories/recipe_repository.dart';
import 'package:recipick_flutter/core/di/provider.dart';

part 'save_recipe_usecase.g.dart';

class SaveRecipeUseCase {
  final RecipeRepository _repository;

  SaveRecipeUseCase(this._repository);

  Future<void> call(RecipeEntity recipe, RecipeVersionEntity version) {
    return _repository.saveRecipe(recipe, version);
  }
}

@riverpod
SaveRecipeUseCase saveRecipeUseCase(Ref ref) {
  final repository = ref.watch(recipeRepositoryProvider);
  return SaveRecipeUseCase(repository);
}
