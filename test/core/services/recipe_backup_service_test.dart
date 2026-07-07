import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:recipick_flutter/core/config/local_user_policy.dart';
import 'package:recipick_flutter/core/services/image_storage_service.dart';
import 'package:recipick_flutter/core/services/recipe_backup_service.dart';
import 'package:recipick_flutter/data/datasources/local/database_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late DatabaseHelper databaseHelper;
  late Database database;
  late FakeImageStorageService imageStorageService;
  late RecipeBackupService service;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() async {
    databaseHelper = DatabaseHelper();
    database = await databaseHelper.database;
    imageStorageService = FakeImageStorageService();
    service = RecipeBackupService(
      databaseHelper: databaseHelper,
      imageStorageService: imageStorageService,
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

  test('JSON 백업은 누락된 참조 사용자 row를 보강한다', () async {
    await _insertBackupFixture(database, recipeName: '사용자 없는 레시피');
    await database.delete('users');

    final jsonString = await service.exportToJsonString();
    final document = jsonDecode(jsonString) as Map<String, dynamic>;
    final tables = document['tables'] as Map<String, dynamic>;
    final users = tables['users'] as List<dynamic>;

    expect(users, hasLength(1));
    expect(users.single['id'], LocalUserPolicy.localUserId);
    expect(users.single['username'], LocalUserPolicy.localUsername);
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

  test('JSON 복원은 백업에 없는 기존 데이터를 유지한다', () async {
    await _insertBackupFixture(database, recipeName: '백업 레시피');
    final jsonString = await service.exportToJsonString();
    await _insertBackupFixture(
      database,
      idSuffix: '2',
      recipeName: '백업에 없는 로컬 레시피',
    );

    await service.importFromJsonString(jsonString);

    final localOnlyRecipes = await database.query(
      'recipes',
      where: 'id = ?',
      whereArgs: ['recipe-2'],
    );

    expect(localOnlyRecipes, hasLength(1));
    expect(localOnlyRecipes.single['name'], '백업에 없는 로컬 레시피');
  });

  test('필수 테이블이 없는 백업은 DB 쓰기 전에 실패한다', () async {
    await _insertBackupFixture(database, recipeName: '원본 레시피');
    final document = _decodeBackup(await service.exportToJsonString());
    final tables = document['tables'] as Map<String, dynamic>;
    tables.remove('recipe_versions');

    await database.update(
      'recipes',
      {'name': '유지되어야 하는 이름'},
      where: 'id = ?',
      whereArgs: ['recipe-1'],
    );

    expect(
      () => service.importFromJsonString(_encodeBackup(document)),
      throwsFormatException,
    );

    final recipes = await database.query(
      'recipes',
      where: 'id = ?',
      whereArgs: ['recipe-1'],
    );
    expect(recipes.single['name'], '유지되어야 하는 이름');
  });

  test('관계가 깨진 백업은 DB 쓰기 전에 실패한다', () async {
    await _insertBackupFixture(database, recipeName: '원본 레시피');
    final document = _decodeBackup(await service.exportToJsonString());
    final tables = document['tables'] as Map<String, dynamic>;
    final ingredients = tables['ingredients'] as List<dynamic>;
    ingredients.first['recipeVersionId'] = 'missing-version';

    await database.update(
      'recipes',
      {'name': '유지되어야 하는 이름'},
      where: 'id = ?',
      whereArgs: ['recipe-1'],
    );

    expect(
      () => service.importFromJsonString(_encodeBackup(document)),
      throwsFormatException,
    );

    final recipes = await database.query(
      'recipes',
      where: 'id = ?',
      whereArgs: ['recipe-1'],
    );
    expect(recipes.single['name'], '유지되어야 하는 이름');
  });

  test('누락된 step 이미지 payload는 중복 step의 기존 로컬 이미지를 보존한다', () async {
    await _insertBackupFixture(
      database,
      recipeName: '이미지 레시피',
      stepImageUrl: '/local/existing.jpg',
    );
    final document = _decodeBackup(await service.exportToJsonString());
    final tables = document['tables'] as Map<String, dynamic>;
    final steps = tables['steps'] as List<dynamic>;
    steps.first['imageUrl'] = '/other-device/missing.jpg';
    document['stepImages'] = <dynamic>[];

    final result = await service.importFromJsonString(_encodeBackup(document));
    final restoredSteps = await database.query(
      'steps',
      where: 'id = ?',
      whereArgs: ['step-1'],
    );

    expect(result.skippedStepImages, 1);
    expect(restoredSteps.single['imageUrl'], '/local/existing.jpg');
  });

  test('누락된 step 이미지 payload는 신규 step의 stale imageUrl을 null로 복원한다', () async {
    await _insertBackupFixture(
      database,
      recipeName: '이미지 레시피',
      stepImageUrl: '/other-device/missing.jpg',
    );
    final document = _decodeBackup(await service.exportToJsonString());
    document['stepImages'] = <dynamic>[];

    await _clearTables(database);

    final result = await service.importFromJsonString(_encodeBackup(document));
    final restoredSteps = await database.query(
      'steps',
      where: 'id = ?',
      whereArgs: ['step-1'],
    );

    expect(result.skippedStepImages, 1);
    expect(restoredSteps.single['imageUrl'], isNull);
  });

  test('복원된 step 이미지는 새 로컬 이미지 경로로 rewrite된다', () async {
    await _insertBackupFixture(
      database,
      recipeName: '이미지 레시피',
      stepImageUrl: '/other-device/step.jpg',
    );
    final document = _decodeBackup(await service.exportToJsonString());
    document['stepImages'] = [
      {
        'originalPath': '/other-device/step.jpg',
        'fileName': 'step.jpg',
        'extension': '.jpg',
        'base64Data': base64Encode([1, 2, 3, 4]),
      },
    ];

    await _clearTables(database);

    final result = await service.importFromJsonString(_encodeBackup(document));
    final restoredSteps = await database.query(
      'steps',
      where: 'id = ?',
      whereArgs: ['step-1'],
    );

    expect(result.restoredStepImages, 1);
    expect(restoredSteps.single['imageUrl'], startsWith('/restored/'));
    expect(restoredSteps.single['imageUrl'], isNot('/other-device/step.jpg'));
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
  String idSuffix = '1',
  required String recipeName,
  String? stepImageUrl,
}) async {
  const createdAt = '2026-07-07T12:00:00.000Z';
  final userId = idSuffix == '1'
      ? LocalUserPolicy.localUserId
      : '${LocalUserPolicy.localUserId}-$idSuffix';
  final recipeId = 'recipe-$idSuffix';
  final versionId = 'version-$idSuffix';

  await database.insert('users', {
    'id': userId,
    'username': 'local-user',
    'avatarUrl': null,
    'createdAt': createdAt,
    'updatedAt': createdAt,
    'isDeleted': 0,
  });
  await database.insert('recipes', {
    'id': recipeId,
    'authorId': userId,
    'latestVersionId': versionId,
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
  await database.insert('recipe_versions', {
    'id': versionId,
    'recipeId': recipeId,
    'versionNumber': 1,
    'name': '간장 계란밥',
    'versionName': '덜 짠 버전',
    'description': '기본 설명',
    'authorId': userId,
    'createdAt': createdAt,
    'isDeleted': 0,
    'changeLog': '간장 감소',
    'baseVersionId': null,
    'versionStatus': 'active',
  });
  await database.insert('ingredients', {
    'id': 'ingredient-$idSuffix',
    'recipeVersionId': versionId,
    'name': '간장',
    'quantity': 1.0,
    'unit': 'T',
    'createdAt': createdAt,
    'updatedAt': createdAt,
    'isDeleted': 0,
  });
  await database.insert('steps', {
    'id': 'step-$idSuffix',
    'recipeVersionId': versionId,
    'stepNumber': 1,
    'description': '밥 위에 계란을 올린다',
    'imageUrl': stepImageUrl,
    'timerMinutes': 1,
    'timerSeconds': 30,
    'timerName': '계란 익히기',
    'createdAt': createdAt,
    'updatedAt': createdAt,
    'isDeleted': 0,
  });
  await database.insert('cooking_logs', {
    'id': 'log-$idSuffix',
    'recipeVersionId': versionId,
    'authorId': userId,
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

Map<String, dynamic> _decodeBackup(String jsonString) {
  return jsonDecode(jsonString) as Map<String, dynamic>;
}

String _encodeBackup(Map<String, dynamic> document) {
  return jsonEncode(document);
}

class FakeImageStorageService extends ImageStorageService {
  final List<String> savedPaths = [];
  final List<String> deletedPaths = [];

  @override
  Future<File?> getImageFile(String imagePath) async {
    return null;
  }

  @override
  Future<String> saveImageBytes(
    Uint8List imageBytes,
    String extension, {
    String? customFileName,
  }) async {
    final safeExtension = extension.startsWith('.') ? extension : '.$extension';
    final path = '/restored/${customFileName ?? 'image$safeExtension'}';
    savedPaths.add(path);
    return path;
  }

  @override
  Future<bool> deleteImageFile(String imagePath) async {
    deletedPaths.add(imagePath);
    return true;
  }
}
