import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saucerer_flutter/domain/entities/ingredient_entity.dart';
import 'package:saucerer_flutter/domain/entities/recipe_entity.dart';
import 'package:saucerer_flutter/domain/entities/recipe_version_entity.dart';
import 'package:saucerer_flutter/domain/entities/step_entity.dart';
import 'package:saucerer_flutter/domain/usecases/save_recipe_usecase.dart';
import 'package:saucerer_flutter/domain/usecases/get_recipe_usecase.dart';
import 'package:uuid/uuid.dart';

part 'recipe_edit_viewmodel.freezed.dart';
part 'recipe_edit_viewmodel.g.dart';

@freezed
class RecipeEditState with _$RecipeEditState {
  const factory RecipeEditState({
    @Default('') String name,
    @Default('') String description,
    @Default([]) List<IngredientEntity> ingredients,
    @Default([]) List<StepEntity> steps,
    @Default(AsyncValue.data(null)) AsyncValue<void> saveState,
    @Default(false) bool isLoading,
    @Default(false) bool isEditMode,
    String? recipeId,
    String? recipeVersionId,
    String? error,
  }) = _RecipeEditState;
}

@riverpod
class RecipeEditViewModel extends _$RecipeEditViewModel {
  @override
  RecipeEditState build(String? recipeId) {
    if (recipeId != null && recipeId.isNotEmpty) {
      // 기존 레시피 편집 모드
      Future.microtask(() => _loadRecipe(recipeId));
      return RecipeEditState(
        isEditMode: true,
        recipeId: recipeId,
        isLoading: true,
      );
    } else {
      // 새 레시피 생성 모드
      return const RecipeEditState(isEditMode: false);
    }
  }

  Future<void> _loadRecipe(String recipeId) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      
      final getRecipeUseCase = ref.read(getRecipeUseCaseProvider);
      final result = await getRecipeUseCase(recipeId);
      
      final recipe = result.$1;
      final latestVersion = result.$2;
      
      state = state.copyWith(
        name: recipe.name,
        description: recipe.description ?? '',
        ingredients: latestVersion.ingredients,
        steps: latestVersion.steps,
        recipeVersionId: latestVersion.id,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  void updateIngredients(List<IngredientEntity> ingredients) {
    state = state.copyWith(ingredients: ingredients);
  }

  void addIngredient() {
    final newIngredient = IngredientEntity(
      id: const Uuid().v4(),
      name: '',
      quantity: 0,
      unit: '',
    );
    state = state.copyWith(ingredients: [...state.ingredients, newIngredient]);
  }

  void updateIngredient(int index, IngredientEntity ingredient) {
    final newIngredients = [...state.ingredients];
    newIngredients[index] = ingredient;
    state = state.copyWith(ingredients: newIngredients);
  }

  void removeIngredient(int index) {
    final newIngredients = [...state.ingredients];
    newIngredients.removeAt(index);
    state = state.copyWith(ingredients: newIngredients);
  }

  void addStep() {
    final newStep = StepEntity(
      id: const Uuid().v4(),
      stepNumber: state.steps.length + 1,
      description: '',
    );
    state = state.copyWith(steps: [...state.steps, newStep]);
  }

  void updateStep(int index, StepEntity step) {
    final newSteps = [...state.steps];
    newSteps[index] = step;
    state = state.copyWith(steps: newSteps);
  }

  void removeStep(int index) {
    final newSteps = [...state.steps];
    newSteps.removeAt(index);
    // Re-number subsequent steps
    for (var i = index; i < newSteps.length; i++) {
      newSteps[i] = newSteps[i].copyWith(stepNumber: i + 1);
    }
    state = state.copyWith(steps: newSteps);
  }


  Future<void> saveRecipe() async {
    // 로딩 상태로 설정
    state = state.copyWith(saveState: const AsyncValue.loading());

    try {
      final now = DateTime.now();
      const uuid = Uuid();
      
      if (state.isEditMode && state.recipeId != null) {
        // 기존 레시피 수정 - 새 버전 생성
        final newVersionId = uuid.v4();
        
        // 기존 레시피 정보 업데이트
        final updatedRecipe = RecipeEntity(
          id: state.recipeId!,
          authorId: 'user-1', // TODO: Replace with actual user ID
          latestVersionId: newVersionId,
          name: state.name,
          description: state.description,
          isPublic: true,
          createdAt: now, // 원래 생성일자는 별도로 관리해야 함
          updatedAt: now,
        );

        // 새 버전 생성 (기존 버전 번호 + 1)
        final newVersion = RecipeVersionEntity(
          id: newVersionId,
          recipeId: state.recipeId!,
          versionNumber: 2, // TODO: 기존 최대 버전 번호 + 1로 계산
          name: state.name,
          description: state.description,
          ingredients: state.ingredients,
          steps: state.steps,
          authorId: 'user-1', // TODO: Replace with actual user ID
          createdAt: now,
        );

        final saveRecipeUseCase = ref.read(saveRecipeUseCaseProvider);
        await saveRecipeUseCase(updatedRecipe, newVersion);
      } else {
        // 새 레시피 생성
        final recipeId = uuid.v4();
        final versionId = uuid.v4();

        final recipe = RecipeEntity(
          id: recipeId,
          authorId: 'user-1', // TODO: Replace with actual user ID
          latestVersionId: versionId,
          name: state.name,
          description: state.description,
          isPublic: true,
          createdAt: now,
          updatedAt: now,
        );

        final version = RecipeVersionEntity(
          id: versionId,
          recipeId: recipeId,
          versionNumber: 1,
          name: state.name,
          description: state.description,
          ingredients: state.ingredients,
          steps: state.steps,
          authorId: 'user-1', // TODO: Replace with actual user ID
          createdAt: now,
        );

        final saveRecipeUseCase = ref.read(saveRecipeUseCaseProvider);
        await saveRecipeUseCase(recipe, version);
      }
      
      // 성공 상태로 설정
      state = state.copyWith(saveState: const AsyncValue.data(null));
    } catch (error, stackTrace) {
      // 에러 상태로 설정
      state = state.copyWith(saveState: AsyncValue.error(error, stackTrace));
    }
  }
}
