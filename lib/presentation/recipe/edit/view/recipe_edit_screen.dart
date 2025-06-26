import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saucerer_flutter/domain/entities/ingredient_entity.dart';
import 'package:saucerer_flutter/domain/entities/step_entity.dart';
import 'package:saucerer_flutter/presentation/recipe/edit/viewmodel/recipe_edit_viewmodel.dart';
import 'package:saucerer_flutter/presentation/recipe/list/viewmodel/recipe_list_viewmodel.dart';

class RecipeEditScreen extends ConsumerWidget {
  const RecipeEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(recipeEditViewModelProvider);
    final notifier = ref.read(recipeEditViewModelProvider.notifier);

    ref.listen<AsyncValue<void>>(
      recipeEditViewModelProvider.select((state) => state.saveState),
      (previous, next) {
        next.when(
          data: (_) {
            // On success, refresh the list and pop the screen
            ref.read(recipeListViewModelProvider.notifier).refresh();
            Navigator.of(context).pop();
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
        title: const Text('새 레시피'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: viewModel.saveState.isLoading
                ? null
                : () => notifier.saveRecipe(),
          ),
        ],
      ),
      body: viewModel.saveState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: '레시피 이름'),
                    onChanged: notifier.updateName,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(labelText: '설명'),
                    onChanged: notifier.updateDescription,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24),
                  _buildSectionHeader(context, '재료', notifier.addIngredient),
                  ..._buildIngredientFields(viewModel.ingredients, notifier),
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

  List<Widget> _buildIngredientFields(
      List<IngredientEntity> ingredients, RecipeEditViewModel notifier) {
    return List.generate(ingredients.length, (index) {
      final ingredient = ingredients[index];
      return Row(
        children: [
          Expanded(
            child: TextFormField(
              initialValue: ingredient.name,
              decoration: const InputDecoration(labelText: '재료명'),
              onChanged: (name) => notifier.updateIngredient(
                  index, ingredient.copyWith(name: name)),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              initialValue: ingredient.quantity.toString(),
              decoration: const InputDecoration(labelText: '양'),
              keyboardType: TextInputType.number,
              onChanged: (qty) => notifier.updateIngredient(
                  index, ingredient.copyWith(quantity: double.tryParse(qty) ?? 0)),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              initialValue: ingredient.unit,
              decoration: const InputDecoration(labelText: '단위'),
              onChanged: (unit) => notifier.updateIngredient(
                  index, ingredient.copyWith(unit: unit)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () => notifier.removeIngredient(index),
          ),
        ],
      );
    });
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
