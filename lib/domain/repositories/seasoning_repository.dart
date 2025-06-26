import 'package:saucerer_flutter/domain/entities/seasoning_entity.dart';

abstract class SeasoningRepository {
  Future<List<SeasoningEntity>> getAllSeasonings();
  Future<List<SeasoningEntity>> searchSeasonings(String query);
  Future<List<SeasoningEntity>> getSeasoningsByCategory(String category);
  Future<List<SeasoningEntity>> getPopularSeasonings({int limit = 20});
  Future<SeasoningEntity?> getSeasoningById(String id);
  Future<SeasoningEntity?> getSeasoningByName(String name);
  Future<String> createSeasoning(SeasoningEntity seasoning);
  Future<void> updateSeasoning(SeasoningEntity seasoning);
  Future<void> deleteSeasoning(String id);
  Future<void> incrementUsageCount(String id);
  Future<List<String>> getAllCategories();
}