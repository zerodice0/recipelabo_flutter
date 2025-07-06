import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipick_flutter/domain/usecases/get_recipe_version_usecase.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';
import 'package:recipick_flutter/presentation/search/widgets/ingredient_chip_widget.dart';

class RecipeIngredientsWidget extends ConsumerStatefulWidget {
  final String recipeId;
  final String latestVersionId;
  final List<String> selectedIngredients;

  const RecipeIngredientsWidget({
    super.key,
    required this.recipeId,
    required this.latestVersionId,
    required this.selectedIngredients,
  });

  @override
  ConsumerState<RecipeIngredientsWidget> createState() =>
      _RecipeIngredientsWidgetState();
}

class _RecipeIngredientsWidgetState
    extends ConsumerState<RecipeIngredientsWidget> {
  String? _cachedVersionId;
  List<String>? _cachedIngredientNames;
  List<String>? _cachedSelectedIngredients;

  @override
  Widget build(BuildContext context) {
    // selectedIngredients가 변경된 경우에만 재렌더링
    final needsUpdate =
        _cachedSelectedIngredients == null ||
        !_listEquals(_cachedSelectedIngredients!, widget.selectedIngredients);

    if (needsUpdate) {
      _cachedSelectedIngredients = List.from(widget.selectedIngredients);
    }

    // 버전 ID가 변경된 경우에만 FutureBuilder 재실행
    if (_cachedVersionId != widget.latestVersionId) {
      _cachedVersionId = widget.latestVersionId;
      _cachedIngredientNames = null; // 캐시 초기화
    }

    // 캐시된 재료 목록이 있고 선택 상태만 변경된 경우
    if (_cachedIngredientNames != null && !needsUpdate) {
      return _buildIngredientsDisplay(_cachedIngredientNames!);
    }

    return FutureBuilder(
      key: ValueKey(widget.latestVersionId), // 버전 ID가 변경될 때만 FutureBuilder 재생성
      future: ref.read(getRecipeVersionUseCaseProvider)(widget.latestVersionId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: SizedBox(height: 20, child: LinearProgressIndicator()),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
          return const SizedBox.shrink();
        }

        final recipeVersion = snapshot.data!;
        final ingredientNames = recipeVersion.ingredients
            .map((ingredient) => ingredient.name)
            .toList();

        // 재료 목록 캐싱
        _cachedIngredientNames = ingredientNames;

        if (ingredientNames.isEmpty) {
          return const SizedBox.shrink();
        }

        return _buildIngredientsDisplay(ingredientNames);
      },
    );
  }

  Widget _buildIngredientsDisplay(List<String> ingredientNames) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).recipeIngredients,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: ingredientNames.map((ingredientName) {
              return IngredientChipWidget(
                key: ValueKey('$ingredientName-${widget.recipeId}'),
                ingredientName: ingredientName,
                isSelected: widget.selectedIngredients.contains(ingredientName),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  bool _listEquals<T>(List<T> list1, List<T> list2) {
    if (list1.length != list2.length) return false;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }
    return true;
  }
}
