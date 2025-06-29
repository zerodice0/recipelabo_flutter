import 'package:flutter/material.dart';
import 'package:saucerer_flutter/core/config/app_colors.dart';

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

  final List<Map<String, dynamic>> _categories = [
    {
      'id': '무게',
      'name': '무게',
      'description': 'g, kg, 그램, 킬로그램 등',
      'icon': Icons.monitor_weight,
      'examples': ['g', 'kg', '그램', '킬로그램'],
    },
    {
      'id': '부피',
      'name': '부피',
      'description': 'mL, L, 컵, 큰술, 작은술 등',
      'icon': Icons.local_drink,
      'examples': ['mL', 'L', '컵', '큰술', '작은술'],
    },
    {
      'id': '개수',
      'name': '개수',
      'description': '개, 마리, 알, 쪽, 장 등',
      'icon': Icons.numbers,
      'examples': ['개', '마리', '알', '쪽', '장'],
    },
    {
      'id': '기타',
      'name': '기타',
      'description': '꼬집, 조금, 적당량 등',
      'icon': Icons.more_horiz,
      'examples': ['꼬집', '조금', '적당량'],
    },
  ];

  @override
  void initState() {
    super.initState();
    // 단위명을 보고 자동으로 카테고리 추천
    _selectedCategory = _suggestCategory(widget.unitName);
  }

  String _suggestCategory(String unitName) {
    final name = unitName.toLowerCase();
    
    if (['g', 'kg', '그램', '킬로그램', 'gram', 'kilogram'].any((w) => name.contains(w))) {
      return '무게';
    } else if (['ml', 'l', '밀리리터', '리터', '컵', '큰술', '작은술', 't', 'cup', 'liter'].any((w) => name.contains(w))) {
      return '부피';
    } else if (['개', '마리', '알', '쪽', '장', '봉지', '캔', '병', '조각'].any((w) => name.contains(w))) {
      return '개수';
    } else {
      return '기타';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.category,
                color: AppColors.primaryOrange,
                size: 28,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  '단위 카테고리 선택',
                  style: TextStyle(
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
              '"${widget.unitName}" 단위가 어떤 종류인지 선택해주세요.',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textBrown,
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final category in _categories)
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
                          .map((example) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.textBrown.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  example,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: AppColors.textBrown,
                                  ),
                                ),
                              ))
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
            '취소',
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
          child: const Text('추가'),
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