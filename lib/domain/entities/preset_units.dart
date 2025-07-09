import 'package:flutter/material.dart';
import 'package:recipick_flutter/domain/entities/ingredient_master_entity.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';

/// 자주 사용하는 단위들의 프리셋 정의 - 중립적 ID 기반
class PresetUnits {
  static const String _unitCategoryId = 'unit';

  /// 중립적 프리셋 단위 ID 목록
  static const List<String> _neutralUnitIds = [
    // 무게 단위
    'unit_gram',
    'unit_kilogram',
    'unit_milligram',

    // 부피 단위
    'unit_milliliter',
    'unit_liter',
    'unit_tablespoon',
    'unit_teaspoon',
    'unit_cup',
    'unit_drops',

    // 개수 단위
    'unit_pieces',
    'unit_slices',
    'unit_cloves',
    'unit_balls',
    'unit_containers',
    'unit_bunches',
    'unit_stalks',
    'unit_sheets',

    // 기타 단위
    'unit_pinch',
    'unit_handful',
    'unit_moderate',
    'unit_little',
    'unit_slightly',
  ];

  /// 중립적 ID에서 카테고리 매핑
  static const Map<String, String> _unitCategoryMap = {
    // 무게 단위
    'unit_gram': 'Weight',
    'unit_kilogram': 'Weight',
    'unit_milligram': 'Weight',

    // 부피 단위
    'unit_milliliter': 'Volume',
    'unit_liter': 'Volume',
    'unit_tablespoon': 'Volume',
    'unit_teaspoon': 'Volume',
    'unit_cup': 'Volume',
    'unit_drops': 'Volume',

    // 개수 단위
    'unit_pieces': 'Count',
    'unit_slices': 'Count',
    'unit_cloves': 'Count',
    'unit_balls': 'Count',
    'unit_containers': 'Count',
    'unit_bunches': 'Count',
    'unit_stalks': 'Count',
    'unit_sheets': 'Count',

    // 기타 단위
    'unit_pinch': 'Misc',
    'unit_handful': 'Misc',
    'unit_moderate': 'Misc',
    'unit_little': 'Misc',
    'unit_slightly': 'Misc',
  };

  /// 중립적 ID 목록 getter
  static List<String> get neutralUnitIds => _neutralUnitIds;

  /// 중립적 ID에서 카테고리 가져오기
  static String? getCategoryForUnitId(String unitId) {
    return _unitCategoryMap[unitId];
  }

  /// 무게 단위 ID 목록
  static List<String> get weightUnitIds =>
      _neutralUnitIds.where((id) => _unitCategoryMap[id] == 'Weight').toList();

  /// 부피 단위 ID 목록
  static List<String> get volumeUnitIds =>
      _neutralUnitIds.where((id) => _unitCategoryMap[id] == 'Volume').toList();

  /// 개수 단위 ID 목록
  static List<String> get countUnitIds =>
      _neutralUnitIds.where((id) => _unitCategoryMap[id] == 'Count').toList();

  /// 기타 단위 ID 목록
  static List<String> get miscUnitIds =>
      _neutralUnitIds.where((id) => _unitCategoryMap[id] == 'Misc').toList();

  /// 런타임에 중립적 ID를 현재 언어로 번역하여 Entity 생성
  static IngredientMasterEntity createLocalizedUnit(
    BuildContext context,
    String unitId,
  ) {
    final l10n = AppLocalizations.of(context);
    final category = _unitCategoryMap[unitId];

    return IngredientMasterEntity(
      id: 'preset_$unitId',
      name: unitId, // 데이터베이스에는 중립적 ID 저장
      categoryId: _unitCategoryId,
      subCategory: category,
      description: _getLocalizedDescription(l10n, unitId),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      usageCount: 0, // 프리셋 단위는 사용 빈도 0으로 설정
    );
  }

  /// 중립적 ID를 현재 언어 설명으로 변환
  static String _getLocalizedDescription(AppLocalizations l10n, String unitId) {
    switch (unitId) {
      // 무게 단위
      case 'unit_gram':
        return l10n.unitWeightGramsDesc;
      case 'unit_kilogram':
        return l10n.unitWeightKilogramsDesc;
      case 'unit_milligram':
        return l10n.unitWeightMilligramsDesc;

      // 부피 단위
      case 'unit_milliliter':
        return l10n.unitVolumeMillilitersDesc;
      case 'unit_liter':
        return l10n.unitVolumeLitersDesc;
      case 'unit_tablespoon':
        return l10n.unitVolumeTablespoonDesc;
      case 'unit_teaspoon':
        return l10n.unitVolumeTeaspoonDesc;
      case 'unit_cup':
        return l10n.unitVolumeCupDesc;
      case 'unit_drops':
        return l10n.unitVolumeDropsDesc;

      // 개수 단위
      case 'unit_pieces':
        return l10n.unitCountPiecesDesc;
      case 'unit_slices':
        return l10n.unitCountSlicesDesc;
      case 'unit_cloves':
        return l10n.unitCountClovesDesc;
      case 'unit_balls':
        return l10n.unitCountBallsDesc;
      case 'unit_containers':
        return l10n.unitCountContainersDesc;
      case 'unit_bunches':
        return l10n.unitCountBunchesDesc;
      case 'unit_stalks':
        return l10n.unitCountStalksDesc;
      case 'unit_sheets':
        return l10n.unitCountSheetsDesc;

      // 기타 단위
      case 'unit_pinch':
        return l10n.unitMiscPinchDesc;
      case 'unit_handful':
        return l10n.unitMiscHandfulDesc;
      case 'unit_moderate':
        return l10n.unitMiscModerateDesc;
      case 'unit_little':
        return l10n.unitMiscLittleDesc;
      case 'unit_slightly':
        return l10n.unitMiscSlightlyDesc;

      default:
        return unitId;
    }
  }

  /// 모든 프리셋 단위 목록 - 런타임 번역
  static List<IngredientMasterEntity> getAllPresetUnits(BuildContext context) {
    return _neutralUnitIds
        .map((unitId) => createLocalizedUnit(context, unitId))
        .toList();
  }

  /// 카테고리별 프리셋 단위 맵 - 런타임 번역
  static Map<String, List<IngredientMasterEntity>> getUnitsByCategory(
    BuildContext context,
  ) {
    final l10n = AppLocalizations.of(context);
    return {
      l10n.unitCategoryWeight: weightUnitIds
          .map((id) => createLocalizedUnit(context, id))
          .toList(),
      l10n.unitCategoryVolume: volumeUnitIds
          .map((id) => createLocalizedUnit(context, id))
          .toList(),
      l10n.unitCategoryCount: countUnitIds
          .map((id) => createLocalizedUnit(context, id))
          .toList(),
      l10n.unitCategoryMisc: miscUnitIds
          .map((id) => createLocalizedUnit(context, id))
          .toList(),
    };
  }

  /// 특정 단위가 프리셋 단위인지 확인 - 중립적 ID 기반
  static bool isPresetUnit(String unitName) {
    bool isPresetUnit = false;

    if (_neutralUnitIds.contains(unitName)) {
      isPresetUnit = true;
    }

    return isPresetUnit;
  }

  /// 특정 단위의 프리셋 정보 가져오기 - 중립적 ID 기반
  static IngredientMasterEntity? getPresetUnit(
    BuildContext context,
    String unitName,
  ) {
    try {
      // 중립적 ID로 먼저 찾기
      if (_neutralUnitIds.contains(unitName)) {
        return createLocalizedUnit(context, unitName);
      }
    } catch (e) {
      return null;
    }
  }
}
