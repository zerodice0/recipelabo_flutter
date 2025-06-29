import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saucerer_flutter/domain/entities/step_entity.dart';

part 'step_model.freezed.dart';
part 'step_model.g.dart';

/// 레시피 조리 단계 모델
@freezed
class StepModel with _$StepModel {
  const factory StepModel({
    required String id,
    String? recipeVersionId,
    required int stepNumber,
    required String description,
    String? imageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDeleted,
  }) = _StepModel;

  factory StepModel.fromJson(Map<String, dynamic> json) =>
      _$StepModelFromJson(json);

}

/// StepModel을 위한 SQLite 매핑 확장
extension StepModelExtension on StepModel {
  /// SQLite 데이터베이스용 Map으로 변환
  /// boolean 값은 정수로, DateTime은 ISO8601 문자열로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'recipeVersionId': recipeVersionId,
      'stepNumber': stepNumber,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isDeleted': isDeleted ? 1 : 0,
    };
  }

  /// SQLite 데이터베이스의 Map에서 객체 생성
  /// 정수를 boolean으로, 문자열을 DateTime으로 변환
  static StepModel fromMap(Map<String, dynamic> map) {
    return StepModel(
      id: map['id'] as String,
      recipeVersionId: map['recipeVersionId'] as String?,
      stepNumber: map['stepNumber'] as int,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String?,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      isDeleted: (map['isDeleted'] as int) == 1,
    );
  }

  /// Entity로 변환
  StepEntity toEntity() {
    return StepEntity(
      id: id,
      stepNumber: stepNumber,
      description: description,
      imageUrl: imageUrl,
    );
  }

}

/// StepModel Entity 변환 확장
extension StepModelEntityExtension on StepModel {
  /// Entity에서 변환
  static StepModel fromEntity(StepEntity entity) {
    final now = DateTime.now();
    return StepModel(
      id: entity.id,
      stepNumber: entity.stepNumber,
      description: entity.description,
      imageUrl: entity.imageUrl,
      createdAt: now,
      updatedAt: now,
    );
  }
}
