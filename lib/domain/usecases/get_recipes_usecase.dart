import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saucerer_flutter/domain/entities/recipe_entity.dart';
import 'package:saucerer_flutter/domain/repositories/recipe_repository.dart';
import 'package:saucerer_flutter/core/di/provider.dart';

part 'get_recipes_usecase.g.dart';

class GetRecipesUseCase {
  final RecipeRepository _repository;

  GetRecipesUseCase(this._repository);

  Future<List<RecipeEntity>> call() {
    return _repository.getRecipes();
  }
}

@riverpod
GetRecipesUseCase getRecipesUseCase(Ref ref) {
  final repository = ref.watch(recipeRepositoryProvider);
  return GetRecipesUseCase(repository);
}
