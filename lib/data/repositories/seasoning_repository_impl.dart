import 'package:saucerer_flutter/data/datasources/local/seasoning_local_data_source.dart';
import 'package:saucerer_flutter/data/models/seasoning_model.dart';
import 'package:saucerer_flutter/domain/entities/seasoning_entity.dart';
import 'package:saucerer_flutter/domain/repositories/seasoning_repository.dart';

class SeasoningRepositoryImpl implements SeasoningRepository {
  final SeasoningLocalDataSource localDataSource;

  SeasoningRepositoryImpl({required this.localDataSource});

  @override
  Future<List<SeasoningEntity>> getAllSeasonings() async {
    final models = await localDataSource.getAllSeasonings();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<SeasoningEntity>> searchSeasonings(String query) async {
    final models = await localDataSource.searchSeasonings(query);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<SeasoningEntity>> getSeasoningsByCategory(String category) async {
    final models = await localDataSource.getSeasoningsByCategory(category);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<SeasoningEntity>> getPopularSeasonings({int limit = 20}) async {
    final models = await localDataSource.getPopularSeasonings(limit: limit);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<SeasoningEntity?> getSeasoningById(String id) async {
    final model = await localDataSource.getSeasoningById(id);
    return model?.toEntity();
  }

  @override
  Future<SeasoningEntity?> getSeasoningByName(String name) async {
    final model = await localDataSource.getSeasoningByName(name);
    return model?.toEntity();
  }

  @override
  Future<String> createSeasoning(SeasoningEntity seasoning) async {
    final model = SeasoningModelX.fromEntity(seasoning);
    return await localDataSource.createSeasoning(model);
  }

  @override
  Future<void> updateSeasoning(SeasoningEntity seasoning) async {
    final model = SeasoningModelX.fromEntity(seasoning);
    await localDataSource.updateSeasoning(model);
  }

  @override
  Future<void> deleteSeasoning(String id) async {
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