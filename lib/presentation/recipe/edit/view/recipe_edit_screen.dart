import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saucerer_flutter/domain/entities/step_entity.dart';
import 'package:saucerer_flutter/presentation/recipe/edit/viewmodel/recipe_edit_viewmodel.dart';
import 'package:saucerer_flutter/presentation/recipe/list/viewmodel/recipe_list_viewmodel.dart';
import 'package:saucerer_flutter/presentation/recipe/widgets/seasoning_selector_widget.dart';

class RecipeEditScreen extends ConsumerWidget {
  final String? recipeId;
  
  const RecipeEditScreen({
    super.key,
    this.recipeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(recipeEditViewModelProvider(recipeId));
    final notifier = ref.read(recipeEditViewModelProvider(recipeId).notifier);

    ref.listen<AsyncValue<void>>(
      recipeEditViewModelProvider(recipeId).select((state) => state.saveState),
      (previous, next) {
        next.when(
          data: (_) {
            // On success, refresh the list and pop the screen
            ref.read(recipeListViewModelProvider.notifier).refresh();
            context.pop();
          },
          error: (err, stack) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('저장 실패: $err')),
            );
          },
          loading: () {},
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.isEditMode ? '레시피 편집' : '새 레시피'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: viewModel.saveState.isLoading || viewModel.isLoading
                ? null
                : () => notifier.saveRecipe(),
          ),
        ],
      ),
      body: viewModel.isLoading
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
      BuildContext context, String title, VoidCallback onAdd) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        IconButton(icon: const Icon(Icons.add), onPressed: onAdd),
      ],
    );
  }


  List<Widget> _buildStepFields(
      List<StepEntity> steps, RecipeEditViewModel notifier) {
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
              onChanged: (desc) =>
                  notifier.updateStep(index, step.copyWith(description: desc)),
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
}
