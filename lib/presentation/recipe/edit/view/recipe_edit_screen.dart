import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saucerer_flutter/domain/entities/recipe_version_entity.dart';
import 'package:saucerer_flutter/domain/entities/step_entity.dart';
import 'package:saucerer_flutter/presentation/recipe/edit/viewmodel/recipe_edit_viewmodel.dart';
import 'package:saucerer_flutter/presentation/recipe/list/viewmodel/recipe_list_viewmodel.dart';
import 'package:saucerer_flutter/presentation/recipe/widgets/seasoning_selector_widget.dart';
import 'package:saucerer_flutter/presentation/recipe/widgets/version_name_conflict_dialog.dart';

class RecipeEditScreen extends ConsumerWidget {
  final String? recipeId;
  final String? versionId;

  const RecipeEditScreen({super.key, this.recipeId, this.versionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(recipeEditViewModelProvider(recipeId));
    final notifier = ref.read(recipeEditViewModelProvider(recipeId).notifier);

    // versionId가 있고 아직 설정되지 않았다면 설정
    if (versionId != null &&
        versionId!.isNotEmpty &&
        viewModel.initialVersionId != versionId) {
      // 다음 프레임에서 실행하여 빌드 중에 상태 변경을 방지
      Future.microtask(() => notifier.setInitialVersionId(versionId!));
    }

    ref.listen<AsyncValue<void>>(
      recipeEditViewModelProvider(recipeId).select((state) => state.saveState),
      (previous, next) {
        next.when(
          data: (_) {
            // On success, refresh the list and pop the screen
            ref.read(recipeListViewModelProvider.notifier).refresh();
            context.pop(true);
          },
          error: (err, stack) {
            final errorMessage = err.toString();
            if (errorMessage.startsWith('VERSION_NAME_CONFLICT:')) {
              // 버전명 충돌 다이얼로그 표시
              final conflictingName = errorMessage.split(':')[1];
              _showVersionNameConflictDialog(
                context,
                ref,
                recipeId,
                conflictingName,
              );
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('저장 실패: $err')));
            }
          },
          loading: () {},
        );
      },
    );

    // 저장 옵션 다이얼로그 표시 리스너
    ref.listen<bool>(
      recipeEditViewModelProvider(
        recipeId,
      ).select((state) => state.showSaveOptions),
      (previous, showSaveOptions) {
        if (showSaveOptions) {
          _showSaveOptionsDialog(context, ref, recipeId);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(viewModel.isEditMode ? '레시피 편집' : '새 레시피'),
            if (viewModel.isEditMode &&
                viewModel.allVersions != null &&
                viewModel.allVersions!.isNotEmpty) ...[
              Builder(
                builder: (context) {
                  RecipeVersionEntity? currentVersion;
                  try {
                    currentVersion = viewModel.allVersions!.firstWhere(
                      (version) => version.id == viewModel.recipeVersionId,
                    );
                  } catch (e) {
                    currentVersion = viewModel.allVersions!.first;
                  }
                  return Text(
                    currentVersion.fullDisplayName,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed:
                viewModel.saveState.isLoading || viewModel.isLoading
                    ? null
                    : () => notifier.saveRecipe(),
          ),
        ],
      ),
      body:
          viewModel.isLoading
              ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('레시피를 불러오는 중...'),
                  ],
                ),
              )
              : viewModel.error != null
              ? Center(
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
                        '레시피를 불러올 수 없습니다',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        viewModel.error!,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => context.pop(),
                        child: const Text('돌아가기'),
                      ),
                    ],
                  ),
                ),
              )
              : viewModel.saveState.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      initialValue: viewModel.name,
                      decoration: const InputDecoration(labelText: '레시피 이름'),
                      onChanged: notifier.updateName,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: viewModel.description,
                      decoration: const InputDecoration(labelText: '설명'),
                      onChanged: notifier.updateDescription,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 24),
                    IngredientSelectorWidget(
                      label: '재료',
                      selectedIngredients: viewModel.ingredients,
                      onIngredientsChanged: notifier.updateIngredients,
                    ),
                    const SizedBox(height: 24),
                    _buildSectionHeader(context, '조리 단계', notifier.addStep),
                    ..._buildStepFields(viewModel.steps, notifier),
                  ],
                ),
              ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    VoidCallback onAdd,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        IconButton(icon: const Icon(Icons.add), onPressed: onAdd),
      ],
    );
  }

  List<Widget> _buildStepFields(
    List<StepEntity> steps,
    RecipeEditViewModel notifier,
  ) {
    return List.generate(steps.length, (index) {
      final step = steps[index];
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${step.stepNumber}.'),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              initialValue: step.description,
              decoration: const InputDecoration(labelText: '설명'),
              onChanged:
                  (desc) => notifier.updateStep(
                    index,
                    step.copyWith(description: desc),
                  ),
              maxLines: null,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () => notifier.removeStep(index),
          ),
        ],
      );
    });
  }

  void _showSaveOptionsDialog(
    BuildContext context,
    WidgetRef ref,
    String? recipeId,
  ) {
    final notifier = ref.read(recipeEditViewModelProvider(recipeId).notifier);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('저장 옵션'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('어떻게 저장하시겠습니까?'),
                const SizedBox(height: 16),
                Consumer(
                  builder: (context, ref, child) {
                    final currentState = ref.watch(
                      recipeEditViewModelProvider(recipeId),
                    );

                    // 현재 편집 중인 버전 찾기
                    RecipeVersionEntity? currentVersion;
                    if (currentState.allVersions != null &&
                        currentState.allVersions!.isNotEmpty) {
                      try {
                        currentVersion = currentState.allVersions!.firstWhere(
                          (version) =>
                              version.id == currentState.recipeVersionId,
                        );
                      } catch (e) {
                        // 현재 버전 ID가 없으면 첫 번째 버전 사용
                        currentVersion = currentState.allVersions!.first;
                      }
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 현재 편집 중인 버전 정보 표시
                        if (currentVersion != null) ...[
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  size: 16,
                                  color:
                                      Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '편집 중: ${currentVersion.fullDisplayName}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium?.copyWith(
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],

                        RadioListTile<bool>(
                          title: const Text('새 버전으로 저장'),
                          subtitle:
                              currentVersion != null
                                  ? Text(
                                    '${currentVersion.fullDisplayName}에서 파생된 새 버전을 생성합니다',
                                  )
                                  : const Text('기존 버전은 유지하고 새 버전을 생성합니다'),
                          value: true,
                          groupValue: currentState.createNewVersion,
                          onChanged: (value) {
                            if (value != null) {
                              notifier.toggleCreateNewVersion(value);
                            }
                          },
                        ),
                        RadioListTile<bool>(
                          title: const Text('기존 버전 덮어쓰기'),
                          subtitle:
                              currentVersion != null
                                  ? Text(
                                    '${currentVersion.fullDisplayName}을(를) 업데이트합니다',
                                  )
                                  : const Text('현재 버전을 업데이트합니다'),
                          value: false,
                          groupValue: currentState.createNewVersion,
                          onChanged: (value) {
                            if (value != null) {
                              notifier.toggleCreateNewVersion(value);
                            }
                          },
                        ),
                        if (currentState.createNewVersion) ...[
                          const SizedBox(height: 16),
                          // 기반 버전 정보 표시
                          if (currentVersion != null) ...[
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.fork_right,
                                    size: 16,
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onPrimaryContainer,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '기반 버전: ${currentVersion.fullDisplayName}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall?.copyWith(
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onPrimaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                          TextField(
                            decoration: const InputDecoration(
                              labelText: '버전명 (선택사항)',
                              hintText: '예: 라볶이, 설탕 대체제, 매운맛',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: notifier.updateVersionName,
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            decoration: const InputDecoration(
                              labelText: '변경사항 (선택사항)',
                              hintText: '예: 설탕량 줄임, 야채 추가',
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 2,
                            onChanged: notifier.updateChangeLog,
                          ),
                        ],
                      ],
                    );
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  notifier.hideSaveOptions();
                  Navigator.of(context).pop();
                },
                child: const Text('취소'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  notifier.performSave();
                },
                child: const Text('저장'),
              ),
            ],
          ),
    );
  }

  void _showVersionNameConflictDialog(
    BuildContext context,
    WidgetRef ref,
    String? recipeId,
    String conflictingName,
  ) {
    final notifier = ref.read(recipeEditViewModelProvider(recipeId).notifier);

    VersionNameConflictDialogs.show(
      context,
      conflictingVersionName: conflictingName,
      onOverwrite: () {
        // 기존 버전을 덮어쓰기로 변경하고 다시 저장
        notifier.toggleCreateNewVersion(false);
        notifier.performSave();
      },
      onRename: (newVersionName) {
        // 새로운 버전명으로 설정하고 다시 저장
        notifier.updateVersionName(newVersionName);
        notifier.performSave();
      },
      onCancel: () {
        // 저장 상태 초기화 - 에러 상태 클리어
        notifier.clearSaveError();
      },
    );
  }
}
