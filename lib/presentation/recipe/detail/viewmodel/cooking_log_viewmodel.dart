import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/entities/cooking_log_entity.dart';
import 'package:recipick_flutter/domain/usecases/get_cooking_logs_usecase.dart';
import 'package:recipick_flutter/domain/usecases/delete_cooking_log_usecase.dart';

part 'cooking_log_viewmodel.g.dart';

@riverpod
Future<List<CookingLogEntity>> cookingLogViewModel(
  Ref ref,
  String recipeVersionId,
) async {
  final useCase = ref.watch(getCookingLogsUseCaseProvider);
  return await useCase(recipeVersionId);
}

@riverpod
class CookingLogActions extends _$CookingLogActions {
  @override
  String build() {
    // 더미 상태 반환
    return '';
  }

  /// 쿠킹 로그를 삭제합니다
  ///
  /// [cookingLogId] 삭제할 쿠킹 로그의 ID
  /// [recipeVersionId] 삭제 후 새로고침할 레시피 버전 ID
  ///
  /// Returns: 삭제 성공 시 true, 실패 시 false
  Future<bool> deleteCookingLog(String cookingLogId, String recipeVersionId) async {
    try {
      final deleteUseCase = ref.read(deleteCookingLogUseCaseProvider);
      await deleteUseCase(cookingLogId);
      
      // 삭제 후 쿠킹 로그 리스트 새로고침
      ref.invalidate(cookingLogViewModelProvider(recipeVersionId));
      
      return true;
    } catch (e) {
      // 에러 발생 시 false 반환
      return false;
    }
  }
}
