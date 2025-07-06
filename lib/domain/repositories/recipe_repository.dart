import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/domain/entities/recipe_version_entity.dart';

/// 레시피 데이터에 접근하기 위한 리포지토리 인터페이스
abstract class RecipeRepository {
  /// 모든 레시피 목록을 가져옵니다.
  Future<List<RecipeEntity>> getRecipes();

  /// 특정 ID를 가진 레시피를 가져옵니다.
  Future<RecipeEntity?> getRecipe(String id);

  /// 특정 레시피의 모든 버전을 가져옵니다.
  Future<List<RecipeVersionEntity>> getRecipeVersions(String recipeId);

  /// 특정 ID를 가진 레시피 버전을 가져옵니다.
  Future<RecipeVersionEntity?> getRecipeVersion(String id);

  /// 특정 레시피에서 버전명이 중복되는지 확인합니다.
  Future<bool> isVersionNameExists(
    String recipeId,
    String versionName, {
    String? excludeVersionId,
  });

  /// 새로운 레시피와 첫 번째 버전을 저장합니다.
  Future<void> saveRecipe(RecipeEntity recipe, RecipeVersionEntity version);

  /// 특정 ID를 가진 레시피를 삭제합니다.
  Future<void> deleteRecipe(String id);

  /// 특정 ID를 가진 레시피 버전을 삭제합니다.
  Future<void> deleteRecipeVersion(String versionId);
}
