import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saucerer_flutter/core/di/provider.dart';
import 'package:saucerer_flutter/domain/repositories/ingredient_master_repository.dart';

part 'delete_ingredient_master_usecase.g.dart';

class DeleteIngredientMasterUseCase {
  final IngredientMasterRepository repository;

  DeleteIngredientMasterUseCase(this.repository);

  Future<void> call(String id) async {
    await repository.deleteIngredientMaster(id);
  }
}

@riverpod
DeleteIngredientMasterUseCase deleteIngredientMasterUseCase(Ref ref) {
  return DeleteIngredientMasterUseCase(ref.watch(ingredientMasterRepositoryProvider));
}

// 하위 호환성을 위한 alias
@Deprecated('Use DeleteIngredientMasterUseCase instead')
typedef DeleteSeasoningUseCase = DeleteIngredientMasterUseCase;

@Deprecated('Use deleteIngredientMasterUseCase instead')
@riverpod
DeleteSeasoningUseCase deleteSeasoningUseCase(Ref ref) {
  return DeleteSeasoningUseCase(ref.watch(ingredientMasterRepositoryProvider));
}