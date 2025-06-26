import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saucerer_flutter/data/datasources/local/database_helper.dart';
import 'package:saucerer_flutter/data/datasources/local/recipe_local_data_source.dart';
import 'package:saucerer_flutter/data/datasources/local/cooking_log_local_data_source.dart';
import 'package:saucerer_flutter/data/datasources/local/ingredient_local_data_source.dart';
import 'package:saucerer_flutter/data/datasources/local/seasoning_local_data_source.dart';
import 'package:saucerer_flutter/data/repositories/recipe_repository_impl.dart';
import 'package:saucerer_flutter/data/repositories/cooking_log_repository_impl.dart';
import 'package:saucerer_flutter/data/repositories/ingredient_repository_impl.dart';
import 'package:saucerer_flutter/data/repositories/seasoning_repository_impl.dart';
import 'package:saucerer_flutter/domain/repositories/recipe_repository.dart';
import 'package:saucerer_flutter/domain/repositories/cooking_log_repository.dart';
import 'package:saucerer_flutter/domain/repositories/ingredient_repository.dart';
import 'package:saucerer_flutter/domain/repositories/seasoning_repository.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
DatabaseHelper databaseHelper(Ref ref) {
  return DatabaseHelper();
}

@Riverpod(keepAlive: true)
RecipeLocalDataSource recipeLocalDataSource(Ref ref) {
  return RecipeLocalDataSourceImpl(ref.watch(databaseHelperProvider));
}

@Riverpod(keepAlive: true)
RecipeRepository recipeRepository(Ref ref) {
  return RecipeRepositoryImpl(localDataSource: ref.watch(recipeLocalDataSourceProvider));
}

@Riverpod(keepAlive: true)
CookingLogLocalDataSource cookingLogLocalDataSource(Ref ref) {
  return CookingLogLocalDataSourceImpl(ref.watch(databaseHelperProvider));
}

@Riverpod(keepAlive: true)
CookingLogRepository cookingLogRepository(Ref ref) {
  return CookingLogRepositoryImpl(localDataSource: ref.watch(cookingLogLocalDataSourceProvider));
}

@Riverpod(keepAlive: true)
IngredientLocalDataSource ingredientLocalDataSource(Ref ref) {
  return IngredientLocalDataSourceImpl(ref.watch(databaseHelperProvider));
}

@Riverpod(keepAlive: true)
IngredientRepository ingredientRepository(Ref ref) {
  return IngredientRepositoryImpl(localDataSource: ref.watch(ingredientLocalDataSourceProvider));
}

@Riverpod(keepAlive: true)
SeasoningLocalDataSource seasoningLocalDataSource(Ref ref) {
  return SeasoningLocalDataSourceImpl(ref.watch(databaseHelperProvider));
}

@Riverpod(keepAlive: true)
SeasoningRepository seasoningRepository(Ref ref) {
  return SeasoningRepositoryImpl(localDataSource: ref.watch(seasoningLocalDataSourceProvider));
}
