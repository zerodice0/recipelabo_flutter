import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_entity.freezed.dart';

/// 레시피 기본 엔티티
@freezed
class RecipeEntity with _$RecipeEntity {
  const factory RecipeEntity({
    required String id,
    required String authorId,
    required String latestVersionId,
    required String name,
    String? description,
    required bool isPublic,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _RecipeEntity;
}
