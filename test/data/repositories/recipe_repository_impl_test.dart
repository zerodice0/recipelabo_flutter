import 'package:flutter_test/flutter_test.dart';
import 'package:saucerer_flutter/domain/entities/recipe_entity.dart';
import 'package:saucerer_flutter/domain/entities/recipe_version_entity.dart';
import 'package:saucerer_flutter/domain/entities/ingredient_entity.dart';
import 'package:saucerer_flutter/domain/entities/step_entity.dart';

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
        isPublic: true,
        createdAt: testTime,
        updatedAt: testTime,
      );

      expect(recipe.id, 'recipe-test-1');
      expect(recipe.name, '김치찌개');
      expect(recipe.description, '얼큰한 김치찌개');
      expect(recipe.isPublic, true);
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
          StepEntity(
            id: 'step-1',
            stepNumber: 1,
            description: '김치를 볶는다',
          ),
        ],
        authorId: 'user-test-1',
        createdAt: testTime,
      );

      expect(version.id, 'version-test-1');
      expect(version.recipeId, 'recipe-test-1');
      expect(version.versionNumber, 1);
      expect(version.name, '김치찌개 기본 레시피');
      expect(version.ingredients.length, 1);
      expect(version.steps.length, 1);
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
  });
}