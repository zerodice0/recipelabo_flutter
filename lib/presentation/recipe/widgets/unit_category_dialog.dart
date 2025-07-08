import 'package:flutter/material.dart';
import 'package:recipick_flutter/core/config/app_colors.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';

/// 단위 추가 시 세부 카테고리 선택 다이얼로그
class UnitCategoryDialog extends StatefulWidget {
  final String unitName;
  final Function(String subCategory) onCategorySelected;
  final VoidCallback onCancel;

  const UnitCategoryDialog({
    super.key,
    required this.unitName,
    required this.onCategorySelected,
    required this.onCancel,
  });

  @override
  State<UnitCategoryDialog> createState() => _UnitCategoryDialogState();
}

class _UnitCategoryDialogState extends State<UnitCategoryDialog> {
  String? _selectedCategory;

  List<Map<String, dynamic>> _getCategories(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return [
      {
        'id': l10n.unitCategoryWeight,
        'name': l10n.unitCategoryWeight,
        'description': 'g, kg, ${l10n.unitWeightGramsDesc}, ${l10n.unitWeightKilogramsDesc} 등',
        'icon': Icons.monitor_weight,
        'examples': [l10n.unitWeightGrams, l10n.unitWeightKilograms, l10n.unitWeightGramsDesc, l10n.unitWeightKilogramsDesc],
        'legacy_id': '무게', // 하위 호환성용
      },
      {
        'id': l10n.unitCategoryVolume,
        'name': l10n.unitCategoryVolume,
        'description': 'mL, L, ${l10n.unitVolumeCup}, ${l10n.unitVolumeTablespoon}, ${l10n.unitVolumeTeaspoon} 등',
        'icon': Icons.local_drink,
        'examples': [l10n.unitVolumeMilliliters, l10n.unitVolumeLiters, l10n.unitVolumeCup, l10n.unitVolumeTablespoon, l10n.unitVolumeTeaspoon],
        'legacy_id': '부피', // 하위 호환성용
      },
      {
        'id': l10n.unitCategoryCount,
        'name': l10n.unitCategoryCount,
        'description': '${l10n.unitCountPieces}, ${l10n.unitCountSlices}, ${l10n.unitCountCloves}, ${l10n.unitCountSheets} 등',
        'icon': Icons.numbers,
        'examples': [l10n.unitCountPieces, l10n.unitCountSlices, l10n.unitCountCloves, l10n.unitCountSheets],
        'legacy_id': '개수', // 하위 호환성용
      },
      {
        'id': l10n.unitCategoryMisc,
        'name': l10n.unitCategoryMisc,
        'description': '${l10n.unitMiscPinch}, ${l10n.unitMiscLittle}, ${l10n.unitMiscModerate} 등',
        'icon': Icons.more_horiz,
        'examples': [l10n.unitMiscPinch, l10n.unitMiscLittle, l10n.unitMiscModerate],
        'legacy_id': '기타', // 하위 호환성용
      },
    ];
  }

  @override
  void initState() {
    super.initState();
    // 단위명을 보고 자동으로 카테고리 추천 (초기화는 didChangeDependencies에서)
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedCategory ??= _suggestCategory(widget.unitName);
  }

  String _suggestCategory(String unitName) {
    final l10n = AppLocalizations.of(context);
    final name = unitName.toLowerCase();

    if ([
      'g',
      'kg',
      '그램',
      '킬로그램',
      'gram',
      'kilogram',
      'mg',
      '밀리그램',
    ].any((w) => name.contains(w))) {
      return l10n.unitCategoryWeight;
    } else if ([
      'ml',
      'l',
      '밀리리터',
      '리터',
      '컵',
      '큰술',
      '작은술',
      't',
      'cup',
      'liter',
      'tbsp',
      'tsp',
      '방울',
      'drops',
    ].any((w) => name.contains(w))) {
      return l10n.unitCategoryVolume;
    } else if ([
      '개',
      '마리',
      '알',
      '쪽',
      '장',
      '봉지',
      '캔',
      '병',
      '조각',
      'pcs',
      'pieces',
      'slices',
      'cloves',
      'sheets',
      '포기',
      '줄기',
      '통',
    ].any((w) => name.contains(w))) {
      return l10n.unitCategoryCount;
    } else {
      return l10n.unitCategoryMisc;
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = _getCategories(context);
    
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.category, color: AppColors.primaryOrange, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  AppLocalizations.of(context).ingredientSelectUnit,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBrown,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryOrange.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              AppLocalizations.of(context).unitTypeSelection(widget.unitName),
              style: const TextStyle(fontSize: 14, color: AppColors.textBrown),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final category in categories)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _selectedCategory == category['id']
                      ? AppColors.primaryOrange
                      : AppColors.textBrown.withValues(alpha: 0.3),
                  width: _selectedCategory == category['id'] ? 2 : 1,
                ),
                color: _selectedCategory == category['id']
                    ? AppColors.primaryOrange.withValues(alpha: 0.05)
                    : null,
              ),
              child: RadioListTile<String>(
                value: category['id'],
                groupValue: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                title: Row(
                  children: [
                    Icon(
                      category['icon'],
                      color: _selectedCategory == category['id']
                          ? AppColors.primaryOrange
                          : AppColors.textBrown.withValues(alpha: 0.7),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      category['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: _selectedCategory == category['id']
                            ? AppColors.primaryOrange
                            : AppColors.textBrown,
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category['description'],
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 4,
                      children: (category['examples'] as List<String>)
                          .take(3)
                          .map(
                            (example) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.textBrown.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                example,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: AppColors.textBrown,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                activeColor: AppColors.primaryOrange,
                dense: true,
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: widget.onCancel,
          child: Text(
            AppLocalizations.of(context).actionCancel,
            style: TextStyle(color: AppColors.textBrown.withValues(alpha: 0.7)),
          ),
        ),
        ElevatedButton(
          onPressed: _selectedCategory != null
              ? () => widget.onCategorySelected(_selectedCategory!)
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryOrange,
            foregroundColor: AppColors.warmWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(AppLocalizations.of(context).actionSave),
        ),
      ],
    );
  }
}

/// 정적 메서드로 다이얼로그를 쉽게 표시
class UnitCategoryDialogs {
  static Future<String?> show(
    BuildContext context, {
    required String unitName,
  }) {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) => UnitCategoryDialog(
        unitName: unitName,
        onCategorySelected: (subCategory) {
          Navigator.of(context).pop(subCategory);
        },
        onCancel: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
