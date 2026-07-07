import 'package:flutter_test/flutter_test.dart';
import 'package:recipick_flutter/data/datasources/local/database_helper.dart';
import 'package:recipick_flutter/data/datasources/local/recipe_local_data_source.dart';
import 'package:recipick_flutter/data/models/ingredient_model.dart';
import 'package:recipick_flutter/data/models/recipe_model.dart';
import 'package:recipick_flutter/data/models/recipe_version_model.dart';
import 'package:recipick_flutter/data/models/step_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late DatabaseHelper databaseHelper;
  late Database database;
  late RecipeLocalDataSourceImpl dataSource;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() async {
    databaseHelper = DatabaseHelper();
    database = await databaseHelper.database;
    dataSource = RecipeLocalDataSourceImpl(databaseHelper);

    await database.delete('ingredients');
    await database.delete('steps');
    await database.delete('recipe_versions');
    await database.delete('recipes');
    await database.delete('users');
  });

  test('기존 버전 저장 시 빠진 재료와 단계는 soft-delete된다', () async {
    final now = DateTime(2026, 7, 7, 12);
    final recipe = RecipeModel(
      id: 'recipe-1',
      authorId: 'user-1',
      latestVersionId: 'version-1',
      name: '테스트 레시피',
      description: '덮어쓰기 테스트',
      createdAt: now,
      updatedAt: now,
    );

    final originalVersion = RecipeVersionModel(
      id: 'version-1',
      recipeId: 'recipe-1',
      versionNumber: 1,
      name: '테스트 레시피',
      description: '원본',
      ingredients: [
        IngredientModel(
          id: 'ingredient-keep',
          recipeVersionId: 'version-1',
          name: '간장',
          quantity: 1,
          unit: 'T',
          createdAt: now,
          updatedAt: now,
        ),
        IngredientModel(
          id: 'ingredient-remove',
          recipeVersionId: 'version-1',
          name: '설탕',
          quantity: 1,
          unit: 'T',
          createdAt: now,
          updatedAt: now,
        ),
      ],
      steps: [
        StepModel(
          id: 'step-keep',
          recipeVersionId: 'version-1',
          stepNumber: 1,
          description: '섞는다',
          createdAt: now,
          updatedAt: now,
        ),
        StepModel(
          id: 'step-remove',
          recipeVersionId: 'version-1',
          stepNumber: 2,
          description: '끓인다',
          createdAt: now,
          updatedAt: now,
        ),
      ],
      authorId: 'user-1',
      createdAt: now,
      updatedAt: now,
    );

    await dataSource.saveRecipe(recipe, originalVersion);

    final overwrittenVersion = originalVersion.copyWith(
      description: '덮어쓴 버전',
      ingredients: [originalVersion.ingredients.first],
      steps: [originalVersion.steps.first],
    );

    await dataSource.saveRecipe(
      recipe.copyWith(updatedAt: now.add(const Duration(minutes: 1))),
      overwrittenVersion,
    );

    final ingredients = await database.query(
      'ingredients',
      where: 'recipeVersionId = ?',
      whereArgs: ['version-1'],
    );
    final steps = await database.query(
      'steps',
      where: 'recipeVersionId = ?',
      whereArgs: ['version-1'],
    );

    expect(
      ingredients.firstWhere(
        (row) => row['id'] == 'ingredient-keep',
      )['isDeleted'],
      0,
    );
    expect(
      ingredients.firstWhere(
        (row) => row['id'] == 'ingredient-remove',
      )['isDeleted'],
      1,
    );
    expect(steps.firstWhere((row) => row['id'] == 'step-keep')['isDeleted'], 0);
    expect(
      steps.firstWhere((row) => row['id'] == 'step-remove')['isDeleted'],
      1,
    );
  });

  test('레시피 텍스트 검색은 이름, 출처, 재료, 단계, 변경 로그를 찾는다', () async {
    final now = DateTime(2026, 7, 7, 12);
    final recipe = RecipeModel(
      id: 'recipe-search',
      authorId: 'user-1',
      latestVersionId: 'version-search',
      name: '간장 계란밥',
      description: '빠르게 만드는 한 끼',
      sourceName: '집밥 노트',
      sourceUrl: 'https://example.com/egg-rice',
      createdAt: now,
      updatedAt: now,
    );
    final version = RecipeVersionModel(
      id: 'version-search',
      recipeId: 'recipe-search',
      versionNumber: 1,
      name: '간장 계란밥',
      description: '기본 버전',
      versionName: '덜 짠 버전',
      changeLog: '간장 반 스푼 감소',
      ingredients: [
        IngredientModel(
          id: 'ingredient-search',
          recipeVersionId: 'version-search',
          name: '참기름',
          quantity: 1,
          unit: 'T',
          createdAt: now,
          updatedAt: now,
        ),
      ],
      steps: [
        StepModel(
          id: 'step-search',
          recipeVersionId: 'version-search',
          stepNumber: 1,
          description: '밥 위에 계란을 올린다',
          createdAt: now,
          updatedAt: now,
        ),
      ],
      authorId: 'user-1',
      createdAt: now,
      updatedAt: now,
    );

    await dataSource.saveRecipe(recipe, version);

    expect(
      (await dataSource.searchRecipes('계란밥')).map((recipe) => recipe.id),
      contains('recipe-search'),
    );
    expect(
      (await dataSource.searchRecipes('집밥')).map((recipe) => recipe.id),
      contains('recipe-search'),
    );
    expect(
      (await dataSource.searchRecipes('참기름')).map((recipe) => recipe.id),
      contains('recipe-search'),
    );
    expect(
      (await dataSource.searchRecipes('계란을 올린다')).map((recipe) => recipe.id),
      contains('recipe-search'),
    );
    expect(
      (await dataSource.searchRecipes('반 스푼')).map((recipe) => recipe.id),
      contains('recipe-search'),
    );
    expect(await dataSource.searchRecipes('없는 검색어'), isEmpty);
  });

  test('조리 단계 이미지 경로는 저장 후 조회 시 보존된다', () async {
    final now = DateTime(2026, 7, 7, 12);
    final recipe = RecipeModel(
      id: 'recipe-step-image',
      authorId: 'user-1',
      latestVersionId: 'version-step-image',
      name: '단계 이미지 레시피',
      description: '단계별 사진 저장 테스트',
      createdAt: now,
      updatedAt: now,
    );
    final version = RecipeVersionModel(
      id: 'version-step-image',
      recipeId: 'recipe-step-image',
      versionNumber: 1,
      name: '단계 이미지 레시피',
      description: '기본 버전',
      ingredients: [],
      steps: [
        StepModel(
          id: 'step-with-image',
          recipeVersionId: 'version-step-image',
          stepNumber: 1,
          description: '팬에 양파를 볶는다',
          imageUrl: '/local/images/onion.jpg',
          createdAt: now,
          updatedAt: now,
        ),
      ],
      authorId: 'user-1',
      createdAt: now,
      updatedAt: now,
    );

    await dataSource.saveRecipe(recipe, version);

    final restoredVersion = await dataSource.getRecipeVersion(
      'version-step-image',
    );

    expect(restoredVersion, isNotNull);
    expect(restoredVersion!.steps.single.imageUrl, '/local/images/onion.jpg');
  });
}
