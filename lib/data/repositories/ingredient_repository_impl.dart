import 'package:recipick_flutter/data/datasources/local/ingredient_local_data_source.dart';
import 'package:recipick_flutter/domain/entities/recipe_entity.dart';
import 'package:recipick_flutter/domain/repositories/ingredient_repository.dart';
import 'package:recipick_flutter/data/repositories/recipe_repository_impl.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  final IngredientLocalDataSource localDataSource;

  IngredientRepositoryImpl({required this.localDataSource});

  @override
  Future<List<String>> getAllUniqueIngredientNames() async {
    final ingredientNames = await localDataSource.getAllUniqueIngredientNames();
    return ingredientNames;
  }

  @override
  Future<List<RecipeEntity>> getRecipesByIngredients(
    List<String> ingredientNames,
  ) async {
    final recipeModels = await localDataSource.getRecipesByIngredients(
      ingredientNames,
    );
    return recipeModels
        .map((model) => RecipeRepositoryImpl.mapRecipeModelToEntity(model))
        .toList();
  }

  @override
  Future<List<String>> searchIngredientsByName(String query) async {
    final ingredientNames = await localDataSource.searchIngredientsByName(
      query,
    );
    return ingredientNames;
  }

  @override
  Future<List<String>> getPopularIngredients({int limit = 20}) async {
    final popularIngredients = await localDataSource.getPopularIngredients(
      limit: limit,
    );
    return popularIngredients;
  }
}
