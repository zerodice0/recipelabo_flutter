import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saucerer_flutter/domain/entities/cooking_log_entity.dart';
import 'package:saucerer_flutter/domain/repositories/cooking_log_repository.dart';
import 'package:saucerer_flutter/core/di/provider.dart';

part 'get_cooking_logs_usecase.g.dart';

class GetCookingLogsUseCase {
  final CookingLogRepository _repository;

  GetCookingLogsUseCase(this._repository);

  Future<List<CookingLogEntity>> call(String recipeVersionId) {
    return _repository.getCookingLogsForRecipeVersion(recipeVersionId);
  }
}

@riverpod
GetCookingLogsUseCase getCookingLogsUseCase(Ref ref) {
  final repository = ref.watch(cookingLogRepositoryProvider);
  return GetCookingLogsUseCase(repository);
}