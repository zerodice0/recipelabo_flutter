import 'package:flutter_test/flutter_test.dart';
import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/domain/entities/recipe_version_entity.dart';
import 'package:recipick_flutter/domain/entities/ingredient_entity.dart';
import 'package:recipick_flutter/domain/entities/step_entity.dart';

void main() {
  group('간단한 레시피 엔티티 테스트', () {
    test('레시피 엔티티 생성 테스트', () {
      final testTime = DateTime.now();

      final recipe = RecipeEntity(
        id: 'test-recipe-1',
        authorId: 'test-user-1',
        latestVersionId: 'test-version-1',
        name: '떡볶이',
        description: '매콤한 떡볶이',
        isPublic: true,
        createdAt: testTime,
        updatedAt: testTime,
      );

      expect(recipe.id, 'test-recipe-1');
      expect(recipe.name, '떡볶이');
      expect(recipe.description, '매콤한 떡볶이');
      expect(recipe.isPublic, true);
    });

    test('레시피 버전 엔티티 생성 테스트', () {
      final testTime = DateTime.now();

      final version = RecipeVersionEntity(
        id: 'test-version-1',
        recipeId: 'test-recipe-1',
        versionNumber: 1,
        name: '떡볶이 v1',
        description: '기본 떡볶이 레시피',
        ingredients: const [
          IngredientEntity(
            id: 'ingredient-1',
            name: '떡',
            quantity: 300,
            unit: 'g',
          ),
          IngredientEntity(
            id: 'ingredient-2',
            name: '고추장',
            quantity: 2,
            unit: '큰술',
          ),
        ],
        steps: const [
          StepEntity(id: 'step-1', stepNumber: 1, description: '떡을 찬물에 담가둔다'),
          StepEntity(id: 'step-2', stepNumber: 2, description: '고추장을 물에 풀어준다'),
        ],
        authorId: 'test-user-1',
        createdAt: testTime,
      );

      expect(version.id, 'test-version-1');
      expect(version.name, '떡볶이 v1');
      expect(version.ingredients.length, 2);
      expect(version.steps.length, 2);
      expect(version.ingredients.first.name, '떡');
      expect(version.steps.first.description, '떡을 찬물에 담가둔다');
    });

    test('재료 엔티티 필드 확인', () {
      const ingredient = IngredientEntity(
        id: 'ingredient-test',
        name: '양파',
        quantity: 0.5,
        unit: '개',
      );

      expect(ingredient.id, 'ingredient-test');
      expect(ingredient.name, '양파');
      expect(ingredient.quantity, 0.5);
      expect(ingredient.unit, '개');
      expect(ingredient.recipeVersionId, null); // optional 필드
    });

    test('조리 단계 엔티티 필드 확인', () {
      const step = StepEntity(
        id: 'step-test',
        stepNumber: 3,
        description: '중불에서 5분간 볶는다',
        imageUrl: 'https://example.com/image.jpg',
      );

      expect(step.id, 'step-test');
      expect(step.stepNumber, 3);
      expect(step.description, '중불에서 5분간 볶는다');
      expect(step.imageUrl, 'https://example.com/image.jpg');
      expect(step.recipeVersionId, null); // optional 필드
    });
  });
}
