import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saucerer_flutter/domain/repositories/recipe_repository.dart';
import 'package:saucerer_flutter/core/di/provider.dart';

part 'delete_recipe_usecase.g.dart';

class DeleteRecipeUseCase {
  final RecipeRepository _repository;

  DeleteRecipeUseCase(this._repository);

  Future<void> call(String id) {
    return _repository.deleteRecipe(id);
  }
}

@riverpod
DeleteRecipeUseCase deleteRecipeUseCase(Ref ref) {
  final repository = ref.watch(recipeRepositoryProvider);
  return DeleteRecipeUseCase(repository);
}
