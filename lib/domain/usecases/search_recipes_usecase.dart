import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/core/di/provider.dart';
import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/domain/repositories/recipe_repository.dart';

part 'search_recipes_usecase.g.dart';

class SearchRecipesUseCase {
  final RecipeRepository _repository;

  SearchRecipesUseCase(this._repository);

  Future<List<RecipeEntity>> call(String query) {
    return _repository.searchRecipes(query);
  }
}

@riverpod
SearchRecipesUseCase searchRecipesUseCase(Ref ref) {
  final repository = ref.watch(recipeRepositoryProvider);
  return SearchRecipesUseCase(repository);
}
