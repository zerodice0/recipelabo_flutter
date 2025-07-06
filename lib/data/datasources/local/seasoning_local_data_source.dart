import 'package:recipick_flutter/data/datasources/local/database_helper.dart';
import 'package:recipick_flutter/data/models/ingredient_master_model.dart';
import 'package:uuid/uuid.dart';

abstract class SeasoningLocalDataSource {
  Future<List<IngredientMasterModel>> getAllSeasonings();
  Future<List<IngredientMasterModel>> searchSeasonings(String query);
  Future<List<IngredientMasterModel>> getSeasoningsByCategory(String category);
  Future<List<IngredientMasterModel>> getPopularSeasonings({int limit = 20});
  Future<IngredientMasterModel?> getSeasoningById(String id);
  Future<IngredientMasterModel?> getSeasoningByName(String name);
  Future<String> createSeasoning(IngredientMasterModel seasoning);
  Future<void> updateSeasoning(IngredientMasterModel seasoning);
  Future<void> deleteSeasoning(String id);
  Future<void> incrementUsageCount(String id);
  Future<List<String>> getAllCategories();
}

class SeasoningLocalDataSourceImpl implements SeasoningLocalDataSource {
  final DatabaseHelper _databaseHelper;
  final Uuid _uuid = const Uuid();

  SeasoningLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<List<IngredientMasterModel>> getAllSeasonings() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'seasonings',
      orderBy: 'name ASC',
    );

    return maps.map((map) => IngredientMasterModelX.fromSqlMap(map)).toList();
  }

  @override
  Future<List<IngredientMasterModel>> searchSeasonings(String query) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'seasonings',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
      orderBy: 'usage_count DESC, name ASC',
    );

    return maps.map((map) => IngredientMasterModelX.fromSqlMap(map)).toList();
  }

  @override
  Future<List<IngredientMasterModel>> getSeasoningsByCategory(
    String category,
  ) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'seasonings',
      where: 'category = ?',
      whereArgs: [category],
      orderBy: 'usage_count DESC, name ASC',
    );

    return maps.map((map) => IngredientMasterModelX.fromSqlMap(map)).toList();
  }

  @override
  Future<List<IngredientMasterModel>> getPopularSeasonings({
    int limit = 20,
  }) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'seasonings',
      orderBy: 'usage_count DESC, name ASC',
      limit: limit,
    );

    return maps.map((map) => IngredientMasterModelX.fromSqlMap(map)).toList();
  }

  @override
  Future<IngredientMasterModel?> getSeasoningById(String id) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'seasonings',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) return null;
    return IngredientMasterModelX.fromSqlMap(maps.first);
  }

  @override
  Future<IngredientMasterModel?> getSeasoningByName(String name) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'seasonings',
      where: 'name = ?',
      whereArgs: [name],
    );

    if (maps.isEmpty) return null;
    return IngredientMasterModelX.fromSqlMap(maps.first);
  }

  @override
  Future<String> createSeasoning(IngredientMasterModel seasoning) async {
    final db = await _databaseHelper.database;
    final id = _uuid.v4();
    final now = DateTime.now().toIso8601String();

    final seasoningWithId = seasoning.copyWith(
      id: id,
      createdAt: now,
      updatedAt: now,
    );

    await db.insert('seasonings', seasoningWithId.toSqlMap());
    return id;
  }

  @override
  Future<void> updateSeasoning(IngredientMasterModel seasoning) async {
    final db = await _databaseHelper.database;
    final now = DateTime.now().toIso8601String();

    final updatedSeasoning = seasoning.copyWith(updatedAt: now);

    await db.update(
      'seasonings',
      updatedSeasoning.toSqlMap(),
      where: 'id = ?',
      whereArgs: [seasoning.id],
    );
  }

  @override
  Future<void> deleteSeasoning(String id) async {
    final db = await _databaseHelper.database;
    await db.delete('seasonings', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> incrementUsageCount(String id) async {
    final db = await _databaseHelper.database;
    await db.rawUpdate(
      'UPDATE seasonings SET usage_count = usage_count + 1, updated_at = ? WHERE id = ?',
      [DateTime.now().toIso8601String(), id],
    );
  }

  @override
  Future<List<String>> getAllCategories() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT DISTINCT category FROM seasonings WHERE category IS NOT NULL ORDER BY category ASC',
    );

    return maps.map((map) => map['category'] as String).toList();
  }
}
