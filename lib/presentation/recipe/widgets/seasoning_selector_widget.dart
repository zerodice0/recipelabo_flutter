import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipick_flutter/domain/entities/ingredient_master_entity.dart';
import 'package:recipick_flutter/domain/entities/ingredient_entity.dart';
import 'package:recipick_flutter/domain/entities/category_entity.dart';
import 'package:recipick_flutter/domain/usecases/create_ingredient_master_usecase.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';
import 'package:recipick_flutter/presentation/recipe/providers/ingredients_provider.dart';
import 'package:recipick_flutter/presentation/recipe/widgets/unit_selector_widget.dart';
import 'package:uuid/uuid.dart';

class IngredientSelectorWidget extends ConsumerStatefulWidget {
  final List<IngredientEntity> selectedIngredients;
  final List<IngredientEntity>? baselineIngredients;
  final Function(List<IngredientEntity>) onIngredientsChanged;
  final String? label;

  const IngredientSelectorWidget({
    super.key,
    required this.selectedIngredients,
    this.baselineIngredients,
    required this.onIngredientsChanged,
    this.label,
  });

  @override
  ConsumerState<IngredientSelectorWidget> createState() =>
      _IngredientSelectorWidgetState();
}

class _IngredientSelectorWidgetState
    extends ConsumerState<IngredientSelectorWidget> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<IngredientMasterEntity> _filteredSeasonings = [];
  bool _showDropdown = false;

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _filterSeasonings(
    String query,
    List<IngredientMasterEntity> availableSeasonings,
  ) {
    setState(() {
      if (query.isEmpty) {
        _filteredSeasonings = availableSeasonings;
      } else {
        _filteredSeasonings = availableSeasonings
            .where(
              (seasoning) =>
                  seasoning.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  void _addIngredient(String ingredientName) {
    final currentIngredients = List<IngredientEntity>.from(
      widget.selectedIngredients,
    );

    // 이미 추가된 재료인지 확인
    if (!currentIngredients.any(
      (ingredient) => ingredient.name == ingredientName,
    )) {
      final newIngredient = IngredientEntity(
        id: const Uuid().v4(),
        name: ingredientName,
        quantity: 1.0,
        unit: '개',
      );
      currentIngredients.add(newIngredient);
      widget.onIngredientsChanged(currentIngredients);
    }
  }

  void _removeIngredient(String ingredientName) {
    final currentIngredients = List<IngredientEntity>.from(
      widget.selectedIngredients,
    );
    currentIngredients.removeWhere(
      (ingredient) => ingredient.name == ingredientName,
    );
    widget.onIngredientsChanged(currentIngredients);
  }

  void _updateIngredient(IngredientEntity updatedIngredient) {
    final currentIngredients = List<IngredientEntity>.from(
      widget.selectedIngredients,
    );
    final index = currentIngredients.indexWhere(
      (ingredient) => ingredient.id == updatedIngredient.id,
    );
    if (index >= 0) {
      currentIngredients[index] = updatedIngredient;
      widget.onIngredientsChanged(currentIngredients);
    }
  }

  double? _parseQuantity(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;
    final directValue = double.tryParse(trimmed);
    if (directValue != null) return directValue;

    final mixedFraction = RegExp(r'^(\d+)\s+(\d+)\/(\d+)$').firstMatch(trimmed);
    if (mixedFraction != null) {
      final whole = double.parse(mixedFraction.group(1)!);
      final numerator = double.parse(mixedFraction.group(2)!);
      final denominator = double.parse(mixedFraction.group(3)!);
      if (denominator == 0) return null;
      return whole + (numerator / denominator);
    }

    final fraction = RegExp(r'^(\d+)\/(\d+)$').firstMatch(trimmed);
    if (fraction != null) {
      final numerator = double.parse(fraction.group(1)!);
      final denominator = double.parse(fraction.group(2)!);
      if (denominator == 0) return null;
      return numerator / denominator;
    }

    return switch (trimmed) {
      '반' => 0.5,
      '한꼬집' || '한 꼬집' || '꼬집' => 1,
      '조금' || '약간' => 1,
      _ => null,
    };
  }

  void _adjustIngredientQuantity(IngredientEntity ingredient, double delta) {
    final nextQuantity = ingredient.quantity + delta;
    if (nextQuantity < 0) return;
    _updateIngredient(ingredient.copyWith(quantity: nextQuantity));
  }

  void _scaleAllQuantities(double scale) {
    final currentIngredients = widget.selectedIngredients
        .map(
          (ingredient) => ingredient.copyWith(
            quantity: double.parse(
              (ingredient.quantity * scale).toStringAsFixed(2),
            ),
          ),
        )
        .toList();
    widget.onIngredientsChanged(currentIngredients);
  }

  IngredientEntity? _findBaselineIngredient(IngredientEntity ingredient) {
    final baselineIngredients = widget.baselineIngredients;
    if (baselineIngredients == null) return null;

    for (final baseline in baselineIngredients) {
      if (baseline.name.trim().toLowerCase() ==
          ingredient.name.trim().toLowerCase()) {
        return baseline;
      }
    }
    return null;
  }

  String? _buildDeltaText(IngredientEntity ingredient) {
    final baseline = _findBaselineIngredient(ingredient);
    if (baseline == null) return null;

    final quantityChanged = baseline.quantity != ingredient.quantity;
    final unitChanged = baseline.unit != ingredient.unit;
    if (!quantityChanged && !unitChanged) return '이전과 동일';

    if (unitChanged) {
      return '이전 ${_formatCompactQuantity(baseline.quantity)} ${baseline.unit}';
    }

    final delta = ingredient.quantity - baseline.quantity;
    final sign = delta > 0 ? '+' : '';
    return '$sign${_formatCompactQuantity(delta)} ${ingredient.unit}';
  }

  String _formatCompactQuantity(double quantity) {
    if (quantity == quantity.roundToDouble()) {
      return quantity.toInt().toString();
    }
    return quantity.toStringAsFixed(2).replaceFirst(RegExp(r'\.?0+$'), '');
  }

  Future<void> _createNewIngredient(String name) async {
    try {
      final createUseCase = ref.read(createIngredientMasterUseCaseProvider);
      await createUseCase(
        name: name,
        categoryId: PredefinedCategories.ingredient.id,
        description: AppLocalizations.of(context).ingredientUserAdded,
      );

      // 재료 목록 새로고침 - Provider를 통해
      ref.read(availableIngredientsProvider.notifier).refresh();

      // 새로 생성된 재료를 선택된 목록에 추가
      _addIngredient(name);

      // 검색창 초기화
      _searchController.clear();
      setState(() => _showDropdown = false);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context).ingredientNewAdded(name),
            ),
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableIngredientsAsync = ref.watch(availableIngredientsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
        ],

        // 선택된 재료들 표시 (양과 단위 포함)
        if (widget.selectedIngredients.isNotEmpty) ...[
          _buildScaleControls(),
          const SizedBox(height: 12),
          for (final ingredient in widget.selectedIngredients)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(
                  context,
                ).colorScheme.primaryContainer.withValues(alpha: 0.3),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 재료명
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ingredient.name,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        if (_buildDeltaText(ingredient) != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            _buildDeltaText(ingredient)!,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 양 입력
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () =>
                                  _adjustIngredientQuantity(ingredient, -0.5),
                              visualDensity: VisualDensity.compact,
                            ),
                            Expanded(
                              child: TextFormField(
                                key: ValueKey(
                                  '${ingredient.id}-${ingredient.quantity}',
                                ),
                                initialValue: ingredient.quantity.toString(),
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(
                                    context,
                                  ).ingredientQuantityLabel,
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  final quantity = _parseQuantity(value);
                                  if (quantity == null) return;
                                  _updateIngredient(
                                    ingredient.copyWith(quantity: quantity),
                                  );
                                },
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () =>
                                  _adjustIngredientQuantity(ingredient, 0.5),
                              visualDensity: VisualDensity.compact,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 4,
                          children: [
                            _buildQuickQuantityChip(ingredient, '1/4', 0.25),
                            _buildQuickQuantityChip(ingredient, '1/2', 0.5),
                            _buildQuickQuantityChip(ingredient, '1', 1),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 단위 선택
                  Expanded(
                    child: UnitSelectorWidget(
                      selectedUnit: ingredient.unit,
                      onUnitChanged: (value) {
                        _updateIngredient(ingredient.copyWith(unit: value));
                      },
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(
                          context,
                        ).ingredientUnitLabel,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 삭제 버튼
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => _removeIngredient(ingredient.name),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
            ),
          const SizedBox(height: 12),
        ],

        // 재료 검색 및 추가
        Column(
          children: [
            TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(
                  context,
                ).ingredientSearchOrAddHint,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          availableIngredientsAsync.whenData((
                            availableSeasonings,
                          ) {
                            _filterSeasonings('', availableSeasonings);
                          });
                          setState(() => _showDropdown = false);
                        },
                      )
                    : null,
                border: const OutlineInputBorder(),
              ),
              onChanged: (query) {
                availableIngredientsAsync.whenData((availableSeasonings) {
                  _filterSeasonings(query, availableSeasonings);
                });
                setState(() => _showDropdown = query.isNotEmpty);
              },
              onTap: () {
                if (_searchController.text.isNotEmpty) {
                  setState(() => _showDropdown = true);
                }
              },
            ),

            // 검색 결과 드롭다운
            if (_showDropdown) ...[
              const SizedBox(height: 4),
              Container(
                constraints: const BoxConstraints(maxHeight: 200),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: availableIngredientsAsync.when(
                  data: (availableSeasonings) => ListView(
                    shrinkWrap: true,
                    children: [
                      // 검색된 기존 재료들
                      ..._filteredSeasonings.map((seasoning) {
                        final isSelected = widget.selectedIngredients.any(
                          (ingredient) => ingredient.name == seasoning.name,
                        );
                        return ListTile(
                          dense: true,
                          leading: Icon(
                            isSelected
                                ? Icons.check_circle
                                : Icons.add_circle_outline,
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                          ),
                          title: Text(seasoning.name),
                          subtitle: Text(
                            seasoning.predefinedCategory?.displayName ??
                                seasoning.categoryId,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          // trailing: Text(
                          //   '${seasoning.usageCount}회',
                          //   style: Theme.of(context).textTheme.bodySmall
                          //       ?.copyWith(
                          //         color: Theme.of(
                          //           context,
                          //         ).colorScheme.onSurfaceVariant,
                          //       ),
                          // ),
                          onTap: () {
                            if (!isSelected) {
                              _addIngredient(seasoning.name);
                            }
                            _searchController.clear();
                            _filterSeasonings('', availableSeasonings);
                            setState(() => _showDropdown = false);
                          },
                        );
                      }),

                      // 새 재료 생성 옵션
                      if (_searchController.text.trim().isNotEmpty &&
                          !_filteredSeasonings.any(
                            (s) =>
                                s.name.toLowerCase() ==
                                _searchController.text.trim().toLowerCase(),
                          )) ...[
                        const Divider(),
                        ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text(
                            AppLocalizations.of(
                              context,
                            ).ingredientAddNew(_searchController.text),
                          ),
                          subtitle: Text(
                            AppLocalizations.of(
                              context,
                            ).ingredientAddNewSubtitle,
                          ),
                          onTap: () => _createNewIngredient(
                            _searchController.text.trim(),
                          ),
                        ),
                      ],

                      // 검색 결과가 없을 때
                      if (_filteredSeasonings.isEmpty &&
                          _searchController.text.trim().isEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            AppLocalizations.of(
                              context,
                            ).ingredientSearchPlaceholder,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ],
                  ),
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  error: (error, stack) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            AppLocalizations.of(context).ingredientLoadingError,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(availableIngredientsProvider.notifier)
                                  .refresh();
                            },
                            child: Text(
                              AppLocalizations.of(context).actionRetry,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildScaleControls() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text('전체 수량 배율', style: Theme.of(context).textTheme.bodyMedium),
          OutlinedButton(
            onPressed: () => _scaleAllQuantities(0.5),
            child: const Text('0.5배'),
          ),
          OutlinedButton(
            onPressed: () => _scaleAllQuantities(1.5),
            child: const Text('1.5배'),
          ),
          OutlinedButton(
            onPressed: () => _scaleAllQuantities(2),
            child: const Text('2배'),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickQuantityChip(
    IngredientEntity ingredient,
    String label,
    double quantity,
  ) {
    return ActionChip(
      label: Text(label),
      visualDensity: VisualDensity.compact,
      onPressed: () =>
          _updateIngredient(ingredient.copyWith(quantity: quantity)),
    );
  }
}
