import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipick_flutter/core/di/provider.dart';
import 'package:recipick_flutter/domain/entities/ingredient_master_entity.dart';
import 'package:recipick_flutter/domain/repositories/ingredient_master_repository.dart';

part 'create_ingredient_master_usecase.g.dart';

class CreateIngredientMasterUseCase {
  final IngredientMasterRepository repository;

  CreateIngredientMasterUseCase(this.repository);

  Future<String> call({
    required String name,
    required String categoryId,
    String? subCategory,
    String? description,
  }) async {
    // 중복 체크
    final existing = await repository.getIngredientMasterByName(name.trim());
    if (existing != null) {
      throw Exception('이미 존재하는 항목입니다: ${name.trim()}');
    }

    final now = DateTime.now();
    final ingredientMaster = IngredientMasterEntity(
      id: '', // 데이터소스에서 생성
      name: name.trim(),
      categoryId: categoryId,
      subCategory: subCategory?.trim(),
      description: description?.trim(),
      createdAt: now,
      updatedAt: now,
      usageCount: 0,
    );

    return await repository.createIngredientMaster(ingredientMaster);
  }
}

@riverpod
CreateIngredientMasterUseCase createIngredientMasterUseCase(Ref ref) {
  return CreateIngredientMasterUseCase(
    ref.watch(ingredientMasterRepositoryProvider),
  );
}

// 하위 호환성을 위한 alias
@Deprecated('Use CreateIngredientMasterUseCase instead')
typedef CreateSeasoningUseCase = CreateIngredientMasterUseCase;

@Deprecated('Use createIngredientMasterUseCase instead')
@riverpod
CreateSeasoningUseCase createSeasoningUseCase(Ref ref) {
  return CreateSeasoningUseCase(ref.watch(ingredientMasterRepositoryProvider));
}
