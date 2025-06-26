import 'package:freezed_annotation/freezed_annotation.dart';

part 'cooking_log_entity.freezed.dart';

/// 쿠킹 로그 엔티티
@freezed
class CookingLogEntity with _$CookingLogEntity {
  const factory CookingLogEntity({
    required String id,
    required String recipeVersionId,
    required String authorId,
    required String title,
    String? memo,
    String? imageUrl,
    required DateTime cookedAt,
    required DateTime createdAt,
  }) = _CookingLogEntity;
}