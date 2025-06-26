import 'package:sqflite/sqflite.dart';
import 'package:saucerer_flutter/data/models/cooking_log_model.dart';
import './database_helper.dart';

abstract class CookingLogLocalDataSource {
  Future<List<CookingLogModel>> getCookingLogsForRecipeVersion(String recipeVersionId);
  Future<CookingLogModel?> getCookingLog(String id);
  Future<void> saveCookingLog(CookingLogModel cookingLog);
  Future<void> deleteCookingLog(String id);
}

class CookingLogLocalDataSourceImpl implements CookingLogLocalDataSource {
  final DatabaseHelper _dbHelper;

  CookingLogLocalDataSourceImpl(this._dbHelper);

  @override
  Future<List<CookingLogModel>> getCookingLogsForRecipeVersion(String recipeVersionId) async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      'cooking_logs', 
      where: 'recipeVersionId = ? AND isDeleted = ?', 
      whereArgs: [recipeVersionId, 0],
      orderBy: 'cookedAt DESC'
    );
    return maps.map((map) => CookingLogModelExtension.fromMap(map)).toList();
  }

  @override
  Future<CookingLogModel?> getCookingLog(String id) async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      'cooking_logs', 
      where: 'id = ? AND isDeleted = ?', 
      whereArgs: [id, 0]
    );
    
    if (maps.isNotEmpty) {
      return CookingLogModelExtension.fromMap(maps.first);
    }
    return null;
  }

  @override
  Future<void> saveCookingLog(CookingLogModel cookingLog) async {
    final db = await _dbHelper.database;
    await db.insert(
      'cooking_logs', 
      cookingLog.toMap(), 
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  @override
  Future<void> deleteCookingLog(String id) async {
    final db = await _dbHelper.database;
    final now = DateTime.now().toIso8601String();
    await db.update(
      'cooking_logs', 
      {'isDeleted': 1, 'updatedAt': now}, 
      where: 'id = ?', 
      whereArgs: [id]
    );
  }
}