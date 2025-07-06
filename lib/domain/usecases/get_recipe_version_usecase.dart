import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/entities/recipe_version_entity.dart';
import 'package:recipick_flutter/domain/repositories/recipe_repository.dart';
import 'package:recipick_flutter/core/di/provider.dart';

part 'get_recipe_version_usecase.g.dart';

class GetRecipeVersionUseCase {
  final RecipeRepository _repository;

  GetRecipeVersionUseCase(this._repository);

  Future<RecipeVersionEntity?> call(String id) {
    return _repository.getRecipeVersion(id);
  }
}

@riverpod
GetRecipeVersionUseCase getRecipeVersionUseCase(Ref ref) {
  final repository = ref.watch(recipeRepositoryProvider);
  return GetRecipeVersionUseCase(repository);
}
