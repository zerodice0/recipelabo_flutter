import 'package:freezed_annotation/freezed_annotation.dart';

part 'cooking_log_entity.freezed.dart';

/// 쿠킹 로그 엔티티
@freezed
abstract class CookingLogEntity with _$CookingLogEntity {
  const factory CookingLogEntity({
    required String id,
    required String recipeVersionId,
    required String authorId,
    required String title,
    String? memo,
    String? base64EncodedImageData, // Base64 인코딩된 이미지 데이터
    required DateTime cookedAt,
    required DateTime createdAt,
  }) = _CookingLogEntity;
}
