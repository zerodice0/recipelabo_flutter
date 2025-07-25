import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/entities/ingredient_master_entity.dart';
import 'package:recipick_flutter/domain/entities/category_entity.dart';
import 'package:recipick_flutter/domain/usecases/get_all_ingredient_masters_usecase.dart';

part 'ingredients_provider.g.dart';

/// 사용 가능한 재료 목록을 제공하는 Provider
@riverpod
class AvailableIngredients extends _$AvailableIngredients {
  @override
  Future<List<IngredientMasterEntity>> build() async {
    return _loadIngredients();
  }

  /// 재료 목록을 새로고침합니다.
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadIngredients());
  }

  /// 데이터베이스에서 재료 목록을 가져옵니다.
  Future<List<IngredientMasterEntity>> _loadIngredients() async {
    final getAllUseCase = ref.read(getAllIngredientMastersUseCaseProvider);
    final allData = await getAllUseCase();

    // 재료 카테고리만 필터링하고 사용 빈도순으로 정렬
    final ingredients =
        allData
            .where(
              (item) => item.categoryId == PredefinedCategories.ingredient.id,
            )
            .toList()
          ..sort((a, b) => b.usageCount.compareTo(a.usageCount));

    return ingredients;
  }
}
