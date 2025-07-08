import 'package:flutter/material.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';
import 'package:recipick_flutter/core/config/app_colors.dart';

class IngredientChip extends StatelessWidget {
  final String ingredient;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback? onRemove;
  final bool showRemoveButton;

  const IngredientChip({
    super.key,
    required this.ingredient,
    required this.isSelected,
    required this.onTap,
    this.onRemove,
    this.showRemoveButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          // 오렌지 계통으로 통일된 픽셀 아트 스타일
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 재료 이름
            Text(
              ingredient,
              style: TextStyle(
                color: isSelected
                    ? AppColors.chipSelectedText
                    : AppColors.chipText,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                fontFamily: 'monospace', // 픽셀 아트 폰트
                fontSize: 12,
              ),
            ),
            // 삭제 버튼 (선택되고 showRemoveButton이 true일 때만)
            if (isSelected && showRemoveButton && onRemove != null) ...[
              const SizedBox(width: 4),
              GestureDetector(
                onTap: onRemove,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  child: const Icon(
                    Icons.close,
                    size: 14,
                    color: AppColors.chipSelectedText,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class SelectedIngredientsChips extends StatelessWidget {
  final List<String> selectedIngredients;
  final Function(String) onRemove;
  final VoidCallback? onClearAll;

  const SelectedIngredientsChips({
    super.key,
    required this.selectedIngredients,
    required this.onRemove,
    this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedIngredients.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(
                context,
              ).ingredientSelectedCount(selectedIngredients.length.toString()),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.chipText,
                fontFamily: 'monospace', // 픽셀 아트 폰트
              ),
            ),
            if (onClearAll != null)
              Container(
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.primaryDark, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.deepBrown.withValues(alpha: 0.6),
                      offset: const Offset(2, 2),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: onClearAll,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: AppColors.warmWhite,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    AppLocalizations.of(context).ingredientClearAll,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: selectedIngredients.map((ingredient) {
            return IngredientChip(
              ingredient: ingredient,
              isSelected: true,
              showRemoveButton: true,
              onTap: () {},
              onRemove: () => onRemove(ingredient),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class AvailableIngredientsGrid extends StatelessWidget {
  final List<String> ingredients;
  final List<String> selectedIngredients;
  final Function(String) onIngredientTap;
  final bool isLoading;

  const AvailableIngredientsGrid({
    super.key,
    required this.ingredients,
    required this.selectedIngredients,
    required this.onIngredientTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (ingredients.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.chipBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.chipBorder, width: 2),
                ),
                child: Stack(
                  children: [
                    const Text('🔍', style: TextStyle(fontSize: 52)),
                    Opacity(
                      opacity: 0.5,
                      child: const Text('❌', style: TextStyle(fontSize: 62)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context).ingredientNotFound,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textBrown,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: ingredients.map((ingredient) {
        final isSelected = selectedIngredients.contains(ingredient);
        return IngredientChip(
          ingredient: ingredient,
          isSelected: isSelected,
          onTap: () => onIngredientTap(ingredient),
        );
      }).toList(),
    );
  }
}
