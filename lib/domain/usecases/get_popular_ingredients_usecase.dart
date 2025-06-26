import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saucerer_flutter/domain/repositories/ingredient_repository.dart';
import 'package:saucerer_flutter/core/di/provider.dart';

part 'get_popular_ingredients_usecase.g.dart';

class GetPopularIngredientsUseCase {
  final IngredientRepository _repository;

  GetPopularIngredientsUseCase(this._repository);

  Future<List<String>> call({int limit = 20}) {
    return _repository.getPopularIngredients(limit: limit);
  }
}

@riverpod
GetPopularIngredientsUseCase getPopularIngredientsUseCase(Ref ref) {
  final repository = ref.watch(ingredientRepositoryProvider);
  return GetPopularIngredientsUseCase(repository);
}