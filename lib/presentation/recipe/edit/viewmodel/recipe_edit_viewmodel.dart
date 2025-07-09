import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/entities/ingredient_entity.dart';
import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/domain/entities/recipe_version_entity.dart';
import 'package:recipick_flutter/domain/entities/step_entity.dart';
import 'package:recipick_flutter/domain/usecases/save_recipe_usecase.dart';
import 'package:recipick_flutter/domain/usecases/get_recipe_with_versions_usecase.dart';
import 'package:recipick_flutter/domain/usecases/check_version_name_exists_usecase.dart';
import 'package:uuid/uuid.dart';

part 'recipe_edit_viewmodel.freezed.dart';
part 'recipe_edit_viewmodel.g.dart';

@freezed
abstract class RecipeEditState with _$RecipeEditState {
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
    String? initialVersionId, // 편집할 특정 버전 ID
    String? error,
    @Default(false) bool showSaveOptions,
    @Default(true) bool createNewVersion,
    @Default('') String changeLog,
    @Default('') String versionName, // 사용자 정의 버전명
    RecipeEntity? originalRecipe,
    List<RecipeVersionEntity>? allVersions,
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

      final getRecipeWithVersionsUseCase = ref.read(
        getRecipeWithVersionsUseCaseProvider,
      );
      final result = await getRecipeWithVersionsUseCase(recipeId);

      final recipe = result.$1;
      final allVersions = result.$2;

      if (recipe == null) throw Exception('레시피를 찾을 수 없습니다');

      // 특정 버전 ID가 지정되어 있으면 해당 버전을 찾고, 없으면 최신 버전 사용
      RecipeVersionEntity targetVersion;
      if (state.initialVersionId != null &&
          state.initialVersionId!.isNotEmpty) {
        try {
          targetVersion = allVersions.firstWhere(
            (version) => version.id == state.initialVersionId,
          );
        } catch (e) {
          // 지정된 버전을 찾을 수 없으면 최신 버전 사용
          targetVersion = allVersions.isNotEmpty
              ? allVersions.first
              : throw Exception('버전이 없습니다');
        }
      } else {
        targetVersion = allVersions.isNotEmpty
            ? allVersions.first
            : throw Exception('버전이 없습니다');
      }

      state = state.copyWith(
        name: recipe.name,
        description: recipe.description ?? '',
        ingredients: targetVersion.ingredients,
        steps: targetVersion.steps,
        recipeVersionId: targetVersion.id,
        originalRecipe: recipe,
        allVersions: allVersions,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  void _loadSpecificVersion(String versionId) {
    if (state.allVersions == null) return;

    try {
      final targetVersion = state.allVersions!.firstWhere(
        (version) => version.id == versionId,
      );

      state = state.copyWith(
        ingredients: targetVersion.ingredients,
        steps: targetVersion.steps,
        recipeVersionId: targetVersion.id,
        name: targetVersion.name,
        description: targetVersion.description,
      );
    } catch (e) {
      // 버전을 찾을 수 없으면 무시
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

  void showSaveOptions() {
    state = state.copyWith(showSaveOptions: true);
  }

  void hideSaveOptions() {
    state = state.copyWith(showSaveOptions: false);
  }

  void toggleCreateNewVersion(bool createNew) {
    state = state.copyWith(createNewVersion: createNew);
  }

  void updateChangeLog(String changeLog) {
    state = state.copyWith(changeLog: changeLog);
  }

  void updateVersionName(String versionName) {
    state = state.copyWith(versionName: versionName);
  }

  void clearSaveError() {
    state = state.copyWith(saveState: const AsyncValue.data(null));
  }

  void setInitialVersionId(String versionId) {
    state = state.copyWith(initialVersionId: versionId);
    // 이미 로드된 상태에서 버전 ID가 변경되면 해당 버전을 로드
    if (state.isEditMode &&
        state.recipeId != null &&
        state.allVersions != null) {
      _loadSpecificVersion(versionId);
    }
  }

  Future<void> saveRecipe() async {
    if (state.isEditMode) {
      // 편집 모드일 때는 저장 옵션 다이얼로그 표시
      showSaveOptions();
      return;
    }

    // 새 레시피 생성 모드일 때는 바로 저장
    await performSave();
  }

  Future<void> performSave() async {
    // 새 버전 생성 시 버전명 중복 검사
    if (state.isEditMode &&
        state.createNewVersion &&
        state.versionName.isNotEmpty &&
        state.recipeId != null) {
      final checkVersionNameUseCase = ref.read(
        checkVersionNameExistsUseCaseProvider,
      );
      final exists = await checkVersionNameUseCase(
        recipeId: state.recipeId!,
        versionName: state.versionName,
      );

      if (exists) {
        // 중복 버전명 에러 처리 - UI에서 다이얼로그로 처리
        state = state.copyWith(
          saveState: AsyncValue.error(
            'VERSION_NAME_CONFLICT:${state.versionName}',
            StackTrace.current,
          ),
        );
        return;
      }
    }

    // 로딩 상태로 설정
    state = state.copyWith(saveState: const AsyncValue.loading());

    try {
      final now = DateTime.now();
      const uuid = Uuid();

      if (state.isEditMode &&
          state.recipeId != null &&
          state.originalRecipe != null) {
        if (state.createNewVersion) {
          // 새 버전 생성
          final newVersionId = uuid.v4();
          final maxVersionNumber =
              state.allVersions
                  ?.map((v) => v.versionNumber)
                  .reduce((a, b) => a > b ? a : b) ??
              1;
          final newVersionNumber = maxVersionNumber + 1;

          // 기존 레시피 정보 유지하면서 업데이트
          final updatedRecipe = state.originalRecipe!.copyWith(
            latestVersionId: newVersionId,
            name: state.name,
            description: state.description,
            updatedAt: now,
          );

          // 새 버전 생성 - 재료와 단계에 새로운 ID 할당
          final newIngredients = state.ingredients
              .map((ingredient) => ingredient.copyWith(id: uuid.v4()))
              .toList();

          final newSteps = state.steps
              .map((step) => step.copyWith(id: uuid.v4()))
              .toList();

          final newVersion = RecipeVersionEntity(
            id: newVersionId,
            recipeId: state.recipeId!,
            versionNumber: newVersionNumber,
            name: state.name,
            versionName: state.versionName.isEmpty ? null : state.versionName,
            description: state.description,
            ingredients: newIngredients,
            steps: newSteps,
            authorId: state.originalRecipe!.authorId,
            createdAt: now,
            changeLog: state.changeLog.isEmpty ? null : state.changeLog,
            baseVersionId: state.recipeVersionId, // 기반 버전 ID 설정
          );

          final saveRecipeUseCase = ref.read(saveRecipeUseCaseProvider);
          await saveRecipeUseCase(updatedRecipe, newVersion);
        } else {
          // 기존 버전 덮어쓰기
          final currentVersion = state.allVersions?.firstWhere(
            (v) => v.id == state.recipeVersionId,
          );
          if (currentVersion == null) throw Exception('현재 버전을 찾을 수 없습니다');

          final updatedRecipe = state.originalRecipe!.copyWith(
            name: state.name,
            description: state.description,
            updatedAt: now,
          );

          final updatedVersion = currentVersion.copyWith(
            name: state.name,
            description: state.description,
            ingredients: state.ingredients,
            steps: state.steps,
          );

          final saveRecipeUseCase = ref.read(saveRecipeUseCaseProvider);
          await saveRecipeUseCase(updatedRecipe, updatedVersion);
        }
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
