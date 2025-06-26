import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saucerer_flutter/domain/entities/recipe_entity.dart';
import 'package:saucerer_flutter/domain/entities/recipe_version_entity.dart';
import 'package:saucerer_flutter/domain/entities/cooking_log_entity.dart';
import 'package:saucerer_flutter/presentation/recipe/detail/viewmodel/recipe_detail_viewmodel.dart';
import 'package:saucerer_flutter/presentation/recipe/detail/viewmodel/cooking_log_viewmodel.dart';

class RecipeDetailScreen extends ConsumerWidget {
  final String recipeId;
  
  const RecipeDetailScreen({
    super.key,
    required this.recipeId,
  });

  String _formatDate(DateTime dateTime) {
    return '${dateTime.year}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeDetailState = ref.watch(recipeDetailViewModelProvider(recipeId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('레시피 상세'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.push('/recipes/$recipeId/edit');
            },
          ),
        ],
      ),
      body: recipeDetailState.when(
        data: (data) => _buildContent(context, data.$1, data.$2),
        error: (error, stackTrace) => Center(
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
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildContent(BuildContext context, RecipeEntity recipe, List<RecipeVersionEntity> versions) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRecipeHeader(context, recipe),
          const SizedBox(height: 24),
          _buildVersionSelector(context, versions),
          const SizedBox(height: 24),
          if (versions.isNotEmpty) ...[
            _buildIngredientsList(context, versions.first),
            const SizedBox(height: 24),
            _buildStepsList(context, versions.first),
            const SizedBox(height: 24),
            _buildCookingLogsSection(context, recipe, versions.first),
          ],
        ],
      ),
    );
  }

  Widget _buildRecipeHeader(BuildContext context, RecipeEntity recipe) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipe.name,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (recipe.description != null) ...[
              Text(
                recipe.description!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
            ],
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  '생성일: ${_formatDate(recipe.createdAt)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.update,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  '최종 업데이트: ${_formatDate(recipe.updatedAt)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVersionSelector(BuildContext context, List<RecipeVersionEntity> versions) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '버전 선택',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            if (versions.isEmpty)
              Text(
                '등록된 버전이 없습니다',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              )
            else
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                value: versions.first.id,
                items: versions.map((version) {
                  return DropdownMenuItem<String>(
                    value: version.id,
                    child: Text('v${version.versionNumber} - ${version.name}'),
                  );
                }).toList(),
                onChanged: (value) {
                  // TODO: Handle version change
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientsList(BuildContext context, RecipeVersionEntity version) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '재료',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            if (version.ingredients.isEmpty)
              Text(
                '등록된 재료가 없습니다',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: version.ingredients.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final ingredient = version.ingredients[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            ingredient.name,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Text(
                          '${ingredient.quantity} ${ingredient.unit}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }


  Widget _buildStepsList(BuildContext context, RecipeVersionEntity version) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '조리 순서',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            if (version.steps.isEmpty)
              Text(
                '등록된 조리 순서가 없습니다',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: version.steps.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final step = version.steps[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${step.stepNumber}',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              step.description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            if (step.imageUrl != null) ...[
                              const SizedBox(height: 8),
                              Container(
                                height: 120,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Theme.of(context).colorScheme.outline,
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(Icons.image),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCookingLogsSection(BuildContext context, RecipeEntity recipe, RecipeVersionEntity version) {
    return Consumer(
      builder: (context, ref, child) {
        final cookingLogsAsync = ref.watch(cookingLogViewModelProvider(version.id));
        
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '쿠킹 로그',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final result = await context.push<bool>(
                          '/recipes/${recipe.id}/cooking-log',
                          extra: {
                            'recipeVersionId': version.id,
                            'recipeName': recipe.name,
                            'versionName': 'v${version.versionNumber} - ${version.name}',
                          },
                        );
                        
                        if (result == true) {
                          // 쿠킹 로그가 추가되었으므로 새로고침
                          ref.invalidate(cookingLogViewModelProvider(version.id));
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('로그 추가'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                cookingLogsAsync.when(
                  data: (cookingLogs) => _buildCookingLogsList(context, cookingLogs),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Center(
                    child: SelectableText.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: '쿠킹 로그를 불러오는 중 오류가 발생했습니다:\n\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: error.toString()),
                        ],
                      ),
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCookingLogsList(BuildContext context, List<CookingLogEntity> cookingLogs) {
    if (cookingLogs.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.restaurant_menu,
                size: 48,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 8),
              Text(
                '아직 쿠킹 로그가 없습니다',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '첫 번째 쿠킹 로그를 추가해보세요!',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cookingLogs.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final cookingLog = cookingLogs[index];
        return _buildCookingLogItem(context, cookingLog);
      },
    );
  }

  Widget _buildCookingLogItem(BuildContext context, CookingLogEntity cookingLog) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            child: cookingLog.imageUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.file(
                      File(cookingLog.imageUrl!),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.broken_image,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  )
                : Icon(
                    Icons.restaurant,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cookingLog.title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                if (cookingLog.memo != null) ...[
                  Text(
                    cookingLog.memo!,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                ],
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 14,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatDate(cookingLog.cookedAt),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}