import 'package:saucerer_flutter/domain/entities/ingredient_master_entity.dart';

abstract class IngredientMasterRepository {
  Future<List<IngredientMasterEntity>> getAllIngredientMasters();
  Future<List<IngredientMasterEntity>> searchIngredientMasters(String query);
  Future<List<IngredientMasterEntity>> getIngredientMastersByCategory(String category);
  Future<List<IngredientMasterEntity>> getPopularIngredientMasters({int limit = 20});
  Future<IngredientMasterEntity?> getIngredientMasterById(String id);
  Future<IngredientMasterEntity?> getIngredientMasterByName(String name);
  Future<String> createIngredientMaster(IngredientMasterEntity ingredientMaster);
  Future<void> updateIngredientMaster(IngredientMasterEntity ingredientMaster);
  Future<void> deleteIngredientMaster(String id);
  Future<void> incrementUsageCount(String id);
  Future<List<String>> getAllCategories();
}

// 하위 호환성을 위한 alias
@Deprecated('Use IngredientMasterRepository instead')
typedef SeasoningRepository = IngredientMasterRepository;