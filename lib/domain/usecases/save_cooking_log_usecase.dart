import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/entities/cooking_log_entity.dart';
import 'package:recipick_flutter/domain/repositories/cooking_log_repository.dart';
import 'package:recipick_flutter/core/di/provider.dart';

part 'save_cooking_log_usecase.g.dart';

class SaveCookingLogUseCase {
  final CookingLogRepository _repository;

  SaveCookingLogUseCase(this._repository);

  Future<void> call(CookingLogEntity cookingLog) {
    return _repository.saveCookingLog(cookingLog);
  }
}

@riverpod
SaveCookingLogUseCase saveCookingLogUseCase(Ref ref) {
  final repository = ref.watch(cookingLogRepositoryProvider);
  return SaveCookingLogUseCase(repository);
}
