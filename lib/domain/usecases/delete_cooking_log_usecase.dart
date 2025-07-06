import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipick_flutter/domain/repositories/cooking_log_repository.dart';
import 'package:recipick_flutter/core/di/provider.dart';

part 'delete_cooking_log_usecase.g.dart';

class DeleteCookingLogUseCase {
  final CookingLogRepository _repository;

  DeleteCookingLogUseCase(this._repository);

  Future<void> call(String id) {
    return _repository.deleteCookingLog(id);
  }
}

@riverpod
DeleteCookingLogUseCase deleteCookingLogUseCase(Ref ref) {
  final repository = ref.watch(cookingLogRepositoryProvider);
  return DeleteCookingLogUseCase(repository);
}
