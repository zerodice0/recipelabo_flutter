import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saucerer_flutter/domain/entities/ingredient_master_entity.dart';
import 'package:saucerer_flutter/domain/entities/category_entity.dart';
import 'package:saucerer_flutter/domain/usecases/get_all_ingredient_masters_usecase.dart';

part 'units_provider.g.dart';

/// 사용 가능한 단위 목록을 제공하는 Provider
@riverpod
class AvailableUnits extends _$AvailableUnits {
  @override
  Future<List<IngredientMasterEntity>> build() async {
    return _loadUnits();
  }

  /// 단위 목록을 새로고침합니다.
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadUnits());
  }

  /// 데이터베이스에서 단위 목록을 가져옵니다.
  Future<List<IngredientMasterEntity>> _loadUnits() async {
    final getAllUseCase = ref.read(getAllIngredientMastersUseCaseProvider);
    final allData = await getAllUseCase();

    // 단위 카테고리만 필터링하고 사용 빈도순으로 정렬
    final units = allData
        .where((item) => item.categoryId == PredefinedCategories.unit.id)
        .toList()
      ..sort((a, b) => b.usageCount.compareTo(a.usageCount));

    return units;
  }
}