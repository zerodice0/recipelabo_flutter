import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saucerer_flutter/domain/entities/recipe_entity.dart';
import 'package:saucerer_flutter/domain/entities/recipe_version_entity.dart';
import 'package:saucerer_flutter/domain/repositories/recipe_repository.dart';
import 'package:saucerer_flutter/core/di/provider.dart';

part 'get_recipe_with_versions_usecase.g.dart';

class GetRecipeWithVersionsUseCase {
  final RecipeRepository _repository;

  GetRecipeWithVersionsUseCase(this._repository);

  Future<(RecipeEntity?, List<RecipeVersionEntity>)> call(String recipeId) async {
    final recipe = await _repository.getRecipe(recipeId);
    final versions = await _repository.getRecipeVersions(recipeId);
    return (recipe, versions);
  }
}

@riverpod
GetRecipeWithVersionsUseCase getRecipeWithVersionsUseCase(Ref ref) {
  final repository = ref.watch(recipeRepositoryProvider);
  return GetRecipeWithVersionsUseCase(repository);
}