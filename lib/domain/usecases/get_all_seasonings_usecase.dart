import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saucerer_flutter/core/di/provider.dart';
import 'package:saucerer_flutter/domain/entities/seasoning_entity.dart';
import 'package:saucerer_flutter/domain/repositories/seasoning_repository.dart';

part 'get_all_seasonings_usecase.g.dart';

class GetAllSeasoningsUseCase {
  final SeasoningRepository repository;

  GetAllSeasoningsUseCase(this.repository);

  Future<List<SeasoningEntity>> call() async {
    return await repository.getAllSeasonings();
  }
}

@riverpod
GetAllSeasoningsUseCase getAllSeasoningsUseCase(Ref ref) {
  return GetAllSeasoningsUseCase(ref.watch(seasoningRepositoryProvider));
}