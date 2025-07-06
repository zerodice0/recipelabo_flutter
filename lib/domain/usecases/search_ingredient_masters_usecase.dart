import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipick_flutter/core/di/provider.dart';
import 'package:recipick_flutter/domain/entities/ingredient_master_entity.dart';
import 'package:recipick_flutter/domain/repositories/ingredient_master_repository.dart';

part 'search_ingredient_masters_usecase.g.dart';

class SearchIngredientMastersUseCase {
  final IngredientMasterRepository repository;

  SearchIngredientMastersUseCase(this.repository);

  Future<List<IngredientMasterEntity>> call(String query) async {
    if (query.trim().isEmpty) {
      return await repository.getPopularIngredientMasters();
    }
    return await repository.searchIngredientMasters(query.trim());
  }
}

@riverpod
SearchIngredientMastersUseCase searchIngredientMastersUseCase(Ref ref) {
  return SearchIngredientMastersUseCase(
    ref.watch(ingredientMasterRepositoryProvider),
  );
}

// 하위 호환성을 위한 alias
@Deprecated('Use SearchIngredientMastersUseCase instead')
typedef SearchSeasoningsUseCase = SearchIngredientMastersUseCase;

@Deprecated('Use searchIngredientMastersUseCase instead')
@riverpod
SearchSeasoningsUseCase searchSeasoningsUseCase(Ref ref) {
  return SearchSeasoningsUseCase(ref.watch(ingredientMasterRepositoryProvider));
}
