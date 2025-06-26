import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saucerer_flutter/domain/entities/recipe_entity.dart';
import 'package:saucerer_flutter/domain/usecases/get_recipes_usecase.dart';

part 'recipe_list_viewmodel.g.dart';

@riverpod
class RecipeListViewModel extends _$RecipeListViewModel {
  @override
  Future<List<RecipeEntity>> build() async {
    // build 메서드가 처음 호출될 때 레시피 목록을 가져옵니다.
    return _fetchRecipes();
  }

  Future<List<RecipeEntity>> _fetchRecipes() {
    final getRecipes = ref.read(getRecipesUseCaseProvider);
    return getRecipes();
  }

  /// 레시피 목록을 새로고침합니다.
  Future<void> refresh() async {
    // 상태를 로딩으로 설정하고 다시 데이터를 가져옵니다.
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchRecipes());
  }
}
