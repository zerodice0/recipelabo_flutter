import 'package:recipick_flutter/data/datasources/local/seasoning_local_data_source.dart';
import 'package:recipick_flutter/data/models/ingredient_master_model.dart';
import 'package:recipick_flutter/domain/entities/ingredient_master_entity.dart';
import 'package:recipick_flutter/domain/repositories/ingredient_master_repository.dart';

class IngredientMasterRepositoryImpl implements IngredientMasterRepository {
  final SeasoningLocalDataSource localDataSource;

  IngredientMasterRepositoryImpl({required this.localDataSource});

  @override
  Future<List<IngredientMasterEntity>> getAllIngredientMasters() async {
    final models = await localDataSource.getAllSeasonings();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<IngredientMasterEntity>> searchIngredientMasters(
    String query,
  ) async {
    final models = await localDataSource.searchSeasonings(query);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<IngredientMasterEntity>> getIngredientMastersByCategory(
    String category,
  ) async {
    final models = await localDataSource.getSeasoningsByCategory(category);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<IngredientMasterEntity>> getPopularIngredientMasters({
    int limit = 20,
  }) async {
    final models = await localDataSource.getPopularSeasonings(limit: limit);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<IngredientMasterEntity?> getIngredientMasterById(String id) async {
    final model = await localDataSource.getSeasoningById(id);
    return model?.toEntity();
  }

  @override
  Future<IngredientMasterEntity?> getIngredientMasterByName(String name) async {
    final model = await localDataSource.getSeasoningByName(name);
    return model?.toEntity();
  }

  @override
  Future<String> createIngredientMaster(
    IngredientMasterEntity ingredientMaster,
  ) async {
    final model = IngredientMasterModelX.fromEntity(ingredientMaster);
    return await localDataSource.createSeasoning(model);
  }

  @override
  Future<void> updateIngredientMaster(
    IngredientMasterEntity ingredientMaster,
  ) async {
    final model = IngredientMasterModelX.fromEntity(ingredientMaster);
    await localDataSource.updateSeasoning(model);
  }

  @override
  Future<void> deleteIngredientMaster(String id) async {
    await localDataSource.deleteSeasoning(id);
  }

  @override
  Future<void> incrementUsageCount(String id) async {
    await localDataSource.incrementUsageCount(id);
  }

  @override
  Future<List<String>> getAllCategories() async {
    return await localDataSource.getAllCategories();
  }
}

// 하위 호환성을 위한 alias
@Deprecated('Use IngredientMasterRepositoryImpl instead')
typedef SeasoningRepositoryImpl = IngredientMasterRepositoryImpl;
