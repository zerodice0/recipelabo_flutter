import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saucerer_flutter/core/di/provider.dart';
import 'package:saucerer_flutter/domain/repositories/seasoning_repository.dart';

part 'delete_seasoning_usecase.g.dart';

class DeleteSeasoningUseCase {
  final SeasoningRepository repository;

  DeleteSeasoningUseCase(this.repository);

  Future<void> call(String id) async {
    await repository.deleteSeasoning(id);
  }
}

@riverpod
DeleteSeasoningUseCase deleteSeasoningUseCase(Ref ref) {
  return DeleteSeasoningUseCase(ref.watch(seasoningRepositoryProvider));
}