import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saucerer_flutter/domain/entities/ingredient_entity.dart';
import 'package:saucerer_flutter/domain/entities/step_entity.dart';

part 'recipe_version_entity.freezed.dart';

/// 레시피 버전 엔티티
@freezed
class RecipeVersionEntity with _$RecipeVersionEntity {
  const factory RecipeVersionEntity({
    required String id,
    required String recipeId,
    required int versionNumber,
    required String name, // 레시피 이름 (모든 버전에서 동일)
    String? versionName, // 사용자 정의 버전명 (예: "라볶이", "설탕 대체제")
    required String description,
    required List<IngredientEntity> ingredients,
    required List<StepEntity> steps,
    required String authorId,
    required DateTime createdAt,
    String? changeLog,
    String? baseVersionId, // 기반이 된 버전의 ID
  }) = _RecipeVersionEntity;

  const RecipeVersionEntity._();

  /// 표시용 버전명 반환 (versionName이 있으면 사용, 없으면 기본 형식)
  String get displayName {
    if (versionName != null && versionName!.isNotEmpty) {
      return versionName!;
    }
    return 'v$versionNumber';
  }

  /// 풀 버전 표시명 (버전 번호 + 사용자 정의명)
  String get fullDisplayName {
    if (versionName != null && versionName!.isNotEmpty) {
      return 'v$versionNumber - $versionName';
    }
    return 'v$versionNumber';
  }
}
