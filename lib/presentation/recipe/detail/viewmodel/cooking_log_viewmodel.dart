import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saucerer_flutter/domain/entities/cooking_log_entity.dart';
import 'package:saucerer_flutter/domain/usecases/get_cooking_logs_usecase.dart';

part 'cooking_log_viewmodel.g.dart';

@riverpod
Future<List<CookingLogEntity>> cookingLogViewModel(
  Ref ref,
  String recipeVersionId,
) async {
  final useCase = ref.watch(getCookingLogsUseCaseProvider);
  return await useCase(recipeVersionId);
}
