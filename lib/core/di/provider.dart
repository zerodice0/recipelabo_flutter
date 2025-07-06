import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipick_flutter/data/datasources/local/database_helper.dart';
import 'package:recipick_flutter/data/datasources/local/recipe_local_data_source.dart';
import 'package:recipick_flutter/data/datasources/local/cooking_log_local_data_source.dart';
import 'package:recipick_flutter/data/datasources/local/ingredient_local_data_source.dart';
import 'package:recipick_flutter/data/datasources/local/seasoning_local_data_source.dart';
import 'package:recipick_flutter/data/datasources/local/timer_preset_datasource.dart';
import 'package:recipick_flutter/data/repositories/recipe_repository_impl.dart';
import 'package:recipick_flutter/data/repositories/cooking_log_repository_impl.dart';
import 'package:recipick_flutter/data/repositories/ingredient_repository_impl.dart';
import 'package:recipick_flutter/data/repositories/ingredient_master_repository_impl.dart';
import 'package:recipick_flutter/data/repositories/timer_preset_repository_impl.dart';
import 'package:recipick_flutter/domain/repositories/recipe_repository.dart';
import 'package:recipick_flutter/domain/repositories/cooking_log_repository.dart';
import 'package:recipick_flutter/domain/repositories/ingredient_repository.dart';
import 'package:recipick_flutter/domain/repositories/ingredient_master_repository.dart';
import 'package:recipick_flutter/domain/repositories/timer_preset_repository.dart';
import 'package:recipick_flutter/domain/usecases/timer_preset/get_all_presets_usecase.dart';
import 'package:recipick_flutter/domain/usecases/timer_preset/save_custom_preset_usecase.dart';
import 'package:recipick_flutter/domain/usecases/timer_preset/delete_custom_preset_usecase.dart';
import 'package:recipick_flutter/domain/usecases/timer_preset/increment_preset_usage_usecase.dart';

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
  return RecipeRepositoryImpl(
    localDataSource: ref.watch(recipeLocalDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
CookingLogLocalDataSource cookingLogLocalDataSource(Ref ref) {
  return CookingLogLocalDataSourceImpl(ref.watch(databaseHelperProvider));
}

@Riverpod(keepAlive: true)
CookingLogRepository cookingLogRepository(Ref ref) {
  return CookingLogRepositoryImpl(
    localDataSource: ref.watch(cookingLogLocalDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
IngredientLocalDataSource ingredientLocalDataSource(Ref ref) {
  return IngredientLocalDataSourceImpl(ref.watch(databaseHelperProvider));
}

@Riverpod(keepAlive: true)
IngredientRepository ingredientRepository(Ref ref) {
  return IngredientRepositoryImpl(
    localDataSource: ref.watch(ingredientLocalDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
SeasoningLocalDataSource seasoningLocalDataSource(Ref ref) {
  return SeasoningLocalDataSourceImpl(ref.watch(databaseHelperProvider));
}

@Riverpod(keepAlive: true)
IngredientMasterRepository ingredientMasterRepository(Ref ref) {
  return IngredientMasterRepositoryImpl(
    localDataSource: ref.watch(seasoningLocalDataSourceProvider),
  );
}

// Timer Preset providers
@Riverpod(keepAlive: true)
TimerPresetDatasource timerPresetDatasource(Ref ref) {
  return TimerPresetDatasource(ref.watch(databaseHelperProvider));
}

@Riverpod(keepAlive: true)
TimerPresetRepository timerPresetRepository(Ref ref) {
  return TimerPresetRepositoryImpl(ref.watch(timerPresetDatasourceProvider));
}

@Riverpod(keepAlive: true)
GetAllPresetsUsecase getAllPresetsUsecase(Ref ref) {
  return GetAllPresetsUsecase(ref.watch(timerPresetRepositoryProvider));
}

@Riverpod(keepAlive: true)
SaveCustomPresetUsecase saveCustomPresetUsecase(Ref ref) {
  return SaveCustomPresetUsecase(ref.watch(timerPresetRepositoryProvider));
}

@Riverpod(keepAlive: true)
DeleteCustomPresetUsecase deleteCustomPresetUsecase(Ref ref) {
  return DeleteCustomPresetUsecase(ref.watch(timerPresetRepositoryProvider));
}

@Riverpod(keepAlive: true)
IncrementPresetUsageUsecase incrementPresetUsageUsecase(Ref ref) {
  return IncrementPresetUsageUsecase(ref.watch(timerPresetRepositoryProvider));
}
