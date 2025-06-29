import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saucerer_flutter/core/di/provider.dart';
import 'package:saucerer_flutter/domain/entities/seasoning_entity.dart';
import 'package:saucerer_flutter/domain/repositories/seasoning_repository.dart';

part 'create_seasoning_usecase.g.dart';

class CreateSeasoningUseCase {
  final SeasoningRepository repository;

  CreateSeasoningUseCase(this.repository);

  Future<String> call({
    required String name,
    required String categoryId,
    String? subCategory,
    String? description,
  }) async {
    // 중복 체크
    final existing = await repository.getSeasoningByName(name.trim());
    if (existing != null) {
      throw Exception('이미 존재하는 항목입니다: ${name.trim()}');
    }

    final now = DateTime.now();
    final seasoning = SeasoningEntity(
      id: '', // 데이터소스에서 생성
      name: name.trim(),
      categoryId: categoryId,
      subCategory: subCategory?.trim(),
      description: description?.trim(),
      createdAt: now,
      updatedAt: now,
      usageCount: 0,
    );

    return await repository.createSeasoning(seasoning);
  }
}

@riverpod
CreateSeasoningUseCase createSeasoningUseCase(Ref ref) {
  return CreateSeasoningUseCase(ref.watch(seasoningRepositoryProvider));
}