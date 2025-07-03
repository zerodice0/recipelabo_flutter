import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saucerer_flutter/domain/entities/ingredient_master_entity.dart';
import 'package:saucerer_flutter/domain/entities/category_entity.dart';
import 'package:saucerer_flutter/presentation/seasoning/viewmodel/seasoning_management_viewmodel.dart';
import 'package:saucerer_flutter/presentation/seasoning/widgets/seasoning_create_dialog.dart';

class SeasoningManagementScreen extends ConsumerStatefulWidget {
  const SeasoningManagementScreen({super.key});

  @override
  ConsumerState<SeasoningManagementScreen> createState() =>
      _SeasoningManagementScreenState();
}

class _SeasoningManagementScreenState
    extends ConsumerState<SeasoningManagementScreen> {
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
    final state = ref.watch(seasoningManagementViewModelProvider);
    final viewModel = ref.read(seasoningManagementViewModelProvider.notifier);

    // 에러 처리
    ref.listen<SeasoningManagementState>(seasoningManagementViewModelProvider, (
      previous,
      next,
    ) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Theme.of(context).colorScheme.error,
            action: SnackBarAction(
              label: '확인',
              onPressed: () => viewModel.clearError(),
            ),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('카테고리 관리'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => viewModel.refresh(),
            tooltip: '새로고침',
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchAndFilter(viewModel, state),
          Expanded(child: _buildSeasoningList(context, state, viewModel)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateDialog(context, viewModel),
        tooltip: '카테고리 추가',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSearchAndFilter(
    SeasoningManagementViewModel viewModel,
    SeasoningManagementState state,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 검색바
          SearchBar(
            controller: _searchController,
            focusNode: _searchFocusNode,
            hintText: '카테고리 이름을 검색하세요...',
            leading: const Icon(Icons.search),
            trailing: [
              if (_searchController.text.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    viewModel.searchSeasonings('');
                  },
                ),
            ],
            onChanged: (query) {
              viewModel.searchSeasonings(query);
            },
            onSubmitted: (query) {
              _searchFocusNode.unfocus();
            },
          ),

          const SizedBox(height: 12),

          // 카테고리 필터
          if (state.categories.isNotEmpty) ...[
            Text(
              '카테고리',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterChip(
                    label: const Text('전체'),
                    selected: state.selectedCategory == null,
                    onSelected: (_) => viewModel.filterByCategory(null),
                  ),
                  const SizedBox(width: 8),
                  ...state.categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text(category),
                        selected: state.selectedCategory == category,
                        onSelected: (_) => viewModel.filterByCategory(category),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSeasoningList(
    BuildContext context,
    SeasoningManagementState state,
    SeasoningManagementViewModel viewModel,
  ) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.seasonings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.spa,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              state.searchQuery.isNotEmpty ? '검색 결과가 없습니다' : '등록된 재료가 없습니다',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '카테고리를 추가해보세요!',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => viewModel.refresh(),
      child: ListView.builder(
        itemCount: state.seasonings.length,
        itemBuilder: (context, index) {
          final seasoning = state.seasonings[index];
          return _buildSeasoningCard(context, seasoning, viewModel);
        },
      ),
    );
  }

  Widget _buildSeasoningCard(
    BuildContext context,
    IngredientMasterEntity seasoning,
    SeasoningManagementViewModel viewModel,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            seasoning.name.substring(0, 1),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          seasoning.name,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                seasoning.predefinedCategory?.displayName ?? seasoning.categoryId,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
            if (seasoning.description != null) ...[
              const SizedBox(height: 4),
              Text(
                seasoning.description!,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const SizedBox(height: 4),
            Text(
              '사용 횟수: ${seasoning.usageCount}회',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () => _showDeleteDialog(context, seasoning, viewModel),
          tooltip: '삭제',
        ),
      ),
    );
  }

  void _showCreateDialog(
    BuildContext context,
    SeasoningManagementViewModel viewModel,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => SeasoningCreateDialog(
            categories:
                ref.read(seasoningManagementViewModelProvider).categories,
            onSave: (name, category, description) {
              // 카테고리 이름을 ID로 변환
              final categoryId = _getCategoryIdFromDisplayName(category);
              viewModel.createSeasoning(
                name: name,
                categoryId: categoryId,
                description: description,
              );
            },
          ),
    );
  }

  void _showDeleteDialog(
    BuildContext context,
    IngredientMasterEntity seasoning,
    SeasoningManagementViewModel viewModel,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('재료 삭제'),
            content: Text('${seasoning.name}을(를) 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('취소'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  viewModel.deleteSeasoning(seasoning.id);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                child: const Text('삭제'),
              ),
            ],
          ),
    );
  }

  // 카테고리 표시명을 ID로 변환하는 헬퍼 함수
  String _getCategoryIdFromDisplayName(String? displayName) {
    if (displayName == null) return PredefinedCategories.ingredient.id;
    
    for (final category in PredefinedCategories.all) {
      if (category.displayName == displayName) {
        return category.id;
      }
    }
    
    // 기본값
    return PredefinedCategories.ingredient.id;
  }
}
