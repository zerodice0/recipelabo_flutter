import 'package:saucerer_flutter/data/datasources/local/recipe_local_data_source.dart';
import 'package:saucerer_flutter/domain/entities/recipe_entity.dart';
import 'package:saucerer_flutter/domain/entities/recipe_version_entity.dart';
import 'package:saucerer_flutter/domain/repositories/recipe_repository.dart';
import 'package:saucerer_flutter/data/models/recipe_model.dart';
import 'package:saucerer_flutter/data/models/recipe_version_model.dart';
import 'package:saucerer_flutter/data/models/ingredient_model.dart';
import 'package:saucerer_flutter/data/models/step_model.dart';
import 'package:saucerer_flutter/domain/entities/ingredient_entity.dart';
import 'package:saucerer_flutter/domain/entities/step_entity.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeLocalDataSource localDataSource;

  RecipeRepositoryImpl({required this.localDataSource});

  @override
  Future<List<RecipeEntity>> getRecipes() async {
    final recipeModels = await localDataSource.getRecipes();
    return recipeModels.map((model) => _mapRecipeModelToEntity(model)).toList();
  }

  @override
  Future<RecipeEntity?> getRecipe(String id) async {
    final recipeModel = await localDataSource.getRecipe(id);
    if (recipeModel != null) {
      return _mapRecipeModelToEntity(recipeModel);
    }
    return null;
  }

  @override
  Future<List<RecipeVersionEntity>> getRecipeVersions(String recipeId) async {
    final versionModels = await localDataSource.getRecipeVersions(recipeId);
    return versionModels
        .map((model) => _mapRecipeVersionModelToEntity(model))
        .toList();
  }

  @override
  Future<RecipeVersionEntity?> getRecipeVersion(String id) async {
    final versionModel = await localDataSource.getRecipeVersion(id);
    if (versionModel != null) {
      return _mapRecipeVersionModelToEntity(versionModel);
    }
    return null;
  }

  @override
  Future<void> saveRecipe(
    RecipeEntity recipe,
    RecipeVersionEntity version,
  ) async {
    final recipeModel = _mapRecipeEntityToModel(recipe);
    final versionModel = _mapRecipeVersionEntityToModel(version);
    await localDataSource.saveRecipe(recipeModel, versionModel);
  }

  @override
  Future<bool> isVersionNameExists(
    String recipeId,
    String versionName, {
    String? excludeVersionId,
  }) async {
    final versions = await localDataSource.getRecipeVersions(recipeId);
    return versions.any(
      (version) =>
          version.versionName == versionName && version.id != excludeVersionId,
    );
  }

  @override
  Future<void> deleteRecipe(String id) async {
    await localDataSource.deleteRecipe(id);
  }

  @override
  Future<void> deleteRecipeVersion(String versionId) async {
    await localDataSource.deleteRecipeVersion(versionId);
  }

  // Mappers
  static RecipeEntity mapRecipeModelToEntity(RecipeModel model) {
    return RecipeEntity(
      id: model.id,
      authorId: model.authorId,
      latestVersionId: model.latestVersionId,
      name: model.name,
      description: model.description,
      isPublic: model.isPublic,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  RecipeEntity _mapRecipeModelToEntity(RecipeModel model) {
    return RecipeEntity(
      id: model.id,
      authorId: model.authorId,
      latestVersionId: model.latestVersionId,
      name: model.name,
      description: model.description,
      isPublic: model.isPublic,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  RecipeModel _mapRecipeEntityToModel(RecipeEntity entity) {
    return RecipeModel(
      id: entity.id,
      authorId: entity.authorId,
      latestVersionId: entity.latestVersionId,
      name: entity.name,
      description: entity.description,
      isPublic: entity.isPublic,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  RecipeVersionEntity _mapRecipeVersionModelToEntity(RecipeVersionModel model) {
    return RecipeVersionEntity(
      id: model.id,
      recipeId: model.recipeId,
      versionNumber: model.versionNumber,
      name: model.name,
      versionName: model.versionName,
      description: model.description,
      ingredients:
          model.ingredients.map((e) => _mapIngredientModelToEntity(e)).toList(),
      steps: model.steps.map((e) => _mapStepModelToEntity(e)).toList(),
      authorId: model.authorId,
      createdAt: model.createdAt,
      changeLog: model.changeLog,
    );
  }

  RecipeVersionModel _mapRecipeVersionEntityToModel(
    RecipeVersionEntity entity,
  ) {
    return RecipeVersionModel(
      id: entity.id,
      recipeId: entity.recipeId,
      versionNumber: entity.versionNumber,
      name: entity.name,
      versionName: entity.versionName,
      description: entity.description,
      ingredients:
          entity.ingredients
              .map((e) => _mapIngredientEntityToModel(e, entity.id))
              .toList(),
      steps:
          entity.steps.map((e) => _mapStepEntityToModel(e, entity.id)).toList(),
      authorId: entity.authorId,
      createdAt: entity.createdAt,
      updatedAt: DateTime.now(), // Should be handled properly
      changeLog: entity.changeLog,
    );
  }

  IngredientEntity _mapIngredientModelToEntity(IngredientModel model) {
    return IngredientEntity(
      id: model.id,
      recipeVersionId: model.recipeVersionId,
      name: model.name,
      quantity: model.quantity,
      unit: model.unit,
    );
  }

  IngredientModel _mapIngredientEntityToModel(
    IngredientEntity entity,
    String recipeVersionId,
  ) {
    return IngredientModel(
      id: entity.id,
      recipeVersionId: recipeVersionId,
      name: entity.name,
      quantity: entity.quantity,
      unit: entity.unit,
      createdAt: DateTime.now(), // Should be handled properly
      updatedAt: DateTime.now(), // Should be handled properly
    );
  }

  StepEntity _mapStepModelToEntity(StepModel model) {
    return StepEntity(
      id: model.id,
      recipeVersionId: model.recipeVersionId,
      stepNumber: model.stepNumber,
      description: model.description,
      imageUrl: model.imageUrl,
    );
  }

  StepModel _mapStepEntityToModel(StepEntity entity, String recipeVersionId) {
    return StepModel(
      id: entity.id,
      recipeVersionId: recipeVersionId,
      stepNumber: entity.stepNumber,
      description: entity.description,
      imageUrl: entity.imageUrl,
      createdAt: DateTime.now(), // Should be handled properly
      updatedAt: DateTime.now(), // Should be handled properly
    );
  }
}
