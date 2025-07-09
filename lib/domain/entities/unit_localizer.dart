import 'package:flutter/material.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';

/// 언어 중립적 ID를 현재 언어로 번역하는 유틸리티 클래스
class UnitLocalizer {
  /// 언어 중립적 단위 ID를 현재 언어의 단위명으로 번역
  static String getLocalizedUnitName(String unitId, BuildContext context) {
    final l10n = AppLocalizations.of(context);

    switch (unitId) {
      // 무게 단위
      case 'unit_gram':
        return l10n.unitWeightGrams;
      case 'unit_kilogram':
        return l10n.unitWeightKilograms;
      case 'unit_milligram':
        return l10n.unitWeightMilligrams;

      // 부피 단위
      case 'unit_milliliter':
        return l10n.unitVolumeMilliliters;
      case 'unit_liter':
        return l10n.unitVolumeLiters;
      case 'unit_tablespoon':
        return l10n.unitVolumeTablespoon;
      case 'unit_teaspoon':
        return l10n.unitVolumeTeaspoon;
      case 'unit_cup':
        return l10n.unitVolumeCup;
      case 'unit_drops':
        return l10n.unitVolumeDrops;

      // 개수 단위
      case 'unit_pieces':
        return l10n.unitCountPieces;
      case 'unit_slices':
        return l10n.unitCountSlices;
      case 'unit_cloves':
        return l10n.unitCountCloves;
      case 'unit_balls':
        return l10n.unitCountBalls;
      case 'unit_containers':
        return l10n.unitCountContainers;
      case 'unit_bunches':
        return l10n.unitCountBunches;
      case 'unit_stalks':
        return l10n.unitCountStalks;
      case 'unit_sheets':
        return l10n.unitCountSheets;

      // 기타 단위
      case 'unit_pinch':
        return l10n.unitMiscPinch;
      case 'unit_handful':
        return l10n.unitMiscHandful;
      case 'unit_moderate':
        return l10n.unitMiscModerate;
      case 'unit_little':
        return l10n.unitMiscLittle;
      case 'unit_slightly':
        return l10n.unitMiscSlightly;

      // 프리셋 단위가 아닌 경우 (커스텀 단위) 원본 그대로 반환
      default:
        return unitId;
    }
  }

  /// 언어 중립적 단위 ID를 현재 언어의 단위 설명으로 번역
  static String getLocalizedUnitDescription(
    String unitId,
    BuildContext context,
  ) {
    final l10n = AppLocalizations.of(context);

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

      // 프리셋 단위가 아닌 경우 (커스텀 단위) 원본 그대로 반환
      default:
        return unitId;
    }
  }

  /// 언어 중립적 단위 ID를 현재 언어의 카테고리명으로 번역
  static String getLocalizedCategoryName(
    String categoryKey,
    BuildContext context,
  ) {
    final l10n = AppLocalizations.of(context);

    switch (categoryKey) {
      case 'Weight':
        return l10n.unitCategoryWeight;
      case 'Volume':
        return l10n.unitCategoryVolume;
      case 'Count':
        return l10n.unitCategoryCount;
      case 'Misc':
        return l10n.unitCategoryMisc;
      default:
        return categoryKey;
    }
  }

  /// 특정 단위 ID가 프리셋 단위인지 확인
  static bool isPresetUnit(String unitId) {
    return unitId.startsWith('unit_');
  }

  /// 모든 프리셋 단위 ID 목록
  static const List<String> presetUnitIds = [
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
}
