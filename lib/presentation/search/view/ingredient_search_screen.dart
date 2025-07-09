import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipick_flutter/core/config/app_colors.dart';
import 'package:recipick_flutter/presentation/search/viewmodel/ingredient_search_viewmodel.dart';
import 'package:recipick_flutter/presentation/search/widgets/ingredient_chip.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';
import 'package:recipick_flutter/presentation/search/widgets/recipe_ingredients_widget.dart';

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
        appBar: widget.showAppBar
            ? AppBar(
                title: Text(
                  AppLocalizations.of(context).ingredientSearchByIngredients,
                ),
                actions: [
                  if (state.selectedIngredients.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.clear_all),
                      onPressed: () => viewModel.resetSearch(),
                      tooltip: AppLocalizations.of(context).searchReset,
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
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'show_popular',
                        child: Text(
                          AppLocalizations.of(context).ingredientShowPopular,
                        ),
                      ),
                      PopupMenuItem(
                        value: 'show_all',
                        child: Text(
                          AppLocalizations.of(context).ingredientShowAll,
                        ),
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
        hintText: AppLocalizations.of(context).ingredientSearchHint,
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
                AppLocalizations.of(context).generalErrorOccurred,
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
                child: Text(AppLocalizations.of(context).actionRetry),
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
          // 사용 가능한 재료들
          _buildAvailableIngredients(state, viewModel),
          const SizedBox(height: 24),
          // 선택된 재료들
          SelectedIngredientsChips(
            selectedIngredients: state.selectedIngredients,
            onRemove: viewModel.removeSelectedIngredient,
            onClearAll: state.selectedIngredients.isNotEmpty
                ? viewModel.clearAllSelectedIngredients
                : null,
          ),

          if (state.selectedIngredients.isNotEmpty) ...[
            const SizedBox(height: 24),
            _buildRecipeResults(context, state, viewModel),
            const SizedBox(height: 24),
          ],
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
              AppLocalizations.of(context).searchRecipeResults,
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
                  AppLocalizations.of(context).searchNoResults,
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
                AppLocalizations.of(
                  context,
                ).searchRecipesFound(state.filteredRecipes.length.toString()),
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
    final state = ref.watch(ingredientSearchViewModelProvider);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.getChipBackground(
          Theme.of(context).brightness == Brightness.dark,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.getChipBorder(
            Theme.of(context).brightness == Brightness.dark,
          ),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.getChipShadow(
              Theme.of(context).brightness == Brightness.dark,
            ).withValues(alpha: 0.3),
            offset: const Offset(2, 2),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: Text(
              recipe.name,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: recipe.description != null
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
          RecipeIngredientsWidget(
            recipeId: recipe.id,
            latestVersionId: recipe.latestVersionId,
            selectedIngredients: state.selectedIngredients,
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableIngredients(
    IngredientSearchState state,
    IngredientSearchViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          state.searchQuery.isEmpty
              ? AppLocalizations.of(context).ingredientPopular
              : AppLocalizations.of(context).ingredientSearchResults,
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
