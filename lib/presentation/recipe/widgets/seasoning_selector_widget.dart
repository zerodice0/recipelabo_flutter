import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saucerer_flutter/domain/entities/seasoning_entity.dart';
import 'package:saucerer_flutter/domain/entities/ingredient_entity.dart';
import 'package:saucerer_flutter/domain/entities/category_entity.dart';
import 'package:saucerer_flutter/domain/usecases/create_seasoning_usecase.dart';
import 'package:saucerer_flutter/presentation/recipe/providers/ingredients_provider.dart';
import 'package:saucerer_flutter/presentation/recipe/widgets/unit_selector_widget.dart';
import 'package:uuid/uuid.dart';

class IngredientSelectorWidget extends ConsumerStatefulWidget {
  final List<IngredientEntity> selectedIngredients;
  final Function(List<IngredientEntity>) onIngredientsChanged;
  final String? label;

  const IngredientSelectorWidget({
    super.key,
    required this.selectedIngredients,
    required this.onIngredientsChanged,
    this.label,
  });

  @override
  ConsumerState<IngredientSelectorWidget> createState() => _IngredientSelectorWidgetState();
}

class _IngredientSelectorWidgetState extends ConsumerState<IngredientSelectorWidget> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<SeasoningEntity> _filteredSeasonings = [];
  bool _showDropdown = false;

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _filterSeasonings(String query, List<SeasoningEntity> availableSeasonings) {
    setState(() {
      if (query.isEmpty) {
        _filteredSeasonings = availableSeasonings;
      } else {
        _filteredSeasonings = availableSeasonings
            .where((seasoning) => 
                seasoning.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _addIngredient(String ingredientName) {
    final currentIngredients = List<IngredientEntity>.from(widget.selectedIngredients);
    
    // 이미 추가된 재료인지 확인
    if (!currentIngredients.any((ingredient) => ingredient.name == ingredientName)) {
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
    final currentIngredients = List<IngredientEntity>.from(widget.selectedIngredients);
    currentIngredients.removeWhere((ingredient) => ingredient.name == ingredientName);
    widget.onIngredientsChanged(currentIngredients);
  }

  void _updateIngredient(IngredientEntity updatedIngredient) {
    final currentIngredients = List<IngredientEntity>.from(widget.selectedIngredients);
    final index = currentIngredients.indexWhere((ingredient) => ingredient.id == updatedIngredient.id);
    if (index >= 0) {
      currentIngredients[index] = updatedIngredient;
      widget.onIngredientsChanged(currentIngredients);
    }
  }

  Future<void> _createNewIngredient(String name) async {
    try {
      final createUseCase = ref.read(createSeasoningUseCaseProvider);
      await createUseCase(
        name: name,
        categoryId: PredefinedCategories.ingredient.id,
        description: '사용자 추가 재료',
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
          SnackBar(content: Text('새 재료 "$name"이(가) 추가되었습니다')),
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
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
        
        // 선택된 재료들 표시 (양과 단위 포함)
        if (widget.selectedIngredients.isNotEmpty) ...[
          for (final ingredient in widget.selectedIngredients)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
              ),
              child: Row(
                children: [
                  // 재료명
                  Expanded(
                    flex: 2,
                    child: Text(
                      ingredient.name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 양 입력
                  Expanded(
                    child: TextFormField(
                      initialValue: ingredient.quantity.toString(),
                      decoration: const InputDecoration(
                        labelText: '양',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        final quantity = double.tryParse(value) ?? ingredient.quantity;
                        _updateIngredient(ingredient.copyWith(quantity: quantity));
                      },
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
                      decoration: const InputDecoration(
                        labelText: '단위',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                hintText: '재료를 검색하거나 새로 추가하세요...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          availableIngredientsAsync.whenData((availableSeasonings) {
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
                  border: Border.all(color: Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: availableIngredientsAsync.when(
                  data: (availableSeasonings) => ListView(
                        shrinkWrap: true,
                        children: [
                          // 검색된 기존 재료들
                          ..._filteredSeasonings.map((seasoning) {
                            final isSelected = widget.selectedIngredients.any((ingredient) => ingredient.name == seasoning.name);
                            return ListTile(
                              dense: true,
                              leading: Icon(
                                isSelected ? Icons.check_circle : Icons.add_circle_outline,
                                color: isSelected 
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                              title: Text(seasoning.name),
                              subtitle: Text(
                                seasoning.predefinedCategory?.displayName ?? seasoning.categoryId,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              trailing: Text(
                                '${seasoning.usageCount}회',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                              ),
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
                              !_filteredSeasonings.any((s) => 
                                  s.name.toLowerCase() == _searchController.text.trim().toLowerCase())) ...[
                            const Divider(),
                            ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.add,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              title: Text('새 재료 추가: "${_searchController.text.trim()}"'),
                              subtitle: const Text('새로운 재료를 추가합니다'),
                              onTap: () => _createNewIngredient(_searchController.text.trim()),
                            ),
                          ],
                          
                          // 검색 결과가 없을 때
                          if (_filteredSeasonings.isEmpty && _searchController.text.trim().isEmpty) ...[
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                '재료를 입력하여 검색하세요',
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
                            '재료를 불러오는 중 오류가 발생했습니다',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              ref.read(availableIngredientsProvider.notifier).refresh();
                            },
                            child: const Text('다시 시도'),
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
}