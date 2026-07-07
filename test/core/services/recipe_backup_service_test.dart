import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:recipick_flutter/core/services/image_storage_service.dart';
import 'package:recipick_flutter/core/services/recipe_backup_service.dart';
import 'package:recipick_flutter/data/datasources/local/database_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late DatabaseHelper databaseHelper;
  late Database database;
  late RecipeBackupService service;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() async {
    databaseHelper = DatabaseHelper();
    database = await databaseHelper.database;
    service = RecipeBackupService(
      databaseHelper: databaseHelper,
      imageStorageService: ImageStorageService(),
    );

    await _clearTables(database);
  });

  tearDown(() async {
    await _clearTables(database);
  });

  test('JSON 백업은 레시피 관련 테이블과 병합 정책을 포함한다', () async {
    await _insertBackupFixture(database, recipeName: '간장 계란밥');

    final jsonString = await service.exportToJsonString();
    final document = jsonDecode(jsonString) as Map<String, dynamic>;
    final tables = document['tables'] as Map<String, dynamic>;
    final mergePolicy = document['mergePolicy'] as Map<String, dynamic>;

    expect(document['format'], RecipeBackupService.backupFormat);
    expect(document['formatVersion'], RecipeBackupService.currentFormatVersion);
    expect(tables['users'], hasLength(1));
    expect(tables['recipes'], hasLength(1));
    expect(tables['recipe_versions'], hasLength(1));
    expect(tables['ingredients'], hasLength(1));
    expect(tables['steps'], hasLength(1));
    expect(tables['cooking_logs'], hasLength(1));
    expect(mergePolicy['records'], 'upsert_by_id');
    expect(
      mergePolicy['duplicateIds'],
      'backup_record_replaces_existing_record',
    );
  });

  test('JSON 복원은 같은 ID의 기존 레시피 데이터를 백업 내용으로 교체한다', () async {
    await _insertBackupFixture(database, recipeName: '백업 레시피');
    final jsonString = await service.exportToJsonString();

    await database.update(
      'recipes',
      {'name': '로컬에서 바뀐 이름'},
      where: 'id = ?',
      whereArgs: ['recipe-1'],
    );

    final result = await service.importFromJsonString(jsonString);
    final recipes = await database.query(
      'recipes',
      where: 'id = ?',
      whereArgs: ['recipe-1'],
    );
    final cookingLogs = await database.query(
      'cooking_logs',
      where: 'id = ?',
      whereArgs: ['log-1'],
    );

    expect(result.recipes, 1);
    expect(result.versions, 1);
    expect(result.ingredients, 1);
    expect(result.steps, 1);
    expect(result.cookingLogs, 1);
    expect(result.restoredStepImages, 0);
    expect(recipes.single['name'], '백업 레시피');
    expect(cookingLogs.single['base64EncodedImageData'], 'encoded-image');
  });
}

Future<void> _clearTables(Database database) async {
  await database.delete('cooking_logs');
  await database.delete('ingredients');
  await database.delete('steps');
  await database.delete('recipe_versions');
  await database.delete('recipes');
  await database.delete('users');
}

Future<void> _insertBackupFixture(
  Database database, {
  required String recipeName,
}) async {
  const createdAt = '2026-07-07T12:00:00.000Z';

  await database.insert('users', const {
    'id': 'user-1',
    'username': 'local-user',
    'avatarUrl': null,
    'createdAt': createdAt,
    'updatedAt': createdAt,
    'isDeleted': 0,
  });
  await database.insert('recipes', {
    'id': 'recipe-1',
    'authorId': 'user-1',
    'latestVersionId': 'version-1',
    'name': recipeName,
    'description': '테스트 레시피',
    'sourceUrl': 'https://example.com/recipe',
    'sourceName': 'Example',
    'importedAt': createdAt,
    'isPublic': 0,
    'createdAt': createdAt,
    'updatedAt': createdAt,
    'isDeleted': 0,
  });
  await database.insert('recipe_versions', const {
    'id': 'version-1',
    'recipeId': 'recipe-1',
    'versionNumber': 1,
    'name': '간장 계란밥',
    'versionName': '덜 짠 버전',
    'description': '기본 설명',
    'authorId': 'user-1',
    'createdAt': createdAt,
    'isDeleted': 0,
    'changeLog': '간장 감소',
    'baseVersionId': null,
    'versionStatus': 'active',
  });
  await database.insert('ingredients', const {
    'id': 'ingredient-1',
    'recipeVersionId': 'version-1',
    'name': '간장',
    'quantity': 1.0,
    'unit': 'T',
    'createdAt': createdAt,
    'updatedAt': createdAt,
    'isDeleted': 0,
  });
  await database.insert('steps', const {
    'id': 'step-1',
    'recipeVersionId': 'version-1',
    'stepNumber': 1,
    'description': '밥 위에 계란을 올린다',
    'imageUrl': null,
    'timerMinutes': 1,
    'timerSeconds': 30,
    'timerName': '계란 익히기',
    'createdAt': createdAt,
    'updatedAt': createdAt,
    'isDeleted': 0,
  });
  await database.insert('cooking_logs', const {
    'id': 'log-1',
    'recipeVersionId': 'version-1',
    'authorId': 'user-1',
    'title': '첫 시도',
    'memo': '조금 짰다',
    'base64EncodedImageData': 'encoded-image',
    'overallRating': 4,
    'saltinessRating': 2,
    'sweetnessRating': 3,
    'spicinessRating': 1,
    'umamiRating': 4,
    'failureReason': null,
    'nextAdjustment': '간장 더 줄이기',
    'cookedAt': createdAt,
    'createdAt': createdAt,
    'updatedAt': createdAt,
    'isDeleted': 0,
  });
}
