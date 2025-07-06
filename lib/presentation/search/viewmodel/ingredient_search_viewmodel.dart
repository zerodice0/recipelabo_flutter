import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/domain/usecases/get_all_ingredients_usecase.dart';
import 'package:recipick_flutter/domain/usecases/search_ingredients_usecase.dart';
import 'package:recipick_flutter/domain/usecases/get_recipes_by_ingredients_usecase.dart';
import 'package:recipick_flutter/domain/usecases/get_popular_ingredients_usecase.dart';

part 'ingredient_search_viewmodel.freezed.dart';
part 'ingredient_search_viewmodel.g.dart';

@freezed
class IngredientSearchState with _$IngredientSearchState {
  const factory IngredientSearchState({
    @Default([]) List<String> availableIngredients,
    @Default([]) List<String> selectedIngredients,
    @Default([]) List<RecipeEntity> filteredRecipes,
    @Default('') String searchQuery,
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
      final popularIngredients = await popularIngredientsUseCase(limit: 30);

      state = state.copyWith(
        availableIngredients: popularIngredients,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> searchIngredients(String query) async {
    state = state.copyWith(searchQuery: query);

    if (query.trim().isEmpty) {
      // 검색어가 비어있으면 자주 사용된 재료들을 다시 로드
      await _loadInitialData();
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final searchUseCase = ref.read(searchIngredientsUseCaseProvider);
      final searchResults = await searchUseCase(query.trim());

      state = state.copyWith(
        availableIngredients: searchResults,
        isLoading: false,
      );
    } catch (error) {
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

    state = state.copyWith(selectedIngredients: currentSelected);

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

    state = state.copyWith(selectedIngredients: currentSelected);

    if (currentSelected.isNotEmpty) {
      _searchRecipesByIngredients();
    } else {
      state = state.copyWith(filteredRecipes: []);
    }
  }

  void clearAllSelectedIngredients() {
    state = state.copyWith(selectedIngredients: [], filteredRecipes: []);
  }

  Future<void> _searchRecipesByIngredients() async {
    if (state.selectedIngredients.isEmpty) {
      state = state.copyWith(filteredRecipes: []);
      return;
    }

    state = state.copyWith(isSearchingRecipes: true, error: null);

    try {
      final searchUseCase = ref.read(getRecipesByIngredientsUseCaseProvider);
      final recipes = await searchUseCase(state.selectedIngredients);

      state = state.copyWith(
        filteredRecipes: recipes,
        isSearchingRecipes: false,
      );
    } catch (error) {
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
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  void resetSearch() {
    state = state.copyWith(
      searchQuery: '',
      selectedIngredients: [],
      filteredRecipes: [],
    );
    _loadInitialData();
  }
}
