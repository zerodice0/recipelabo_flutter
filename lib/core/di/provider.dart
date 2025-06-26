import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saucerer_flutter/data/datasources/local/database_helper.dart';
import 'package:saucerer_flutter/data/datasources/local/recipe_local_data_source.dart';
import 'package:saucerer_flutter/data/repositories/recipe_repository_impl.dart';
import 'package:saucerer_flutter/domain/repositories/recipe_repository.dart';

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
