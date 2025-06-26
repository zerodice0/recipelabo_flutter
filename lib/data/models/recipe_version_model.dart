import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saucerer_flutter/data/models/ingredient_model.dart';
import 'package:saucerer_flutter/data/models/step_model.dart';

part 'recipe_version_model.freezed.dart';
part 'recipe_version_model.g.dart';

/// 레시피의 특정 버전 모델
@freezed
class RecipeVersionModel with _$RecipeVersionModel {
  const factory RecipeVersionModel({
    required String id,
    required String recipeId,
    required int versionNumber,
    required String name,
    required String description,
    required List<IngredientModel> ingredients,
    required List<StepModel> steps,
    required String authorId,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDeleted,
  }) = _RecipeVersionModel;

  factory RecipeVersionModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeVersionModelFromJson(json);
}

/// RecipeVersionModel을 위한 SQLite 매핑 확장
extension RecipeVersionModelExtension on RecipeVersionModel {
  /// SQLite 데이터베이스용 Map으로 변환
  /// boolean 값은 정수로, DateTime은 ISO8601 문자열로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'recipeId': recipeId,
      'versionNumber': versionNumber,
      'name': name,
      'description': description,
      'authorId': authorId,
      'createdAt': createdAt.toIso8601String(),
      'isDeleted': isDeleted ? 1 : 0,
    };
  }

  /// SQLite 데이터베이스의 Map에서 객체 생성
  static RecipeVersionModel fromMap(Map<String, dynamic> map) {
    return RecipeVersionModel(
      id: map['id'],
      recipeId: map['recipeId'],
      versionNumber: map['versionNumber'],
      name: map['name'],
      description: map['description'],
      ingredients: [], // 별도로 로드
      steps: [], // 별도로 로드
      authorId: map['authorId'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.now(), // 임시
      isDeleted: map['isDeleted'] == 1,
    );
  }
}
