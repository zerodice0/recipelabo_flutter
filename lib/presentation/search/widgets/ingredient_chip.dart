import 'package:flutter/material.dart';

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
    if (isSelected && showRemoveButton) {
      return Chip(
        label: Text(
          ingredient,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        deleteIcon: Icon(
          Icons.close,
          size: 18,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onDeleted: onRemove,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
    }

    return FilterChip(
      label: Text(
        ingredient,
        style: TextStyle(
          color:
              isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onSelected: (_) => onTap(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      selectedColor: Theme.of(context).colorScheme.primary,
      checkmarkColor: Theme.of(context).colorScheme.onPrimary,
      side: BorderSide(
        color:
            isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
        width: 1,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
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
              '선택된 재료 (${selectedIngredients.length}개)',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            if (onClearAll != null)
              TextButton(
                onPressed: onClearAll,
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
                child: const Text('전체 삭제'),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children:
              selectedIngredients.map((ingredient) {
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
              Icon(
                Icons.search_off,
                size: 48,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 16),
              Text(
                '재료를 찾을 수 없습니다',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
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
      children:
          ingredients.map((ingredient) {
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
