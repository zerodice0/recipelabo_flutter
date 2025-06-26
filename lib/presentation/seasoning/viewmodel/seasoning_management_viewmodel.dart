import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saucerer_flutter/domain/entities/seasoning_entity.dart';
import 'package:saucerer_flutter/domain/usecases/get_all_seasonings_usecase.dart';
import 'package:saucerer_flutter/domain/usecases/search_seasonings_usecase.dart';
import 'package:saucerer_flutter/domain/usecases/create_seasoning_usecase.dart';
import 'package:saucerer_flutter/domain/usecases/delete_seasoning_usecase.dart';

part 'seasoning_management_viewmodel.freezed.dart';
part 'seasoning_management_viewmodel.g.dart';

@freezed
class SeasoningManagementState with _$SeasoningManagementState {
  const factory SeasoningManagementState({
    @Default([]) List<SeasoningEntity> seasonings,
    @Default([]) List<String> categories,
    @Default('') String searchQuery,
    String? selectedCategory,
    @Default(false) bool isLoading,
    @Default(false) bool isCreating,
    String? error,
  }) = _SeasoningManagementState;
}

@riverpod
class SeasoningManagementViewModel extends _$SeasoningManagementViewModel {
  @override
  SeasoningManagementState build() {
    Future.microtask(() => _loadSeasonings());
    return const SeasoningManagementState();
  }

  Future<void> _loadSeasonings() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final getAllUseCase = ref.read(getAllSeasoningsUseCaseProvider);
      final seasonings = await getAllUseCase();
      
      // 카테고리 추출
      final categories = seasonings
          .where((s) => s.category != null && s.category!.isNotEmpty)
          .map((s) => s.category!)
          .toSet()
          .toList()
        ..sort();
      
      state = state.copyWith(
        seasonings: seasonings,
        categories: categories,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
  }

  Future<void> searchSeasonings(String query) async {
    state = state.copyWith(searchQuery: query, isLoading: true, error: null);
    
    try {
      final searchUseCase = ref.read(searchSeasoningsUseCaseProvider);
      final seasonings = await searchUseCase(query);
      
      state = state.copyWith(
        seasonings: seasonings,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
  }

  void filterByCategory(String? category) {
    state = state.copyWith(selectedCategory: category);
    if (category == null) {
      _loadSeasonings();
    } else {
      final filtered = state.seasonings
          .where((s) => s.category == category)
          .toList();
      state = state.copyWith(seasonings: filtered);
    }
  }

  Future<void> createSeasoning({
    required String name,
    String? category,
    String? description,
  }) async {
    state = state.copyWith(isCreating: true, error: null);
    
    try {
      final createUseCase = ref.read(createSeasoningUseCaseProvider);
      await createUseCase(
        name: name,
        category: category,
        description: description,
      );
      
      state = state.copyWith(isCreating: false);
      await _loadSeasonings();
    } catch (error) {
      state = state.copyWith(
        isCreating: false,
        error: error.toString(),
      );
    }
  }

  Future<void> deleteSeasoning(String id) async {
    try {
      final deleteUseCase = ref.read(deleteSeasoningUseCaseProvider);
      await deleteUseCase(id);
      await _loadSeasonings();
    } catch (error) {
      state = state.copyWith(error: error.toString());
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  Future<void> refresh() async {
    await _loadSeasonings();
  }
}