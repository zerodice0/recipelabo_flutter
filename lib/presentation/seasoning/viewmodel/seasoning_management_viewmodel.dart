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
    @Default([]) List<SeasoningEntity> seasonings, // 현재 표시되는 데이터
    @Default([]) List<SeasoningEntity> allSeasonings, // 원본 전체 데이터
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

      // 카테고리 추출 - 표시명 사용
      final categories =
          seasonings
              .map((s) => s.predefinedCategory?.displayName ?? s.categoryId)
              .toSet()
              .toList()
            ..sort();

      state = state.copyWith(
        allSeasonings: seasonings, // 원본 데이터 저장
        categories: categories,
        isLoading: false,
      );

      // 현재 선택된 카테고리 필터 재적용
      _applyCurrentFilter();
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> searchSeasonings(String query) async {
    state = state.copyWith(searchQuery: query, isLoading: true, error: null);

    try {
      final searchUseCase = ref.read(searchSeasoningsUseCaseProvider);
      final searchResults = await searchUseCase(query);

      // 원본 데이터 업데이트
      state = state.copyWith(allSeasonings: searchResults, isLoading: false);

      // 현재 선택된 카테고리 필터 재적용
      _applyCurrentFilter();
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  void filterByCategory(String? category) {
    state = state.copyWith(selectedCategory: category);
    _applyCurrentFilter();
  }

  /// 현재 선택된 카테고리 필터를 적용하는 헬퍼 메서드
  void _applyCurrentFilter() {
    final selectedCategory = state.selectedCategory;

    if (selectedCategory == null) {
      // 전체 선택 시 원본 데이터 표시
      state = state.copyWith(seasonings: state.allSeasonings);
    } else {
      // 선택된 카테고리로 필터링 (항상 원본 데이터에서 필터링)
      final filtered =
          state.allSeasonings.where((s) {
            final displayName =
                s.predefinedCategory?.displayName ?? s.categoryId;
            return displayName == selectedCategory;
          }).toList();
      state = state.copyWith(seasonings: filtered);
    }
  }

  Future<void> createSeasoning({
    required String name,
    required String categoryId,
    String? description,
  }) async {
    state = state.copyWith(isCreating: true, error: null);

    try {
      final createUseCase = ref.read(createSeasoningUseCaseProvider);
      await createUseCase(
        name: name,
        categoryId: categoryId,
        description: description,
      );

      state = state.copyWith(isCreating: false);
      await _loadSeasonings();
    } catch (error) {
      state = state.copyWith(isCreating: false, error: error.toString());
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
