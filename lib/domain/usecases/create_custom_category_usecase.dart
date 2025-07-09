import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/entities/category_entity.dart';

part 'create_custom_category_usecase.g.dart';

@riverpod
CreateCustomCategoryUseCase createCustomCategoryUseCase(Ref ref) {
  return CreateCustomCategoryUseCase();
}

class CreateCustomCategoryUseCase {
  CreateCustomCategoryUseCase();

  Future<CategoryEntity> call({
    required String name,
    String? displayName,
    String? description,
    String? iconCode,
    String? colorCode,
  }) async {
    // 이름 검증
    if (name.trim().isEmpty) {
      throw ArgumentError('카테고리 이름은 필수입니다.');
    }

    // 임시로 새 카테고리 생성 (실제 구현은 나중에)
    final now = DateTime.now();
    return CategoryEntity(
      id: 'custom_${now.millisecondsSinceEpoch}',
      name: name.trim(),
      displayName: displayName?.trim() ?? name.trim(),
      description: description?.trim(),
      iconCode: iconCode,
      type: CategoryType.custom,
      createdAt: now,
      updatedAt: now,
    );
  }
}
