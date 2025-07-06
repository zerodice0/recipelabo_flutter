import 'package:recipick_flutter/domain/entities/cooking_log_entity.dart';

/// 쿠킹 로그 데이터에 접근하기 위한 리포지토리 인터페이스
abstract class CookingLogRepository {
  /// 특정 레시피 버전의 모든 쿠킹 로그를 가져옵니다.
  Future<List<CookingLogEntity>> getCookingLogsForRecipeVersion(
    String recipeVersionId,
  );

  /// 특정 ID를 가진 쿠킹 로그를 가져옵니다.
  Future<CookingLogEntity?> getCookingLog(String id);

  /// 새로운 쿠킹 로그를 저장합니다.
  Future<void> saveCookingLog(CookingLogEntity cookingLog);

  /// 특정 ID를 가진 쿠킹 로그를 삭제합니다.
  Future<void> deleteCookingLog(String id);
}
