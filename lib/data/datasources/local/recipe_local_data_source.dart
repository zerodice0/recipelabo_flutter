import 'package:sqflite/sqflite.dart';
import 'package:saucerer_flutter/data/models/ingredient_model.dart';
import 'package:saucerer_flutter/data/models/step_model.dart';
import 'package:saucerer_flutter/data/models/recipe_model.dart';
import 'package:saucerer_flutter/data/models/recipe_version_model.dart';
import './database_helper.dart';

abstract class RecipeLocalDataSource {
  Future<List<RecipeModel>> getRecipes();
  Future<RecipeModel?> getRecipe(String id);
  Future<List<RecipeVersionModel>> getRecipeVersions(String recipeId);
  Future<RecipeVersionModel?> getRecipeVersion(String id);
  Future<void> saveRecipe(RecipeModel recipe, RecipeVersionModel version);
  Future<void> deleteRecipe(String id);
  Future<void> deleteRecipeVersion(String versionId);
}

class RecipeLocalDataSourceImpl implements RecipeLocalDataSource {
  final DatabaseHelper _dbHelper;

  RecipeLocalDataSourceImpl(this._dbHelper);

  @override
  Future<List<RecipeModel>> getRecipes() async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      'recipes',
      where: 'isDeleted = ?',
      whereArgs: [0],
    );
    return maps.map((map) => RecipeModelExtension.fromMap(map)).toList();
  }

  @override
  Future<RecipeModel?> getRecipe(String id) async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      'recipes',
      where: 'id = ? AND isDeleted = ?',
      whereArgs: [id, 0],
    );

    if (maps.isNotEmpty) {
      return RecipeModelExtension.fromMap(maps.first);
    }
    return null;
  }

  @override
  Future<List<RecipeVersionModel>> getRecipeVersions(String recipeId) async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      'recipe_versions',
      where: 'recipeId = ? AND isDeleted = ?',
      whereArgs: [recipeId, 0],
      orderBy: 'versionNumber DESC',
    );

    List<RecipeVersionModel> versions = [];
    for (final versionMap in maps) {
      final versionId = versionMap['id'] as String;
      final ingredients = await _getIngredientsForVersion(db, versionId);
      final steps = await _getStepsForVersion(db, versionId);

      var version = RecipeVersionModelExtension.fromMap(versionMap);
      version = version.copyWith(ingredients: ingredients, steps: steps);
      versions.add(version);
    }
    return versions;
  }

  @override
  Future<RecipeVersionModel?> getRecipeVersion(String id) async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      'recipe_versions',
      where: 'id = ? AND isDeleted = ?',
      whereArgs: [id, 0],
    );

    if (maps.isNotEmpty) {
      final versionMap = maps.first;
      final ingredients = await _getIngredientsForVersion(db, id);
      final steps = await _getStepsForVersion(db, id);

      // RecipeVersionModelExtension.fromMap은 ingredients와 steps를 빈 리스트로 초기화하고, 따로 설정
      var version = RecipeVersionModelExtension.fromMap(versionMap);
      version = version.copyWith(ingredients: ingredients, steps: steps);

      return version;
    }
    return null;
  }

  Future<List<IngredientModel>> _getIngredientsForVersion(
    Database db,
    String versionId,
  ) async {
    final maps = await db.query(
      'ingredients',
      where: 'recipeVersionId = ? AND isDeleted = ?',
      whereArgs: [versionId, 0],
    );
    return maps.map((map) => IngredientModelExtension.fromMap(map)).toList();
  }

  Future<List<StepModel>> _getStepsForVersion(
    Database db,
    String versionId,
  ) async {
    final maps = await db.query(
      'steps',
      where: 'recipeVersionId = ? AND isDeleted = ?',
      whereArgs: [versionId, 0],
    );
    return maps.map((map) => StepModelExtension.fromMap(map)).toList();
  }

  @override
  Future<void> saveRecipe(
    RecipeModel recipe,
    RecipeVersionModel version,
  ) async {
    final db = await _dbHelper.database;
    await db.transaction((txn) async {
      await txn.insert(
        'recipes',
        recipe.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      await txn.insert(
        'recipe_versions',
        version.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      for (final ingredient in version.ingredients) {
        await txn.insert(
          'ingredients',
          ingredient.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      for (final step in version.steps) {
        await txn.insert(
          'steps',
          step.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  @override
  Future<void> deleteRecipe(String id) async {
    final db = await _dbHelper.database;
    final now = DateTime.now().toIso8601String();
    await db.update(
      'recipes',
      {'isDeleted': 1, 'updatedAt': now},
      where: 'id = ?',
      whereArgs: [id],
    );
    await db.update(
      'recipe_versions',
      {'isDeleted': 1},
      where: 'recipeId = ?',
      whereArgs: [id],
    );
    // Also mark ingredients and steps as deleted
    final versions = await db.query(
      'recipe_versions',
      where: 'recipeId = ?',
      whereArgs: [id],
      columns: ['id'],
    );
    for (final version in versions) {
      final versionId = version['id'] as String;
      await db.update(
        'ingredients',
        {'isDeleted': 1, 'updatedAt': now},
        where: 'recipeVersionId = ?',
        whereArgs: [versionId],
      );
      await db.update(
        'steps',
        {'isDeleted': 1, 'updatedAt': now},
        where: 'recipeVersionId = ?',
        whereArgs: [versionId],
      );
    }
  }

  @override
  Future<void> deleteRecipeVersion(String versionId) async {
    final db = await _dbHelper.database;
    final now = DateTime.now().toIso8601String();

    // 버전을 삭제로 표시
    await db.update(
      'recipe_versions',
      {'isDeleted': 1},
      where: 'id = ?',
      whereArgs: [versionId],
    );

    // 해당 버전의 재료와 단계도 삭제로 표시
    await db.update(
      'ingredients',
      {'isDeleted': 1, 'updatedAt': now},
      where: 'recipeVersionId = ?',
      whereArgs: [versionId],
    );
    await db.update(
      'steps',
      {'isDeleted': 1, 'updatedAt': now},
      where: 'recipeVersionId = ?',
      whereArgs: [versionId],
    );
  }
}
