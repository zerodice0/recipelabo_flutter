import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_entity.freezed.dart';

/// 레시피 조리 단계 엔티티
@freezed
class StepEntity with _$StepEntity {
  const factory StepEntity({
    required String id,
    String? recipeVersionId,
    required int stepNumber,
    required String description,
    String? imageUrl,
  }) = _StepEntity;
}
