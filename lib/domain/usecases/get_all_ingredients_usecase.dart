import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/repositories/ingredient_repository.dart';
import 'package:recipick_flutter/core/di/provider.dart';

part 'get_all_ingredients_usecase.g.dart';

class GetAllIngredientsUseCase {
  final IngredientRepository _repository;

  GetAllIngredientsUseCase(this._repository);

  Future<List<String>> call() {
    return _repository.getAllUniqueIngredientNames();
  }
}

@riverpod
GetAllIngredientsUseCase getAllIngredientsUseCase(Ref ref) {
  final repository = ref.watch(ingredientRepositoryProvider);
  return GetAllIngredientsUseCase(repository);
}
