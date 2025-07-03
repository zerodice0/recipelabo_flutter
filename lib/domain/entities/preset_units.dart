import 'package:saucerer_flutter/domain/entities/ingredient_master_entity.dart';

/// 자주 사용하는 단위들의 프리셋 정의
class PresetUnits {
  static const String _unitCategoryId = 'unit';
  
  /// 무게 단위
  static const String _weightSubCategory = '무게';
  static final List<IngredientMasterEntity> weightUnits = [
    _createUnit('g', '그램', _weightSubCategory),
    _createUnit('kg', '킬로그램', _weightSubCategory),
    _createUnit('mg', '밀리그램', _weightSubCategory),
  ];

  /// 부피 단위  
  static const String _volumeSubCategory = '부피';
  static final List<IngredientMasterEntity> volumeUnits = [
    _createUnit('ml', '밀리리터', _volumeSubCategory),
    _createUnit('l', '리터', _volumeSubCategory),
    _createUnit('큰술', '큰술 (15ml)', _volumeSubCategory),
    _createUnit('작은술', '작은술 (5ml)', _volumeSubCategory),
    _createUnit('컵', '컵 (200ml)', _volumeSubCategory),
    _createUnit('방울', '방울', _volumeSubCategory),
  ];

  /// 개수 단위
  static const String _countSubCategory = '개수';
  static final List<IngredientMasterEntity> countUnits = [
    _createUnit('개', '개', _countSubCategory),
    _createUnit('조각', '조각', _countSubCategory),
    _createUnit('쪽', '쪽', _countSubCategory),
    _createUnit('알', '알', _countSubCategory),
    _createUnit('통', '통', _countSubCategory),
    _createUnit('포기', '포기', _countSubCategory),
    _createUnit('줄기', '줄기', _countSubCategory),
    _createUnit('장', '장', _countSubCategory),
  ];

  /// 기타 단위
  static const String _etcSubCategory = '기타';
  static final List<IngredientMasterEntity> etcUnits = [
    _createUnit('꼬집', '꼬집', _etcSubCategory),
    _createUnit('한 줌', '한 줌', _etcSubCategory),
    _createUnit('적당량', '적당량', _etcSubCategory),
    _createUnit('조금', '조금', _etcSubCategory),
    _createUnit('약간', '약간', _etcSubCategory),
  ];

  /// 모든 프리셋 단위 목록
  static List<IngredientMasterEntity> get allPresetUnits {
    return [
      ...weightUnits,
      ...volumeUnits,
      ...countUnits,
      ...etcUnits,
    ];
  }

  /// 카테고리별 프리셋 단위 맵
  static Map<String, List<IngredientMasterEntity>> get unitsByCategory {
    return {
      _weightSubCategory: weightUnits,
      _volumeSubCategory: volumeUnits,
      _countSubCategory: countUnits,
      _etcSubCategory: etcUnits,
    };
  }

  /// 프리셋 단위 생성 헬퍼 메서드
  static IngredientMasterEntity _createUnit(String name, String description, String subCategory) {
    return IngredientMasterEntity(
      id: 'preset_unit_${name.toLowerCase().replaceAll(' ', '_')}',
      name: name,
      categoryId: _unitCategoryId,
      subCategory: subCategory,
      description: description,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      usageCount: 1000, // 프리셋 단위는 높은 사용 빈도로 설정
    );
  }

  /// 특정 단위가 프리셋 단위인지 확인
  static bool isPresetUnit(String unitName) {
    return allPresetUnits.any((unit) => unit.name == unitName);
  }

  /// 특정 단위의 프리셋 정보 가져오기
  static IngredientMasterEntity? getPresetUnit(String unitName) {
    try {
      return allPresetUnits.firstWhere((unit) => unit.name == unitName);
    } catch (e) {
      return null;
    }
  }
}