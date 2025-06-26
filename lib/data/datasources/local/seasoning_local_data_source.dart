import 'package:saucerer_flutter/data/datasources/local/database_helper.dart';
import 'package:saucerer_flutter/data/models/seasoning_model.dart';
import 'package:uuid/uuid.dart';

abstract class SeasoningLocalDataSource {
  Future<List<SeasoningModel>> getAllSeasonings();
  Future<List<SeasoningModel>> searchSeasonings(String query);
  Future<List<SeasoningModel>> getSeasoningsByCategory(String category);
  Future<List<SeasoningModel>> getPopularSeasonings({int limit = 20});
  Future<SeasoningModel?> getSeasoningById(String id);
  Future<SeasoningModel?> getSeasoningByName(String name);
  Future<String> createSeasoning(SeasoningModel seasoning);
  Future<void> updateSeasoning(SeasoningModel seasoning);
  Future<void> deleteSeasoning(String id);
  Future<void> incrementUsageCount(String id);
  Future<List<String>> getAllCategories();
}

class SeasoningLocalDataSourceImpl implements SeasoningLocalDataSource {
  final DatabaseHelper _databaseHelper;
  final Uuid _uuid = const Uuid();

  SeasoningLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<List<SeasoningModel>> getAllSeasonings() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'seasonings',
      orderBy: 'name ASC',
    );

    return maps.map((map) => SeasoningModelX.fromSqlMap(map)).toList();
  }

  @override
  Future<List<SeasoningModel>> searchSeasonings(String query) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'seasonings',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
      orderBy: 'usage_count DESC, name ASC',
    );

    return maps.map((map) => SeasoningModelX.fromSqlMap(map)).toList();
  }

  @override
  Future<List<SeasoningModel>> getSeasoningsByCategory(String category) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'seasonings',
      where: 'category = ?',
      whereArgs: [category],
      orderBy: 'usage_count DESC, name ASC',
    );

    return maps.map((map) => SeasoningModelX.fromSqlMap(map)).toList();
  }

  @override
  Future<List<SeasoningModel>> getPopularSeasonings({int limit = 20}) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'seasonings',
      orderBy: 'usage_count DESC, name ASC',
      limit: limit,
    );

    return maps.map((map) => SeasoningModelX.fromSqlMap(map)).toList();
  }

  @override
  Future<SeasoningModel?> getSeasoningById(String id) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'seasonings',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) return null;
    return SeasoningModelX.fromSqlMap(maps.first);
  }

  @override
  Future<SeasoningModel?> getSeasoningByName(String name) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'seasonings',
      where: 'name = ?',
      whereArgs: [name],
    );

    if (maps.isEmpty) return null;
    return SeasoningModelX.fromSqlMap(maps.first);
  }

  @override
  Future<String> createSeasoning(SeasoningModel seasoning) async {
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
  Future<void> updateSeasoning(SeasoningModel seasoning) async {
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
    await db.delete(
      'seasonings',
      where: 'id = ?',
      whereArgs: [id],
    );
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