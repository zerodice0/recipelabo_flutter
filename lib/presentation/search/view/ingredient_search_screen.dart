import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saucerer_flutter/presentation/search/viewmodel/ingredient_search_viewmodel.dart';
import 'package:saucerer_flutter/presentation/search/widgets/ingredient_chip.dart';

class IngredientSearchScreen extends ConsumerStatefulWidget {
  final bool showAppBar;

  const IngredientSearchScreen({super.key, this.showAppBar = true});

  @override
  ConsumerState<IngredientSearchScreen> createState() =>
      _IngredientSearchScreenState();
}

class _IngredientSearchScreenState
    extends ConsumerState<IngredientSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(ingredientSearchViewModelProvider);
    final viewModel = ref.read(ingredientSearchViewModelProvider.notifier);

    return SafeArea(
      child: Scaffold(
        appBar:
            widget.showAppBar
                ? AppBar(
                  title: const Text('재료로 검색'),
                  actions: [
                    if (state.selectedIngredients.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.clear_all),
                        onPressed: () => viewModel.resetSearch(),
                        tooltip: '검색 초기화',
                      ),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        switch (value) {
                          case 'show_all':
                            viewModel.loadAllIngredients();
                            break;
                          case 'show_popular':
                            viewModel.resetSearch();
                            break;
                        }
                      },
                      itemBuilder:
                          (context) => [
                            const PopupMenuItem(
                              value: 'show_popular',
                              child: Text('자주 사용된 재료 보기'),
                            ),
                            const PopupMenuItem(
                              value: 'show_all',
                              child: Text('모든 재료 보기'),
                            ),
                          ],
                    ),
                  ],
                )
                : null,
        body: Column(
          children: [
            _buildSearchBar(viewModel, state),
            Expanded(child: _buildContent(context, state, viewModel)),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(
    IngredientSearchViewModel viewModel,
    IngredientSearchState state,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SearchBar(
        controller: _searchController,
        focusNode: _searchFocusNode,
        hintText: '재료 이름을 검색하세요...',
        leading: const Icon(Icons.search),
        trailing: [
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                viewModel.searchIngredients('');
              },
            ),
        ],
        onChanged: (query) {
          viewModel.searchIngredients(query);
        },
        onSubmitted: (query) {
          _searchFocusNode.unfocus();
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    IngredientSearchState state,
    IngredientSearchViewModel viewModel,
  ) {
    if (state.error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                '오류가 발생했습니다',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                state.error!,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => viewModel.resetSearch(),
                child: const Text('다시 시도'),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 선택된 재료들
          SelectedIngredientsChips(
            selectedIngredients: state.selectedIngredients,
            onRemove: viewModel.removeSelectedIngredient,
            onClearAll:
                state.selectedIngredients.isNotEmpty
                    ? viewModel.clearAllSelectedIngredients
                    : null,
          ),

          if (state.selectedIngredients.isNotEmpty) ...[
            const SizedBox(height: 24),
            _buildRecipeResults(context, state, viewModel),
            const SizedBox(height: 24),
          ],

          // 사용 가능한 재료들
          _buildAvailableIngredients(state, viewModel),
        ],
      ),
    );
  }

  Widget _buildRecipeResults(
    BuildContext context,
    IngredientSearchState state,
    IngredientSearchViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '검색 결과',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            if (state.isSearchingRecipes)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
          ],
        ),
        const SizedBox(height: 12),

        if (state.isSearchingRecipes)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(),
            ),
          )
        else if (state.filteredRecipes.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.restaurant_menu,
                  size: 48,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 8),
                Text(
                  '선택한 재료로 만들 수 있는\n레시피가 없습니다',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        else
          Column(
            children: [
              Text(
                '${state.filteredRecipes.length}개의 레시피를 찾았습니다',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.filteredRecipes.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final recipe = state.filteredRecipes[index];
                  return _buildRecipeCard(context, recipe);
                },
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildRecipeCard(BuildContext context, recipe) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          recipe.name,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle:
            recipe.description != null
                ? Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    recipe.description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
                : null,
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          context.push('/recipes/${recipe.id}');
        },
      ),
    );
  }

  Widget _buildAvailableIngredients(
    IngredientSearchState state,
    IngredientSearchViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          state.searchQuery.isEmpty ? '자주 사용된 재료' : '검색 결과',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        AvailableIngredientsGrid(
          ingredients: state.availableIngredients,
          selectedIngredients: state.selectedIngredients,
          onIngredientTap: viewModel.toggleIngredientSelection,
          isLoading: state.isLoading,
        ),
      ],
    );
  }
}
