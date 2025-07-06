import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:recipick_flutter/data/datasources/local/database_helper.dart';

void main() {
  late DatabaseHelper databaseHelper;
  late Database database;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() async {
    databaseHelper = DatabaseHelper();
    database = await databaseHelper.database;
  });

  tearDown(() async {
    // 테스트 데이터 클리어
    await database.execute('DELETE FROM ingredients');
    await database.execute('DELETE FROM steps');
    await database.execute('DELETE FROM recipe_versions');
    await database.execute('DELETE FROM recipes');
    await database.execute('DELETE FROM users');
  });

  group('DatabaseHelper 테스트', () {
    test('데이터베이스 테이블이 올바르게 생성되는지 확인', () async {
      // 테이블 존재 여부 확인
      final tables = await database.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table'",
      );

      final tableNames = tables
          .map((table) => table['name'] as String)
          .toList();

      expect(tableNames, contains('users'));
      expect(tableNames, contains('recipes'));
      expect(tableNames, contains('recipe_versions'));
      expect(tableNames, contains('ingredients'));
      expect(tableNames, contains('steps'));
    });

    test('recipes 테이블 스키마가 올바른지 확인', () async {
      final columns = await database.rawQuery('PRAGMA table_info(recipes)');
      final columnNames = columns.map((col) => col['name'] as String).toList();

      expect(columnNames, contains('id'));
      expect(columnNames, contains('authorId'));
      expect(columnNames, contains('latestVersionId'));
      expect(columnNames, contains('name'));
      expect(columnNames, contains('description'));
      expect(columnNames, contains('isPublic'));
      expect(columnNames, contains('createdAt'));
      expect(columnNames, contains('updatedAt'));
      expect(columnNames, contains('isDeleted'));
    });

    test('recipe_versions 테이블 스키마가 올바른지 확인', () async {
      final columns = await database.rawQuery(
        'PRAGMA table_info(recipe_versions)',
      );
      final columnNames = columns.map((col) => col['name'] as String).toList();

      expect(columnNames, contains('id'));
      expect(columnNames, contains('recipeId'));
      expect(columnNames, contains('versionNumber'));
      expect(columnNames, contains('name'));
      expect(columnNames, contains('description'));
      expect(columnNames, contains('authorId'));
      expect(columnNames, contains('createdAt'));
      expect(columnNames, contains('isDeleted'));
    });

    test('레시피 데이터 삽입 및 조회 테스트', () async {
      // 테스트 데이터 삽입
      const recipeData = {
        'id': 'test-recipe-1',
        'authorId': 'test-user-1',
        'latestVersionId': 'test-version-1',
        'name': '테스트 레시피',
        'description': '테스트용 레시피 설명',
        'isPublic': 1,
        'createdAt': '2025-06-26T12:00:00.000Z',
        'updatedAt': '2025-06-26T12:00:00.000Z',
        'isDeleted': 0,
      };

      await database.insert('recipes', recipeData);

      // 데이터 조회
      final result = await database.query(
        'recipes',
        where: 'id = ?',
        whereArgs: ['test-recipe-1'],
      );

      expect(result.length, 1);
      expect(result.first['name'], '테스트 레시피');
      expect(result.first['authorId'], 'test-user-1');
    });

    test('레시피 버전 데이터 삽입 및 조회 테스트', () async {
      // 먼저 레시피 삽입
      const recipeData = {
        'id': 'test-recipe-2',
        'authorId': 'test-user-1',
        'latestVersionId': 'test-version-2',
        'name': '테스트 레시피 2',
        'description': '테스트용 레시피 설명 2',
        'isPublic': 1,
        'createdAt': '2025-06-26T12:00:00.000Z',
        'updatedAt': '2025-06-26T12:00:00.000Z',
        'isDeleted': 0,
      };

      await database.insert('recipes', recipeData);

      // 레시피 버전 삽입
      const versionData = {
        'id': 'test-version-2',
        'recipeId': 'test-recipe-2',
        'versionNumber': 1,
        'name': '테스트 레시피 2 v1',
        'description': '첫 번째 버전',
        'authorId': 'test-user-1',
        'createdAt': '2025-06-26T12:00:00.000Z',
        'isDeleted': 0,
      };

      await database.insert('recipe_versions', versionData);

      // 데이터 조회
      final result = await database.query(
        'recipe_versions',
        where: 'id = ?',
        whereArgs: ['test-version-2'],
      );

      expect(result.length, 1);
      expect(result.first['name'], '테스트 레시피 2 v1');
      expect(result.first['versionNumber'], 1);
    });

    test('재료 데이터 삽입 및 조회 테스트', () async {
      // 레시피와 버전 먼저 삽입
      const recipeData = {
        'id': 'test-recipe-3',
        'authorId': 'test-user-1',
        'latestVersionId': 'test-version-3',
        'name': '테스트 레시피 3',
        'description': '테스트용 레시피 설명 3',
        'isPublic': 1,
        'createdAt': '2025-06-26T12:00:00.000Z',
        'updatedAt': '2025-06-26T12:00:00.000Z',
        'isDeleted': 0,
      };

      const versionData = {
        'id': 'test-version-3',
        'recipeId': 'test-recipe-3',
        'versionNumber': 1,
        'name': '테스트 레시피 3 v1',
        'description': '첫 번째 버전',
        'authorId': 'test-user-1',
        'createdAt': '2025-06-26T12:00:00.000Z',
        'isDeleted': 0,
      };

      await database.insert('recipes', recipeData);
      await database.insert('recipe_versions', versionData);

      // 재료 삽입
      const ingredientData = {
        'id': 'test-ingredient-1',
        'recipeVersionId': 'test-version-3',
        'name': '떡',
        'quantity': 200.0,
        'unit': 'g',
        'createdAt': '2025-06-26T12:00:00.000Z',
        'updatedAt': '2025-06-26T12:00:00.000Z',
        'isDeleted': 0,
      };

      await database.insert('ingredients', ingredientData);

      // 데이터 조회
      final result = await database.query(
        'ingredients',
        where: 'id = ?',
        whereArgs: ['test-ingredient-1'],
      );

      expect(result.length, 1);
      expect(result.first['name'], '떡');
      expect(result.first['quantity'], 200.0);
      expect(result.first['unit'], 'g');
    });

    test('전체 데이터 조회 (JOIN) 테스트', () async {
      // 테스트 데이터 전체 삽입
      const recipeData = {
        'id': 'test-recipe-4',
        'authorId': 'test-user-1',
        'latestVersionId': 'test-version-4',
        'name': '떡볶이',
        'description': '매콤한 떡볶이',
        'isPublic': 1,
        'createdAt': '2025-06-26T12:00:00.000Z',
        'updatedAt': '2025-06-26T12:00:00.000Z',
        'isDeleted': 0,
      };

      const versionData = {
        'id': 'test-version-4',
        'recipeId': 'test-recipe-4',
        'versionNumber': 1,
        'name': '떡볶이 v1',
        'description': '기본 떡볶이 레시피',
        'authorId': 'test-user-1',
        'createdAt': '2025-06-26T12:00:00.000Z',
        'isDeleted': 0,
      };

      await database.insert('recipes', recipeData);
      await database.insert('recipe_versions', versionData);

      // JOIN 쿼리로 레시피와 버전 정보 함께 조회
      final result = await database.rawQuery(
        '''
        SELECT r.*, rv.name as version_name, rv.description as version_description
        FROM recipes r
        LEFT JOIN recipe_versions rv ON r.latestVersionId = rv.id
        WHERE r.id = ?
      ''',
        ['test-recipe-4'],
      );

      expect(result.length, 1);
      expect(result.first['name'], '떡볶이');
      expect(result.first['version_name'], '떡볶이 v1');
    });
  });
}
