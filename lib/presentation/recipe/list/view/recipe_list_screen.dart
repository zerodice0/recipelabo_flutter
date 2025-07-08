import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/presentation/recipe/list/viewmodel/recipe_list_viewmodel.dart';
import 'package:recipick_flutter/core/routes/app_router.dart';
import 'package:recipick_flutter/core/config/recipe_card_widget.dart';
import 'package:recipick_flutter/core/config/app_colors.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';

class RecipeListScreen extends ConsumerWidget {
  final bool showAppBar;

  const RecipeListScreen({super.key, this.showAppBar = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeListState = ref.watch(recipeListViewModelProvider);

    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: Text(AppLocalizations.of(context).recipeList),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    context.push(AppRoutes.search);
                  },
                  tooltip: AppLocalizations.of(context).navigationSearch,
                ),
              ],
            )
          : null,
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(recipeListViewModelProvider.notifier).refresh(),
        child: recipeListState.when(
          data: (recipes) {
            if (recipes.isEmpty) {
              return Center(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(24),
                  constraints: const BoxConstraints(maxWidth: 500),
                  decoration: BoxDecoration(
                    // 픽셀 아트 스타일 레시피북 배경
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFF5F3E8), // 크림색 종이
                        Color(0xFFEDE5D3), // 약간 어두운 크림색
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF8B4513), // 갈색 테두리
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF5D2E0A).withValues(alpha: 0.6),
                        offset: const Offset(6, 6),
                        blurRadius: 0, // 픽셀 아트는 블러 없음
                      ),
                      BoxShadow(
                        color: const Color(0xFF3D1E0A).withValues(alpha: 0.3),
                        offset: const Offset(8, 8),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 레시피가 비어있다는 걸 나타내는 이모지
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          color: AppColors.chipBackground,
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                            color: AppColors.chipBorder,
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.chipShadow.withValues(
                                alpha: 0.4,
                              ),
                              offset: const Offset(4, 4),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text('📄', style: TextStyle(fontSize: 52)),
                              Opacity(
                                opacity: 0.5,
                                child: Text(
                                  '❌',
                                  style: TextStyle(fontSize: 72),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      Text(
                        AppLocalizations.of(context).recipeEmptyState,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: AppColors.chipText,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'monospace', // 픽셀 아트 느낌
                              fontSize: 20,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),

                      Text(
                        AppLocalizations.of(
                          context,
                        ).recipeEmptyStateDescription,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textBrown.withValues(alpha: 0.8),
                          height: 1.4,
                          fontFamily: 'monospace',
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),

                      // 버튼들 - 반응형 디자인
                      LayoutBuilder(
                        builder: (context, constraints) {
                          // 화면 너비가 작을 때는 세로로, 클 때는 가로로 배치
                          if (constraints.maxWidth < 400) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryOrange,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColors.primaryDark,
                                        width: 3,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.deepBrown.withValues(
                                            alpha: 0.8,
                                          ),
                                          offset: const Offset(3, 3),
                                          blurRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        context.push(AppRoutes.recipeCreate);
                                      },
                                      icon: const Text(
                                        '➕',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      label: Text(
                                        AppLocalizations.of(context).recipeAdd,
                                        style: const TextStyle(
                                          fontFamily: 'monospace',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        foregroundColor: AppColors.warmWhite,
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 14,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.accent,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColors.textBrown,
                                        width: 3,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.primaryDark
                                              .withValues(alpha: 0.8),
                                          offset: const Offset(3, 3),
                                          blurRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: OutlinedButton.icon(
                                      onPressed: () {
                                        context.push(AppRoutes.search);
                                      },
                                      icon: const Text(
                                        '🔍',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      label: Text(
                                        AppLocalizations.of(
                                          context,
                                        ).ingredientSearch,
                                        style: const TextStyle(
                                          fontFamily: 'monospace',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        foregroundColor: AppColors.textBrown,
                                        side: BorderSide.none,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 14,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 16,
                              runSpacing: 12,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryOrange,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.primaryDark,
                                      width: 3,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.deepBrown.withValues(
                                          alpha: 0.8,
                                        ),
                                        offset: const Offset(3, 3),
                                        blurRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      context.push(AppRoutes.recipeCreate);
                                    },
                                    icon: const Text(
                                      '➕',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    label: Text(
                                      AppLocalizations.of(context).recipeAdd,
                                      style: const TextStyle(
                                        fontFamily: 'monospace',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: AppColors.warmWhite,
                                      elevation: 0,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.accent,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.textBrown,
                                      width: 3,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primaryDark.withValues(
                                          alpha: 0.8,
                                        ),
                                        offset: const Offset(3, 3),
                                        blurRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: OutlinedButton.icon(
                                    onPressed: () {
                                      context.push(AppRoutes.search);
                                    },
                                    icon: const Text(
                                      '🔍',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    label: Text(
                                      AppLocalizations.of(
                                        context,
                                      ).ingredientSearch,
                                      style: const TextStyle(
                                        fontFamily: 'monospace',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: AppColors.textBrown,
                                      side: BorderSide.none,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return RecipeCardWidget(
                  recipe: recipe,
                  onTap: () {
                    context.push('/recipes/${recipe.id}');
                  },
                  onDelete: () =>
                      _showDeleteConfirmDialog(context, ref, recipe),
                );
              },
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: SelectableText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${AppLocalizations.of(context).generalErrorOccurred}:\n\n',
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryOrange,
          border: Border.all(color: AppColors.primaryDark, width: 3),
          boxShadow: [
            BoxShadow(
              color: AppColors.deepBrown.withValues(alpha: 0.8),
              offset: const Offset(4, 4),
              blurRadius: 0,
            ),
            BoxShadow(
              color: AppColors.textBrown.withValues(alpha: 0.6),
              offset: const Offset(6, 6),
              blurRadius: 0,
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          heroTag: 'recipe_list_screen_floating_action_button',
          onPressed: () {
            context.push(AppRoutes.recipeCreate);
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          splashColor: AppColors.warmWhite.withValues(alpha: 0.2),
          icon: const Text('🍳', style: TextStyle(fontSize: 20)),
          label: Text(
            AppLocalizations.of(context).recipeAdd,
            style: const TextStyle(
              color: AppColors.warmWhite,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: 'monospace',
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmDialog(
    BuildContext context,
    WidgetRef ref,
    RecipeEntity recipe,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context).actionDelete),
        content: Text(AppLocalizations.of(context).recipeDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context).actionCancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();

              try {
                await ref
                    .read(recipeListViewModelProvider.notifier)
                    .deleteRecipe(recipe.id);

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        AppLocalizations.of(context).recipeDeleteSuccess,
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  );
                }
              } catch (error) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${AppLocalizations.of(context).recipeDeleteFailed}: $error',
                      ),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                  );
                }
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(AppLocalizations.of(context).actionDelete),
          ),
        ],
      ),
    );
  }
}
