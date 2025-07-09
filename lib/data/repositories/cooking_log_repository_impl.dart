import 'package:recipick_flutter/data/datasources/local/cooking_log_local_data_source.dart';
import 'package:recipick_flutter/domain/entities/cooking_log_entity.dart';
import 'package:recipick_flutter/domain/repositories/cooking_log_repository.dart';
import 'package:recipick_flutter/data/models/cooking_log_model.dart';

class CookingLogRepositoryImpl implements CookingLogRepository {
  final CookingLogLocalDataSource localDataSource;

  CookingLogRepositoryImpl({required this.localDataSource});

  @override
  Future<List<CookingLogEntity>> getCookingLogsForRecipeVersion(
    String recipeVersionId,
  ) async {
    final cookingLogModels = await localDataSource
        .getCookingLogsForRecipeVersion(recipeVersionId);
    return cookingLogModels
        .map((model) => _mapCookingLogModelToEntity(model))
        .toList();
  }

  @override
  Future<CookingLogEntity?> getCookingLog(String id) async {
    final cookingLogModel = await localDataSource.getCookingLog(id);
    if (cookingLogModel != null) {
      return _mapCookingLogModelToEntity(cookingLogModel);
    }
    return null;
  }

  @override
  Future<void> saveCookingLog(CookingLogEntity cookingLog) async {
    final cookingLogModel = _mapCookingLogEntityToModel(cookingLog);
    await localDataSource.saveCookingLog(cookingLogModel);
  }

  @override
  Future<void> deleteCookingLog(String id) async {
    await localDataSource.deleteCookingLog(id);
  }

  // Mappers
  CookingLogEntity _mapCookingLogModelToEntity(CookingLogModel model) {
    return CookingLogEntity(
      id: model.id,
      recipeVersionId: model.recipeVersionId,
      authorId: model.authorId,
      title: model.title,
      memo: model.memo,
      base64EncodedImageData: model.base64EncodedImageData,
      cookedAt: model.cookedAt,
      createdAt: model.createdAt,
    );
  }

  CookingLogModel _mapCookingLogEntityToModel(CookingLogEntity entity) {
    return CookingLogModel(
      id: entity.id,
      recipeVersionId: entity.recipeVersionId,
      authorId: entity.authorId,
      title: entity.title,
      memo: entity.memo,
      base64EncodedImageData: entity.base64EncodedImageData,
      cookedAt: entity.cookedAt,
      createdAt: entity.createdAt,
      updatedAt: DateTime.now(),
    );
  }
}
