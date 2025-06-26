import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saucerer_flutter/core/di/provider.dart';
import 'package:saucerer_flutter/domain/entities/seasoning_entity.dart';
import 'package:saucerer_flutter/domain/repositories/seasoning_repository.dart';

part 'search_seasonings_usecase.g.dart';

class SearchSeasoningsUseCase {
  final SeasoningRepository repository;

  SearchSeasoningsUseCase(this.repository);

  Future<List<SeasoningEntity>> call(String query) async {
    if (query.trim().isEmpty) {
      return await repository.getPopularSeasonings();
    }
    return await repository.searchSeasonings(query.trim());
  }
}

@riverpod
SearchSeasoningsUseCase searchSeasoningsUseCase(Ref ref) {
  return SearchSeasoningsUseCase(ref.watch(seasoningRepositoryProvider));
}