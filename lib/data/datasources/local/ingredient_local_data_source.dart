import 'package:sqflite/sqflite.dart';
import 'package:saucerer_flutter/data/models/recipe_model.dart';
import './database_helper.dart';

abstract class IngredientLocalDataSource {
  Future<List<String>> getAllUniqueIngredientNames();
  Future<List<RecipeModel>> getRecipesByIngredients(List<String> ingredientNames);
  Future<List<String>> searchIngredientsByName(String query);
  Future<List<String>> getPopularIngredients({int limit = 20});
}

class IngredientLocalDataSourceImpl implements IngredientLocalDataSource {
  final DatabaseHelper _dbHelper;

  IngredientLocalDataSourceImpl(this._dbHelper);

  @override
  Future<List<String>> getAllUniqueIngredientNames() async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery('''
      SELECT DISTINCT LOWER(TRIM(name)) as name 
      FROM ingredients 
      WHERE isDeleted = 0 
      ORDER BY name ASC
    ''');
    
    return result.map((row) => row['name'] as String).toList();
  }

  @override
  Future<List<RecipeModel>> getRecipesByIngredients(List<String> ingredientNames) async {
    if (ingredientNames.isEmpty) {
      return [];
    }

    final db = await _dbHelper.database;
    
    // 각 재료 이름을 소문자로 변환하여 대소문자 구분 없이 검색
    final lowerIngredientNames = ingredientNames.map((name) => name.toLowerCase()).toList();
    final placeholders = lowerIngredientNames.map((_) => '?').join(',');
    
    final result = await db.rawQuery('''
      SELECT DISTINCT r.* 
      FROM recipes r
      INNER JOIN recipe_versions rv ON r.id = rv.recipeId
      INNER JOIN ingredients i ON rv.id = i.recipeVersionId
      WHERE r.isDeleted = 0 
        AND rv.isDeleted = 0 
        AND i.isDeleted = 0
        AND LOWER(TRIM(i.name)) IN ($placeholders)
      GROUP BY r.id
      HAVING COUNT(DISTINCT LOWER(TRIM(i.name))) = ?
      ORDER BY r.updatedAt DESC
    ''', [...lowerIngredientNames, ingredientNames.length]);

    return result.map((map) => RecipeModelExtension.fromMap(map)).toList();
  }

  @override
  Future<List<String>> searchIngredientsByName(String query) async {
    if (query.trim().isEmpty) {
      return await getAllUniqueIngredientNames();
    }

    final db = await _dbHelper.database;
    final lowerQuery = query.toLowerCase().trim();
    
    final result = await db.rawQuery('''
      SELECT DISTINCT LOWER(TRIM(name)) as name 
      FROM ingredients 
      WHERE isDeleted = 0 
        AND LOWER(TRIM(name)) LIKE ?
      ORDER BY 
        CASE 
          WHEN LOWER(TRIM(name)) = ? THEN 1
          WHEN LOWER(TRIM(name)) LIKE ? THEN 2
          ELSE 3
        END,
        name ASC
      LIMIT 50
    ''', ['%$lowerQuery%', lowerQuery, '$lowerQuery%']);

    return result.map((row) => row['name'] as String).toList();
  }

  @override
  Future<List<String>> getPopularIngredients({int limit = 20}) async {
    final db = await _dbHelper.database;
    
    final result = await db.rawQuery('''
      SELECT LOWER(TRIM(i.name)) as name, COUNT(*) as usage_count
      FROM ingredients i
      INNER JOIN recipe_versions rv ON i.recipeVersionId = rv.id
      INNER JOIN recipes r ON rv.recipeId = r.id
      WHERE i.isDeleted = 0 
        AND rv.isDeleted = 0 
        AND r.isDeleted = 0
      GROUP BY LOWER(TRIM(i.name))
      ORDER BY usage_count DESC, name ASC
      LIMIT ?
    ''', [limit]);

    return result.map((row) => row['name'] as String).toList();
  }
}