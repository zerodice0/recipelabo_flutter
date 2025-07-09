import 'package:flutter/material.dart';
import 'package:recipick_flutter/core/config/app_colors.dart';

/// 개별 재료 칩 위젯 - 최적화를 위해 분리
class IngredientChipWidget extends StatelessWidget {
  final String ingredientName;
  final bool isSelected;

  const IngredientChipWidget({
    super.key,
    required this.ingredientName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        // 픽셀 아트 스타일 적용
        color: isSelected
            ? AppColors.chipSelectedBackground
            : AppColors.chipBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? AppColors.chipSelectedBorder
              : AppColors.chipBorder,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: isSelected
                ? AppColors.chipSelectedShadow.withValues(alpha: 0.6)
                : AppColors.chipShadow.withValues(alpha: 0.4),
            offset: const Offset(2, 2),
            blurRadius: 0, // 픽셀 아트는 블러 없음
          ),
        ],
      ),
      child: Text(
        ingredientName,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: isSelected ? AppColors.chipSelectedText : AppColors.chipText,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
          fontFamily: 'monospace', // 픽셀 아트 폰트
          fontSize: 12,
        ),
      ),
    );
  }
}
