import 'package:freezed_annotation/freezed_annotation.dart';

part 'seasoning_entity.freezed.dart';

// TODO: 향후 ingredient_master_entity.dart로 파일명 변경 필요
@freezed
class SeasoningEntity with _$SeasoningEntity {
  const factory SeasoningEntity({
    required String id,
    required String name,
    String? category, // 예: '재료', '단위' 또는 재료의 세부 분류 ('채소', '육류', '양념', '향신료' 등)
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(0) int usageCount, // 사용 빈도 추적
  }) = _SeasoningEntity;
}

// 마스터 데이터 카테고리 상수
class MasterDataCategory {
  static const String ingredient = '재료';
  static const String unit = '단위';
}

// 마스터 데이터 엔티티의 별칭들
typedef IngredientMasterEntity = SeasoningEntity;
typedef UnitMasterEntity = SeasoningEntity;
typedef MasterDataEntity = SeasoningEntity;