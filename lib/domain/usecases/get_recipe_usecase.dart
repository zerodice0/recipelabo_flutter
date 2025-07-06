import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipick_flutter/core/di/provider.dart';
import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/domain/entities/recipe_version_entity.dart';
import 'package:recipick_flutter/domain/repositories/recipe_repository.dart';

part 'get_recipe_usecase.g.dart';

class GetRecipeUseCase {
  final RecipeRepository repository;

  GetRecipeUseCase(this.repository);

  Future<(RecipeEntity, RecipeVersionEntity)> call(String recipeId) async {
    final recipe = await repository.getRecipe(recipeId);
    if (recipe == null) {
      throw Exception('레시피를 찾을 수 없습니다: $recipeId');
    }

    final latestVersion = await repository.getRecipeVersion(
      recipe.latestVersionId,
    );
    if (latestVersion == null) {
      throw Exception('레시피 버전을 찾을 수 없습니다: ${recipe.latestVersionId}');
    }

    return (recipe, latestVersion);
  }
}

@riverpod
GetRecipeUseCase getRecipeUseCase(Ref ref) {
  return GetRecipeUseCase(ref.watch(recipeRepositoryProvider));
}
