import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saucerer_flutter/domain/repositories/recipe_repository.dart';
import 'package:saucerer_flutter/core/di/provider.dart';

part 'delete_recipe_version_usecase.g.dart';

class DeleteRecipeVersionUseCase {
  final RecipeRepository _repository;

  DeleteRecipeVersionUseCase(this._repository);

  Future<void> call(String versionId) {
    return _repository.deleteRecipeVersion(versionId);
  }
}

@riverpod
DeleteRecipeVersionUseCase deleteRecipeVersionUseCase(Ref ref) {
  final repository = ref.watch(recipeRepositoryProvider);
  return DeleteRecipeVersionUseCase(repository);
}
