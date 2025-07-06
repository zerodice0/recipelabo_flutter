import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/repositories/ingredient_repository.dart';
import 'package:recipick_flutter/core/di/provider.dart';

part 'search_ingredients_usecase.g.dart';

class SearchIngredientsUseCase {
  final IngredientRepository _repository;

  SearchIngredientsUseCase(this._repository);

  Future<List<String>> call(String query) {
    return _repository.searchIngredientsByName(query);
  }
}

@riverpod
SearchIngredientsUseCase searchIngredientsUseCase(Ref ref) {
  final repository = ref.watch(ingredientRepositoryProvider);
  return SearchIngredientsUseCase(repository);
}
