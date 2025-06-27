import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saucerer_flutter/domain/entities/recipe_entity.dart';
import 'package:saucerer_flutter/domain/entities/recipe_version_entity.dart';
import 'package:saucerer_flutter/domain/usecases/get_recipe_with_versions_usecase.dart';

part 'recipe_detail_viewmodel.g.dart';

@riverpod
Future<(RecipeEntity, List<RecipeVersionEntity>)> recipeDetailViewModel(
  Ref ref,
  String recipeId,
) async {
  final useCase = ref.watch(getRecipeWithVersionsUseCaseProvider);
  final result = await useCase(recipeId);
  final recipe = result.$1;
  final versions = result.$2;

  if (recipe == null) {
    throw Exception('레시피를 찾을 수 없습니다.');
  }

  return (recipe, versions);
}
