import 'package:freezed_annotation/freezed_annotation.dart';

part 'cooking_log_model.freezed.dart';
part 'cooking_log_model.g.dart';

/// 쿠킹 로그 데이터 모델
@freezed
abstract class CookingLogModel with _$CookingLogModel {
  const factory CookingLogModel({
    required String id,
    required String recipeVersionId,
    required String authorId,
    required String title,
    String? memo,
    String? base64EncodedImageData,
    required DateTime cookedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDeleted,
  }) = _CookingLogModel;

  factory CookingLogModel.fromJson(Map<String, dynamic> json) =>
      _$CookingLogModelFromJson(json);
}

extension CookingLogModelExtension on CookingLogModel {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'recipeVersionId': recipeVersionId,
      'authorId': authorId,
      'title': title,
      'memo': memo,
      'base64EncodedImageData': base64EncodedImageData,
      'cookedAt': cookedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isDeleted': isDeleted ? 1 : 0,
    };
  }

  static CookingLogModel fromMap(Map<String, dynamic> map) {
    return CookingLogModel(
      id: map['id'] as String,
      recipeVersionId: map['recipeVersionId'] as String,
      authorId: map['authorId'] as String,
      title: map['title'] as String,
      memo: map['memo'] as String?,
      base64EncodedImageData: map['base64EncodedImageData'] as String?,
      cookedAt: DateTime.parse(map['cookedAt'] as String),
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      isDeleted: (map['isDeleted'] as int) == 1,
    );
  }
}
