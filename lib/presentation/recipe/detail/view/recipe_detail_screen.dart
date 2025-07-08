import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/domain/entities/recipe_version_entity.dart';
import 'package:recipick_flutter/domain/entities/cooking_log_entity.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';
import 'package:recipick_flutter/presentation/recipe/detail/viewmodel/recipe_detail_viewmodel.dart';
import 'package:recipick_flutter/presentation/recipe/detail/viewmodel/cooking_log_viewmodel.dart';
import 'package:recipick_flutter/domain/usecases/delete_recipe_version_usecase.dart';

class RecipeDetailScreen extends ConsumerStatefulWidget {
  final String recipeId;

  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  ConsumerState<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends ConsumerState<RecipeDetailScreen> {
  String? _selectedVersionId;

  String _formatDate(DateTime dateTime) {
    return '${dateTime.year}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.day.toString().padLeft(2, '0')}';
  }

  Future<void> _showDeleteVersionDialog(
    BuildContext context,
    RecipeVersionEntity version,
    List<RecipeVersionEntity> allVersions,
  ) async {
    if (allVersions.length <= 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).recipeVersionsRequired),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context).versionDelete),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context).recipeDeleteConfirm),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${version.versionName ?? 'v${version.versionNumber}'} - ${version.name}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${AppLocalizations.of(context).dateCreated} ${_formatDate(version.createdAt)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context).recipeDeleteConfirm,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(AppLocalizations.of(context).actionCancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: Text(AppLocalizations.of(context).actionDelete),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await _deleteVersion(context, version, allVersions);
    }
  }

  Future<void> _deleteVersion(
    BuildContext context,
    RecipeVersionEntity version,
    List<RecipeVersionEntity> allVersions,
  ) async {
    try {
      final deleteUseCase = ref.read(deleteRecipeVersionUseCaseProvider);
      await deleteUseCase(version.id);

      // 현재 선택된 버전이 삭제되었다면 다른 버전을 선택
      if (_selectedVersionId == version.id) {
        final remainingVersions = allVersions
            .where((v) => v.id != version.id)
            .toList();
        if (remainingVersions.isNotEmpty) {
          setState(() {
            _selectedVersionId = remainingVersions.first.id;
          });
        }
      }

      // 데이터 새로고침
      ref.invalidate(recipeDetailViewModelProvider(widget.recipeId));

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${AppLocalizations.of(context).recipeDeleteSuccess}: "${version.versionName ?? 'v${version.versionNumber}'}"',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${AppLocalizations.of(context).recipeDeleteFailed}: $e',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final recipeDetailState = ref.watch(
      recipeDetailViewModelProvider(widget.recipeId),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).recipeDetail),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                // 현재 선택된 버전 ID를 쿼리 파라미터로 전달
                final versionParam = _selectedVersionId != null
                    ? '?versionId=$_selectedVersionId'
                    : '';
                final result = await context.push<bool>(
                  '/recipes/${widget.recipeId}/edit$versionParam',
                );
                if (result == true) {
                  // 편집 후 돌아온 경우 데이터 새로고침
                  ref.invalidate(
                    recipeDetailViewModelProvider(widget.recipeId),
                  );
                }
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
                  TextSpan(
                    text:
                        '${AppLocalizations.of(context).recipeLoadingError}:\n\n',
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
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    RecipeEntity recipe,
    List<RecipeVersionEntity> versions,
  ) {
    // 선택된 버전이 없으면 첫 번째 버전을 선택
    if (_selectedVersionId == null && versions.isNotEmpty) {
      _selectedVersionId = versions.first.id;
    }

    // 선택된 버전 찾기
    final selectedVersion = versions.firstWhere(
      (v) => v.id == _selectedVersionId,
      orElse: () =>
          versions.isNotEmpty ? versions.first : throw Exception('버전이 없습니다'),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRecipeHeader(context, recipe),
          const SizedBox(height: 24),
          _buildVersionSelector(context, versions),
          const SizedBox(height: 16),
          if (versions.isNotEmpty) ...[
            // _buildVersionInfo(context, selectedVersion, versions),
            // const SizedBox(height: 24),
            _buildIngredientsList(context, selectedVersion),
            const SizedBox(height: 24),
            _buildStepsList(context, selectedVersion),
            const SizedBox(height: 24),
            _buildCookingLogsSection(context, recipe, selectedVersion),
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
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
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
                  '${AppLocalizations.of(context).dateCreated} ${_formatDate(recipe.createdAt)}',
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
                  '${AppLocalizations.of(context).dateLastUpdated} ${_formatDate(recipe.updatedAt)}',
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

  Widget _buildVersionSelector(
    BuildContext context,
    List<RecipeVersionEntity> versions,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).versionSelect,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (versions.isEmpty)
              Text(
                AppLocalizations.of(context).versionNoVersionsAvailable,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              )
            else
              Column(
                children: versions.map((version) {
                  final isSelected = _selectedVersionId == version.id;

                  return Container(
                    key: ValueKey(version.id),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        setState(() {
                          _selectedVersionId = version.id;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(
                                    context,
                                  ).colorScheme.outline.withValues(alpha: 0.3),
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(
                                            context,
                                          ).colorScheme.secondaryContainer,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (isSelected)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 4,
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onPrimary,
                                            size: 14,
                                          ),
                                        ),
                                      Text(
                                        version.versionName ??
                                            'v${version.versionNumber}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: isSelected
                                                  ? Theme.of(
                                                      context,
                                                    ).colorScheme.onPrimary
                                                  : Theme.of(context)
                                                        .colorScheme
                                                        .onSecondaryContainer,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    version.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: isSelected
                                              ? Theme.of(
                                                  context,
                                                ).colorScheme.onPrimaryContainer
                                              : null,
                                        ),
                                  ),
                                ),
                                if (versions.length > 1)
                                  IconButton(
                                    onPressed: () => _showDeleteVersionDialog(
                                      context,
                                      version,
                                      versions,
                                    ),
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                      size: 20,
                                    ),
                                    tooltip: AppLocalizations.of(
                                      context,
                                    ).versionDelete,
                                    constraints: const BoxConstraints(
                                      minWidth: 32,
                                      minHeight: 32,
                                    ),
                                    padding: const EdgeInsets.all(4),
                                  ),
                              ],
                            ),
                            if (version.changeLog != null &&
                                version.changeLog!.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color:
                                      (isSelected
                                              ? Theme.of(
                                                  context,
                                                ).colorScheme.primary
                                              : Theme.of(context)
                                                    .colorScheme
                                                    .surfaceContainerHighest)
                                          .withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.edit_note,
                                          size: 16,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurfaceVariant,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          AppLocalizations.of(
                                            context,
                                          ).versionChanges,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onSurfaceVariant,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        20.0,
                                        0.0,
                                        20.0,
                                        0.0,
                                      ),
                                      child: Text(
                                        version.changeLog!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: isSelected
                                                  ? Theme.of(context)
                                                        .colorScheme
                                                        .onPrimaryContainer
                                                  : Theme.of(context)
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            const SizedBox(height: 4),
                            Text(
                              '${AppLocalizations.of(context).dateCreated} ${_formatDate(version.createdAt)}',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: isSelected
                                        ? Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer
                                              .withValues(alpha: 0.8)
                                        : Theme.of(
                                            context,
                                          ).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            _buildBaseVersionInfo(context, version, versions),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBaseVersionInfo(
    BuildContext context,
    RecipeVersionEntity version,
    List<RecipeVersionEntity> allVersions,
  ) {
    RecipeVersionEntity? baseVersion;

    if (allVersions.last.id == version.id) {
      baseVersion = null;
    } else if (allVersions.any((v) => v.id == version.baseVersionId)) {
      baseVersion = allVersions.firstWhere(
        (v) => v.id == version.baseVersionId,
      );
    } else {
      baseVersion = allVersions.firstWhere(
        (v) => v.id == version.baseVersionId,
        orElse: () => RecipeVersionEntity(
          id: 'deleted',
          recipeId: version.recipeId,
          versionNumber: 0,
          name: '삭제된 버전',
          description: '',
          ingredients: [],
          steps: [],
          authorId: '',
          createdAt: DateTime.now(),
        ),
      );
    }

    //if (allVersions.first.id == version.id) {
    //   baseVersion = null;
    // } else {
    //   // 기반 버전 정보 찾기
    // }

    final isDeleted = baseVersion?.id == 'deleted';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDeleted
            ? Theme.of(
                context,
              ).colorScheme.errorContainer.withValues(alpha: 0.5)
            : Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDeleted
              ? Theme.of(context).colorScheme.error.withValues(alpha: 0.3)
              : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isDeleted ? Icons.link_off : Icons.fork_right,
                size: 16,
                color: isDeleted
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.onTertiaryContainer,
              ),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context).versionBase,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isDeleted
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.onTertiaryContainer,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (isDeleted) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber,
                    size: 14,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    AppLocalizations.of(context).versionBaseDeleted,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ] else if (baseVersion != null) ...[
            InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () {
                // 기반 버전으로 이동
                setState(() {
                  _selectedVersionId = baseVersion?.id;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'v${baseVersion.versionNumber}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      baseVersion.versionName ?? baseVersion.name,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ],
                ),
              ),
            ),
          ] else ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Text(
                AppLocalizations.of(context).versionIsInitial,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildIngredientsList(
    BuildContext context,
    RecipeVersionEntity version,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).recipeIngredients,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (version.ingredients.isEmpty)
              Text(
                AppLocalizations.of(context).ingredientNoIngredientsAvailable,
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
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
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
              AppLocalizations.of(context).recipeCookingSteps,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (version.steps.isEmpty)
              Text(
                AppLocalizations.of(context).cookingStepNoStepsAvailable,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: version.steps.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
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
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
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
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.outline,
                                  ),
                                ),
                                child: const Center(child: Icon(Icons.image)),
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

  Widget _buildCookingLogsSection(
    BuildContext context,
    RecipeEntity recipe,
    RecipeVersionEntity version,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        final cookingLogsAsync = ref.watch(
          cookingLogViewModelProvider(version.id),
        );

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
                      AppLocalizations.of(context).cookingLog,
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
                            'versionName':
                                'v${version.versionNumber} - ${version.name}',
                          },
                        );

                        if (result == true) {
                          // 쿠킹 로그가 추가되었으므로 새로고침
                          ref.invalidate(
                            cookingLogViewModelProvider(version.id),
                          );
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: Text(AppLocalizations.of(context).cookingLogAdd),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                cookingLogsAsync.when(
                  data: (cookingLogs) =>
                      _buildCookingLogsList(context, cookingLogs),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Center(
                    child: SelectableText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${AppLocalizations.of(context).cookingLogLoadingError}\n\n',
                            style: const TextStyle(fontWeight: FontWeight.bold),
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

  Widget _buildCookingLogsList(
    BuildContext context,
    List<CookingLogEntity> cookingLogs,
  ) {
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
                AppLocalizations.of(context).cookingLogNoLogsAvailable,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                AppLocalizations.of(context).cookingLogAddFirstLog,
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

  Widget _buildCookingLogItem(
    BuildContext context,
    CookingLogEntity cookingLog,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Theme.of(context).colorScheme.outline),
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
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
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
