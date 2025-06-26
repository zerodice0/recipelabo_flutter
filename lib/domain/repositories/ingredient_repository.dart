import 'package:saucerer_flutter/domain/entities/ingredient_entity.dart';
import 'package:saucerer_flutter/domain/entities/recipe_entity.dart';

/// 재료 검색 및 관리를 위한 리포지토리 인터페이스
abstract class IngredientRepository {
  /// 모든 고유한 재료 이름 목록을 가져옵니다.
  Future<List<String>> getAllUniqueIngredientNames();

  /// 특정 재료 이름들을 모두 포함하는 레시피들을 가져옵니다.
  Future<List<RecipeEntity>> getRecipesByIngredients(List<String> ingredientNames);

  /// 재료 이름으로 검색하여 매칭되는 재료 목록을 가져옵니다.
  Future<List<String>> searchIngredientsByName(String query);

  /// 가장 자주 사용되는 재료들을 가져옵니다.
  Future<List<String>> getPopularIngredients({int limit = 20});
}