import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saucerer_flutter/presentation/recipe/list/viewmodel/recipe_list_viewmodel.dart';
import 'package:saucerer_flutter/core/routes/app_router.dart';

class RecipeListScreen extends ConsumerWidget {
  final bool showAppBar;
  
  const RecipeListScreen({
    super.key,
    this.showAppBar = true,
  });

  String _formatDate(DateTime dateTime) {
    return '${dateTime.year}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeListState = ref.watch(recipeListViewModelProvider);

    return Scaffold(
      appBar: showAppBar ? AppBar(
        title: const Text('나의 레시피'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.push(AppRoutes.search);
            },
            tooltip: '재료로 검색',
          ),
        ],
      ) : null,
      body: RefreshIndicator(
        onRefresh: () => ref.read(recipeListViewModelProvider.notifier).refresh(),
        child: recipeListState.when(
          data: (recipes) {
            if (recipes.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.restaurant_menu,
                      size: 64,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '아직 레시피가 없습니다',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '첫 레시피를 추가해보세요!',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: () {
                        context.push(AppRoutes.search);
                      },
                      icon: const Icon(Icons.search),
                      label: const Text('재료로 검색해보기'),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      recipe.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          recipe.description ?? '설명이 없습니다',
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '최종 업데이트: ${_formatDate(recipe.updatedAt)}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      context.push('/recipes/${recipe.id}');
                    },
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) {
            // As per GEMINI.md, display errors using SelectableText.rich
            return Center(
              child: SelectableText.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: '오류가 발생했습니다:\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: error.toString()),
                  ],
                ),
                style: const TextStyle(color: Colors.red),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRoutes.recipeCreate);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
