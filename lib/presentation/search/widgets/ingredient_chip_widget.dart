import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? null
            : Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              ),
      ),
      child: Text(
        ingredientName,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}
