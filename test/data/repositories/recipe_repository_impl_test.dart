import 'package:flutter_test/flutter_test.dart';
import 'package:recipick_flutter/core/config/local_user_policy.dart';
import 'package:recipick_flutter/data/models/recipe_model.dart';
import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/domain/entities/recipe_version_entity.dart';
import 'package:recipick_flutter/domain/entities/ingredient_entity.dart';
import 'package:recipick_flutter/domain/entities/step_entity.dart';
import 'package:recipick_flutter/domain/entities/cooking_log_entity.dart';

void main() {
  group('RecipeRepositoryImpl 테스트', () {
    test('레시피 엔티티 생성 테스트', () {
      final testTime = DateTime.now();

      final recipe = RecipeEntity(
        id: 'recipe-test-1',
        authorId: 'user-test-1',
        latestVersionId: 'version-test-1',
        name: '김치찌개',
        description: '얼큰한 김치찌개',
        sourceUrl: 'https://example.com/kimchi-jjigae',
        sourceName: 'Example Recipe',
        importedAt: testTime,
        isPublic: true,
        createdAt: testTime,
        updatedAt: testTime,
      );

      expect(recipe.id, 'recipe-test-1');
      expect(recipe.name, '김치찌개');
      expect(recipe.description, '얼큰한 김치찌개');
      expect(recipe.sourceUrl, 'https://example.com/kimchi-jjigae');
      expect(recipe.sourceName, 'Example Recipe');
      expect(recipe.importedAt, testTime);
      expect(recipe.isPublic, true);
    });

    test('레시피 모델 기본 공개 상태는 비공개다', () {
      final testTime = DateTime.now();

      final recipe = RecipeModel(
        id: 'recipe-private-default',
        authorId: LocalUserPolicy.localUserId,
        latestVersionId: 'version-private-default',
        name: '비공개 기본 레시피',
        createdAt: testTime,
        updatedAt: testTime,
      );

      expect(recipe.isPublic, false);
    });

    test('레시피 버전 엔티티 생성 테스트', () {
      final testTime = DateTime.now();

      final version = RecipeVersionEntity(
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
        ],
        steps: const [
          StepEntity(id: 'step-1', stepNumber: 1, description: '김치를 볶는다'),
        ],
        authorId: 'user-test-1',
        createdAt: testTime,
        versionStatus: 'favorite',
      );

      expect(version.id, 'version-test-1');
      expect(version.recipeId, 'recipe-test-1');
      expect(version.versionNumber, 1);
      expect(version.name, '김치찌개 기본 레시피');
      expect(version.ingredients.length, 1);
      expect(version.steps.length, 1);
      expect(version.versionStatus, 'favorite');
    });

    test('재료 엔티티 생성 테스트', () {
      const ingredient = IngredientEntity(
        id: 'ingredient-1',
        name: '김치',
        quantity: 200,
        unit: 'g',
      );

      expect(ingredient.id, 'ingredient-1');
      expect(ingredient.name, '김치');
      expect(ingredient.quantity, 200);
      expect(ingredient.unit, 'g');
    });

    test('조리 단계 엔티티 생성 테스트', () {
      const step = StepEntity(
        id: 'step-1',
        stepNumber: 1,
        description: '김치를 볶는다',
      );

      expect(step.id, 'step-1');
      expect(step.stepNumber, 1);
      expect(step.description, '김치를 볶는다');
    });

    test('쿠킹 로그 맛 평가 엔티티 생성 테스트', () {
      final testTime = DateTime.now();

      final cookingLog = CookingLogEntity(
        id: 'log-1',
        recipeVersionId: 'version-test-1',
        authorId: 'user-test-1',
        title: '덜 짠 2차 시도',
        overallRating: 4,
        saltinessRating: 3,
        sweetnessRating: 2,
        spicinessRating: 4,
        umamiRating: 5,
        failureReason: '간장이 아직 조금 많음',
        nextAdjustment: '간장 0.5T 감소',
        cookedAt: testTime,
        createdAt: testTime,
      );

      expect(cookingLog.overallRating, 4);
      expect(cookingLog.saltinessRating, 3);
      expect(cookingLog.failureReason, '간장이 아직 조금 많음');
      expect(cookingLog.nextAdjustment, '간장 0.5T 감소');
    });
  });
}
