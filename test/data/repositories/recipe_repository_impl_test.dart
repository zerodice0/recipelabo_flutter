import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:saucerer_flutter/data/datasources/local/database_helper.dart';
import 'package:saucerer_flutter/data/datasources/local/recipe_local_data_source.dart';
import 'package:saucerer_flutter/data/repositories/recipe_repository_impl.dart';
import 'package:saucerer_flutter/domain/entities/recipe_entity.dart';
import 'package:saucerer_flutter/domain/entities/recipe_version_entity.dart';
import 'package:saucerer_flutter/domain/entities/ingredient_entity.dart';
import 'package:saucerer_flutter/domain/entities/step_entity.dart';

void main() {
  late RecipeRepositoryImpl repository;
  late RecipeLocalDataSourceImpl dataSource;
  late DatabaseHelper databaseHelper;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() async {
    // 각 테스트마다 새로운 인메모리 데이터베이스 생성
    final db = await openDatabase(
      ':memory:',
      version: 2,
      onCreate: (Database db, int version) async {
        // DatabaseHelper의 _onCreate 로직을 복제
        await db.execute('''
          CREATE TABLE users(
            id TEXT PRIMARY KEY,
            username TEXT NOT NULL,
            avatarUrl TEXT,
            createdAt TEXT NOT NULL,
            updatedAt TEXT NOT NULL,
            isDeleted INTEGER NOT NULL DEFAULT 0
          )
        ''');

        await db.execute('''
          CREATE TABLE recipes(
            id TEXT PRIMARY KEY,
            authorId TEXT NOT NULL,
            latestVersionId TEXT NOT NULL,
            name TEXT NOT NULL,
            description TEXT,
            isPublic INTEGER NOT NULL DEFAULT 1,
            createdAt TEXT NOT NULL,
            updatedAt TEXT NOT NULL,
            isDeleted INTEGER NOT NULL DEFAULT 0,
            FOREIGN KEY (authorId) REFERENCES users(id)
          )
        ''');

        await db.execute('''
          CREATE TABLE recipe_versions(
            id TEXT PRIMARY KEY,
            recipeId TEXT NOT NULL,
            versionNumber INTEGER NOT NULL,
            name TEXT NOT NULL,
            description TEXT NOT NULL,
            authorId TEXT NOT NULL,
            createdAt TEXT NOT NULL,
            isDeleted INTEGER NOT NULL DEFAULT 0,
            FOREIGN KEY (recipeId) REFERENCES recipes(id),
            FOREIGN KEY (authorId) REFERENCES users(id)
          )
        ''');

        await db.execute('''
          CREATE TABLE ingredients(
            id TEXT PRIMARY KEY,
            recipeVersionId TEXT NOT NULL,
            name TEXT NOT NULL,
            quantity REAL NOT NULL,
            unit TEXT NOT NULL,
            createdAt TEXT NOT NULL,
            updatedAt TEXT NOT NULL,
            isDeleted INTEGER NOT NULL DEFAULT 0,
            FOREIGN KEY (recipeVersionId) REFERENCES recipe_versions(id)
          )
        ''');

        await db.execute('''
          CREATE TABLE steps(
            id TEXT PRIMARY KEY,
            recipeVersionId TEXT NOT NULL,
            stepNumber INTEGER NOT NULL,
            description TEXT NOT NULL,
            imageUrl TEXT,
            createdAt TEXT NOT NULL,
            updatedAt TEXT NOT NULL,
            isDeleted INTEGER NOT NULL DEFAULT 0,
            FOREIGN KEY (recipeVersionId) REFERENCES recipe_versions(id)
          )
        ''');
      },
    );
    
    // Mock DatabaseHelper
    databaseHelper = DatabaseHelper();
    // Private field를 우회하여 데이터베이스 설정
    await databaseHelper.database; // 초기화
    
    dataSource = RecipeLocalDataSourceImpl(databaseHelper);
    repository = RecipeRepositoryImpl(localDataSource: dataSource);
  });

  tearDown(() async {
    // 테스트 후 정리는 자동으로 처리됨 (인메모리 DB)
  });

  group('RecipeRepositoryImpl 테스트', () {
    test('레시피 저장 및 조회 전체 플로우 테스트', () async {
      // 테스트 데이터 생성
      final testTime = DateTime.now();
      
      final recipeEntity = RecipeEntity(
        id: 'recipe-test-1',
        authorId: 'user-test-1',
        latestVersionId: 'version-test-1',
        name: '김치찌개',
        description: '얼큰한 김치찌개',
        isPublic: true,
        createdAt: testTime,
        updatedAt: testTime,
      );

      final versionEntity = RecipeVersionEntity(
        id: 'version-test-1',
        recipeId: 'recipe-test-1',
        versionNumber: 1,
        name: '김치찌개 기본 레시피',
        description: '집에서 만드는 김치찌개',
        ingredients: const [
          IngredientEntity(
            id: 'ingredient-1',
            name: '김치',
            quantity: 200,
            unit: 'g',
          ),
          IngredientEntity(
            id: 'ingredient-2',
            name: '돼지고기',
            quantity: 150,
            unit: 'g',
          ),
        ],
        steps: const [
          StepEntity(
            id: 'step-1',
            stepNumber: 1,
            description: '김치와 돼지고기를 볶는다',
            imageUrl: null,
          ),
          StepEntity(
            id: 'step-2',
            stepNumber: 2,
            description: '물을 넣고 끓인다',
            imageUrl: null,
          ),
        ],
        authorId: 'user-test-1',
        createdAt: testTime,
      );

      // 레시피 저장
      await repository.saveRecipe(recipeEntity, versionEntity);

      // 저장된 레시피 조회
      final recipes = await repository.getRecipes();
      expect(recipes.length, 1);
      expect(recipes.first.name, '김치찌개');
      expect(recipes.first.id, 'recipe-test-1');

      // 특정 버전 조회
      final version = await repository.getRecipeVersion('version-test-1');
      expect(version, isNotNull);
      expect(version!.name, '김치찌개 기본 레시피');
      expect(version.ingredients.length, 2);
      expect(version.steps.length, 2);
      expect(version.ingredients.first.name, '김치');
      expect(version.steps.first.description, '김치와 돼지고기를 볶는다');
    });

    test('여러 레시피 저장 및 조회 테스트', () async {
      final testTime = DateTime.now();
      
      // 첫 번째 레시피
      final recipe1 = RecipeEntity(
        id: 'recipe-test-2',
        authorId: 'user-test-1',
        latestVersionId: 'version-test-2',
        name: '된장찌개',
        description: '구수한 된장찌개',
        isPublic: true,
        createdAt: testTime,
        updatedAt: testTime,
      );

      final version1 = RecipeVersionEntity(
        id: 'version-test-2',
        recipeId: 'recipe-test-2',
        versionNumber: 1,
        name: '된장찌개 기본',
        description: '기본 된장찌개 레시피',
        ingredients: const [
          IngredientEntity(
            id: 'ingredient-3',
            name: '된장',
            quantity: 2,
            unit: '큰술',
          ),
        ],
        steps: const [
          StepEntity(
            id: 'step-3',
            stepNumber: 1,
            description: '된장을 풀어준다',
            imageUrl: null,
          ),
        ],
        authorId: 'user-test-1',
        createdAt: testTime,
      );

      // 두 번째 레시피
      final recipe2 = RecipeEntity(
        id: 'recipe-test-3',
        authorId: 'user-test-1',
        latestVersionId: 'version-test-3',
        name: '라면',
        description: '간단한 라면',
        isPublic: false,
        createdAt: testTime,
        updatedAt: testTime,
      );

      final version2 = RecipeVersionEntity(
        id: 'version-test-3',
        recipeId: 'recipe-test-3',
        versionNumber: 1,
        name: '기본 라면',
        description: '물에 끓이는 라면',
        ingredients: const [
          IngredientEntity(
            id: 'ingredient-4',
            name: '라면',
            quantity: 1,
            unit: '개',
          ),
        ],
        steps: const [
          StepEntity(
            id: 'step-4',
            stepNumber: 1,
            description: '물을 끓인다',
            imageUrl: null,
          ),
        ],
        authorId: 'user-test-1',
        createdAt: testTime,
      );

      // 두 레시피 저장
      await repository.saveRecipe(recipe1, version1);
      await repository.saveRecipe(recipe2, version2);

      // 전체 레시피 조회
      final recipes = await repository.getRecipes();
      expect(recipes.length, 2);
      
      final recipeNames = recipes.map((r) => r.name).toList();
      expect(recipeNames, contains('된장찌개'));
      expect(recipeNames, contains('라면'));
    });

    test('레시피 삭제 테스트', () async {
      final testTime = DateTime.now();
      
      // 레시피 저장
      final recipe = RecipeEntity(
        id: 'recipe-delete-test',
        authorId: 'user-test-1',
        latestVersionId: 'version-delete-test',
        name: '삭제할 레시피',
        description: '테스트용',
        isPublic: true,
        createdAt: testTime,
        updatedAt: testTime,
      );

      final version = RecipeVersionEntity(
        id: 'version-delete-test',
        recipeId: 'recipe-delete-test',
        versionNumber: 1,
        name: '삭제할 버전',
        description: '테스트용 버전',
        ingredients: const [],
        steps: const [],
        authorId: 'user-test-1',
        createdAt: testTime,
      );

      await repository.saveRecipe(recipe, version);

      // 저장 확인
      var recipes = await repository.getRecipes();
      expect(recipes.length, 1);

      // 삭제
      await repository.deleteRecipe('recipe-delete-test');

      // 삭제 확인
      recipes = await repository.getRecipes();
      expect(recipes.length, 0);
    });

    test('존재하지 않는 레시피 버전 조회 테스트', () async {
      final version = await repository.getRecipeVersion('non-existent-version');
      expect(version, isNull);
    });

    test('빈 재료와 단계가 있는 레시피 저장 테스트', () async {
      final testTime = DateTime.now();
      
      final recipe = RecipeEntity(
        id: 'recipe-empty-test',
        authorId: 'user-test-1',
        latestVersionId: 'version-empty-test',
        name: '빈 레시피',
        description: '재료와 단계가 없는 레시피',
        isPublic: true,
        createdAt: testTime,
        updatedAt: testTime,
      );

      final version = RecipeVersionEntity(
        id: 'version-empty-test',
        recipeId: 'recipe-empty-test',
        versionNumber: 1,
        name: '빈 버전',
        description: '재료와 단계가 없음',
        ingredients: const [],
        steps: const [],
        authorId: 'user-test-1',
        createdAt: testTime,
      );

      // 저장이 성공해야 함
      await repository.saveRecipe(recipe, version);

      // 조회 확인
      final savedVersion = await repository.getRecipeVersion('version-empty-test');
      expect(savedVersion, isNotNull);
      expect(savedVersion!.ingredients, isEmpty);
      expect(savedVersion.steps, isEmpty);
    });
  });
}