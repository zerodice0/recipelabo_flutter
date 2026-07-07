import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/domain/usecases/get_all_ingredients_usecase.dart';
import 'package:recipick_flutter/domain/usecases/get_recipes_usecase.dart';
import 'package:recipick_flutter/domain/usecases/search_ingredients_usecase.dart';
import 'package:recipick_flutter/domain/usecases/get_recipes_by_ingredients_usecase.dart';
import 'package:recipick_flutter/domain/usecases/get_popular_ingredients_usecase.dart';
import 'package:recipick_flutter/domain/usecases/search_recipes_usecase.dart';

part 'ingredient_search_viewmodel.freezed.dart';
part 'ingredient_search_viewmodel.g.dart';

@freezed
abstract class IngredientSearchState with _$IngredientSearchState {
  const factory IngredientSearchState({
    @Default([]) List<String> availableIngredients,
    @Default([]) List<String> selectedIngredients,
    @Default([]) List<RecipeEntity> savedRecipes,
    @Default([]) List<RecipeEntity> filteredRecipes,
    @Default('') String searchQuery,
    @Default('') String recipeQuery,
    @Default(false) bool isLoading,
    @Default(false) bool isSearchingRecipes,
    String? error,
  }) = _IngredientSearchState;
}

@riverpod
class IngredientSearchViewModel extends _$IngredientSearchViewModel {
  @override
  IngredientSearchState build() {
    // 초기 빌드에서는 비동기 작업을 바로 실행하지 않음
    Future.microtask(() => _loadInitialData());
    return const IngredientSearchState();
  }

  Future<void> _loadInitialData() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final popularIngredientsUseCase = ref.read(
        getPopularIngredientsUseCaseProvider,
      );
      final recipesUseCase = ref.read(getRecipesUseCaseProvider);
      final popularIngredients = await popularIngredientsUseCase(limit: 30);
      final savedRecipes = await recipesUseCase();

      if (!_isIdleSearchState()) {
        return;
      }

      state = state.copyWith(
        availableIngredients: popularIngredients,
        savedRecipes: savedRecipes,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> searchIngredients(String query) async {
    final normalizedQuery = query.trim();
    state = state.copyWith(searchQuery: query, recipeQuery: '');

    if (normalizedQuery.isEmpty) {
      // 검색어가 비어있으면 자주 사용된 재료들을 다시 로드
      await _loadInitialData();
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final searchUseCase = ref.read(searchIngredientsUseCaseProvider);
      final searchResults = await searchUseCase(normalizedQuery);

      if (!_isCurrentIngredientQuery(normalizedQuery)) {
        return;
      }

      state = state.copyWith(
        availableIngredients: searchResults,
        isLoading: false,
      );
    } catch (error) {
      if (!_isCurrentIngredientQuery(normalizedQuery)) {
        return;
      }

      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  void toggleIngredientSelection(String ingredient) {
    final currentSelected = List<String>.from(state.selectedIngredients);

    if (currentSelected.contains(ingredient)) {
      currentSelected.remove(ingredient);
    } else {
      currentSelected.add(ingredient);
    }

    state = state.copyWith(
      selectedIngredients: currentSelected,
      recipeQuery: '',
      isLoading: false,
    );

    // 선택된 재료가 있으면 자동으로 레시피 검색
    if (currentSelected.isNotEmpty) {
      _searchRecipesByIngredients();
    } else {
      state = state.copyWith(filteredRecipes: []);
    }
  }

  void removeSelectedIngredient(String ingredient) {
    final currentSelected = List<String>.from(state.selectedIngredients);
    currentSelected.remove(ingredient);

    state = state.copyWith(
      selectedIngredients: currentSelected,
      recipeQuery: '',
      isLoading: false,
    );

    if (currentSelected.isNotEmpty) {
      _searchRecipesByIngredients();
    } else {
      state = state.copyWith(filteredRecipes: []);
    }
  }

  void clearAllSelectedIngredients() {
    state = state.copyWith(
      selectedIngredients: [],
      filteredRecipes: [],
      recipeQuery: '',
      isLoading: false,
    );
  }

  Future<void> searchRecipesByText(String query) async {
    final normalizedQuery = query.trim();
    state = state.copyWith(
      recipeQuery: query,
      selectedIngredients: [],
      searchQuery: '',
      isLoading: false,
    );

    if (normalizedQuery.isEmpty) {
      state = state.copyWith(
        filteredRecipes: [],
        isSearchingRecipes: false,
        error: null,
      );
      return;
    }

    state = state.copyWith(isSearchingRecipes: true, error: null);

    try {
      final searchUseCase = ref.read(searchRecipesUseCaseProvider);
      final recipes = await searchUseCase(normalizedQuery);

      if (!_isCurrentRecipeQuery(normalizedQuery)) {
        return;
      }

      state = state.copyWith(
        filteredRecipes: recipes,
        isSearchingRecipes: false,
      );
    } catch (error) {
      if (!_isCurrentRecipeQuery(normalizedQuery)) {
        return;
      }

      state = state.copyWith(
        isSearchingRecipes: false,
        error: error.toString(),
      );
    }
  }

  Future<void> _searchRecipesByIngredients() async {
    if (state.selectedIngredients.isEmpty) {
      state = state.copyWith(
        filteredRecipes: [],
        isSearchingRecipes: false,
        error: null,
      );
      return;
    }

    final selectedIngredients = List<String>.from(state.selectedIngredients);
    state = state.copyWith(isSearchingRecipes: true, error: null);

    try {
      final searchUseCase = ref.read(getRecipesByIngredientsUseCaseProvider);
      final recipes = await searchUseCase(selectedIngredients);

      if (!_isCurrentIngredientSelection(selectedIngredients)) {
        return;
      }

      state = state.copyWith(
        filteredRecipes: recipes,
        isSearchingRecipes: false,
      );
    } catch (error) {
      if (!_isCurrentIngredientSelection(selectedIngredients)) {
        return;
      }

      state = state.copyWith(
        isSearchingRecipes: false,
        error: error.toString(),
      );
    }
  }

  Future<void> loadAllIngredients() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final allIngredientsUseCase = ref.read(getAllIngredientsUseCaseProvider);
      final allIngredients = await allIngredientsUseCase();

      state = state.copyWith(
        availableIngredients: allIngredients,
        isLoading: false,
        searchQuery: '',
        recipeQuery: '',
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  void resetSearch() {
    state = state.copyWith(
      searchQuery: '',
      recipeQuery: '',
      selectedIngredients: [],
      filteredRecipes: [],
      isSearchingRecipes: false,
      error: null,
    );
    _loadInitialData();
  }

  bool _isCurrentIngredientQuery(String normalizedQuery) {
    return state.searchQuery.trim() == normalizedQuery &&
        state.recipeQuery.trim().isEmpty;
  }

  bool _isIdleSearchState() {
    return state.searchQuery.trim().isEmpty &&
        state.recipeQuery.trim().isEmpty &&
        state.selectedIngredients.isEmpty;
  }

  bool _isCurrentRecipeQuery(String normalizedQuery) {
    return state.recipeQuery.trim() == normalizedQuery &&
        state.searchQuery.trim().isEmpty &&
        state.selectedIngredients.isEmpty;
  }

  bool _isCurrentIngredientSelection(List<String> selectedIngredients) {
    if (state.recipeQuery.trim().isNotEmpty ||
        state.selectedIngredients.length != selectedIngredients.length) {
      return false;
    }

    for (var index = 0; index < selectedIngredients.length; index += 1) {
      if (state.selectedIngredients[index] != selectedIngredients[index]) {
        return false;
      }
    }

    return true;
  }
}
