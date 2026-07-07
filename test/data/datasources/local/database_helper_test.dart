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

    test('steps 테이블에 타이머 컬럼이 포함되는지 확인', () async {
      final columns = await database.rawQuery('PRAGMA table_info(steps)');
      final columnNames = columns.map((col) => col['name'] as String).toList();

      expect(columnNames, contains('timerMinutes'));
      expect(columnNames, contains('timerSeconds'));
      expect(columnNames, contains('timerName'));
    });

    test('cooking_logs 테이블에 맛 평가 컬럼이 포함되는지 확인', () async {
      final columns = await database.rawQuery(
        'PRAGMA table_info(cooking_logs)',
      );
      final columnNames = columns.map((col) => col['name'] as String).toList();

      expect(columnNames, contains('overallRating'));
      expect(columnNames, contains('saltinessRating'));
      expect(columnNames, contains('sweetnessRating'));
      expect(columnNames, contains('spicinessRating'));
      expect(columnNames, contains('umamiRating'));
      expect(columnNames, contains('failureReason'));
      expect(columnNames, contains('nextAdjustment'));
    });

    test('v17 steps 데이터가 v18 타이머 컬럼 마이그레이션 후 보존되는지 확인', () async {
      final legacyDb = await openDatabase(
        inMemoryDatabasePath,
        version: 17,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE steps(
              id TEXT PRIMARY KEY,
              recipeVersionId TEXT NOT NULL,
              stepNumber INTEGER NOT NULL,
              description TEXT NOT NULL,
              imageUrl TEXT,
              createdAt TEXT NOT NULL,
              updatedAt TEXT NOT NULL,
              isDeleted INTEGER NOT NULL DEFAULT 0
            )
          ''');
        },
      );
      addTearDown(legacyDb.close);

      await legacyDb.insert('steps', const {
        'id': 'legacy-step-1',
        'recipeVersionId': 'legacy-version-1',
        'stepNumber': 1,
        'description': '기존 조리 단계',
        'imageUrl': null,
        'createdAt': '2026-07-07T09:00:00.000Z',
        'updatedAt': '2026-07-07T09:00:00.000Z',
        'isDeleted': 0,
      });

      await databaseHelper.upgradeForTest(legacyDb, 17, 18);

      final columns = await legacyDb.rawQuery('PRAGMA table_info(steps)');
      final columnNames = columns.map((col) => col['name'] as String).toList();

      expect(columnNames, contains('timerMinutes'));
      expect(columnNames, contains('timerSeconds'));
      expect(columnNames, contains('timerName'));

      final rows = await legacyDb.query(
        'steps',
        where: 'id = ?',
        whereArgs: ['legacy-step-1'],
      );

      expect(rows, hasLength(1));
      expect(rows.first['description'], '기존 조리 단계');
      expect(rows.first['timerMinutes'], isNull);
      expect(rows.first['timerSeconds'], isNull);
      expect(rows.first['timerName'], isNull);

      await legacyDb.update(
        'steps',
        const {'timerMinutes': 5, 'timerSeconds': 30, 'timerName': '중간 점검'},
        where: 'id = ?',
        whereArgs: ['legacy-step-1'],
      );

      final updatedRows = await legacyDb.query(
        'steps',
        where: 'id = ?',
        whereArgs: ['legacy-step-1'],
      );

      expect(updatedRows.first['timerMinutes'], 5);
      expect(updatedRows.first['timerSeconds'], 30);
      expect(updatedRows.first['timerName'], '중간 점검');
    });

    test('recipes 테이블 스키마가 올바른지 확인', () async {
      final columns = await database.rawQuery('PRAGMA table_info(recipes)');
      final columnNames = columns.map((col) => col['name'] as String).toList();

      expect(columnNames, contains('id'));
      expect(columnNames, contains('authorId'));
      expect(columnNames, contains('latestVersionId'));
      expect(columnNames, contains('name'));
      expect(columnNames, contains('description'));
      expect(columnNames, contains('sourceUrl'));
      expect(columnNames, contains('sourceName'));
      expect(columnNames, contains('importedAt'));
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
      expect(columnNames, contains('versionStatus'));
    });

    test('레시피 데이터 삽입 및 조회 테스트', () async {
      // 테스트 데이터 삽입
      const recipeData = {
        'id': 'test-recipe-1',
        'authorId': 'test-user-1',
        'latestVersionId': 'test-version-1',
        'name': '테스트 레시피',
        'description': '테스트용 레시피 설명',
        'sourceUrl': 'https://example.com/recipe',
        'sourceName': 'Example Recipe',
        'importedAt': '2025-06-26T13:00:00.000Z',
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
      expect(result.first['sourceUrl'], 'https://example.com/recipe');
      expect(result.first['sourceName'], 'Example Recipe');
      expect(result.first['importedAt'], '2025-06-26T13:00:00.000Z');
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
