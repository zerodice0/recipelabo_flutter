import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saucerer_flutter/core/di/provider.dart';
import 'package:saucerer_flutter/domain/repositories/recipe_repository.dart';

part 'check_version_name_exists_usecase.g.dart';

/// 버전명 중복 검사 유스케이스
class CheckVersionNameExistsUseCase {
  final RecipeRepository repository;

  CheckVersionNameExistsUseCase(this.repository);

  /// 특정 레시피에서 버전명이 중복되는지 확인
  /// 
  /// [recipeId] 레시피 ID
  /// [versionName] 확인할 버전명
  /// [excludeVersionId] 제외할 버전 ID (기존 버전 수정 시 사용)
  /// 
  /// Returns: 중복되면 true, 중복되지 않으면 false
  Future<bool> call({
    required String recipeId,
    required String versionName,
    String? excludeVersionId,
  }) async {
    // 빈 문자열이나 null은 중복으로 간주하지 않음
    if (versionName.trim().isEmpty) {
      return false;
    }
    
    return await repository.isVersionNameExists(
      recipeId, 
      versionName.trim(), 
      excludeVersionId: excludeVersionId,
    );
  }
}

@riverpod
CheckVersionNameExistsUseCase checkVersionNameExistsUseCase(Ref ref) {
  return CheckVersionNameExistsUseCase(ref.watch(recipeRepositoryProvider));
}