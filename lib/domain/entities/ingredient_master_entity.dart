import 'package:freezed_annotation/freezed_annotation.dart';
import 'category_entity.dart';

part 'ingredient_master_entity.freezed.dart';

@freezed
class IngredientMasterEntity with _$IngredientMasterEntity {
  const factory IngredientMasterEntity({
    required String id,
    required String name,
    required String categoryId, // CategoryEntity의 ID 참조
    String? subCategory, // 세부 카테고리 (예: 단위의 경우 '무게', '부피', '개수', '기타')
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(0) int usageCount, // 사용 빈도 추적
  }) = _IngredientMasterEntity;

  const IngredientMasterEntity._();

  /// 사전 정의된 카테고리인지 확인
  bool get hasPredefinedCategory {
    return PredefinedCategories.findById(categoryId) != null;
  }

  /// 카테고리 엔티티 조회 (사전 정의된 카테고리만)
  CategoryEntity? get predefinedCategory {
    return PredefinedCategories.findById(categoryId);
  }
}

// 하위 호환성을 위한 마스터 데이터 카테고리 상수 (Deprecated)
@Deprecated('Use PredefinedCategories.ingredient.id instead')
class MasterDataCategory {
  static const String ingredient = 'ingredient';
  static const String unit = 'unit';
}

// 마스터 데이터 엔티티의 별칭들
typedef UnitMasterEntity = IngredientMasterEntity;
typedef MasterDataEntity = IngredientMasterEntity;

// SeasoningEntity는 이제 IngredientMasterEntity로 완전히 대체됨