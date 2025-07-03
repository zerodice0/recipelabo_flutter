import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saucerer_flutter/core/di/provider.dart';
import 'package:saucerer_flutter/domain/entities/ingredient_master_entity.dart';
import 'package:saucerer_flutter/domain/repositories/ingredient_master_repository.dart';

part 'get_all_ingredient_masters_usecase.g.dart';

class GetAllIngredientMastersUseCase {
  final IngredientMasterRepository repository;

  GetAllIngredientMastersUseCase(this.repository);

  Future<List<IngredientMasterEntity>> call() async {
    return await repository.getAllIngredientMasters();
  }
}

@riverpod
GetAllIngredientMastersUseCase getAllIngredientMastersUseCase(Ref ref) {
  return GetAllIngredientMastersUseCase(ref.watch(ingredientMasterRepositoryProvider));
}

// 하위 호환성을 위한 alias
@Deprecated('Use GetAllIngredientMastersUseCase instead')
typedef GetAllSeasoningsUseCase = GetAllIngredientMastersUseCase;

@Deprecated('Use getAllIngredientMastersUseCase instead')
@riverpod
GetAllSeasoningsUseCase getAllSeasoningsUseCase(Ref ref) {
  return GetAllSeasoningsUseCase(ref.watch(ingredientMasterRepositoryProvider));
}