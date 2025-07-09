import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipick_flutter/data/models/ingredient_model.dart';
import 'package:recipick_flutter/data/models/step_model.dart';
import 'package:recipick_flutter/domain/entities/recipe_version_entity.dart';

part 'recipe_version_model.freezed.dart';
part 'recipe_version_model.g.dart';

/// 레시피의 특정 버전 모델
@freezed
abstract class RecipeVersionModel with _$RecipeVersionModel {
  const factory RecipeVersionModel({
    required String id,
    required String recipeId,
    required int versionNumber,
    required String name,
    String? versionName, // 사용자 정의 버전명
    required String description,
    required List<IngredientModel> ingredients,
    required List<StepModel> steps,
    required String authorId,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDeleted,
    String? changeLog,
    String? baseVersionId, // 기반이 된 버전의 ID
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
      'versionName': versionName, // 사용자 정의 버전명 추가
      'description': description,
      'authorId': authorId,
      'createdAt': createdAt.toIso8601String(),
      'isDeleted': isDeleted ? 1 : 0,
      'changeLog': changeLog,
      'baseVersionId': baseVersionId, // 기반 버전 ID 추가
    };
  }

  /// SQLite 데이터베이스의 Map에서 객체 생성
  static RecipeVersionModel fromMap(Map<String, dynamic> map) {
    return RecipeVersionModel(
      id: map['id'],
      recipeId: map['recipeId'],
      versionNumber: map['versionNumber'],
      name: map['name'],
      versionName: map['versionName'], // 사용자 정의 버전명 추가
      description: map['description'],
      ingredients: [], // 별도로 로드
      steps: [], // 별도로 로드
      authorId: map['authorId'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.now(), // 임시
      isDeleted: map['isDeleted'] == 1,
      changeLog: map['changeLog'],
      baseVersionId: map['baseVersionId'], // 기반 버전 ID 추가
    );
  }

  /// Entity로 변환
  RecipeVersionEntity toEntity() {
    return RecipeVersionEntity(
      id: id,
      recipeId: recipeId,
      versionNumber: versionNumber,
      name: name,
      versionName: versionName,
      description: description,
      ingredients: ingredients.map((e) => e.toEntity()).toList(),
      steps: steps.map((e) => e.toEntity()).toList(),
      authorId: authorId,
      createdAt: createdAt,
      changeLog: changeLog,
      baseVersionId: baseVersionId, // 기반 버전 ID 추가
    );
  }

  /// Entity에서 변환
  static RecipeVersionModel fromEntity(
    RecipeVersionEntity entity,
    DateTime updatedAt,
  ) {
    return RecipeVersionModel(
      id: entity.id,
      recipeId: entity.recipeId,
      versionNumber: entity.versionNumber,
      name: entity.name,
      versionName: entity.versionName,
      description: entity.description,
      ingredients: entity.ingredients
          .map((e) => IngredientModelEntityExtension.fromEntity(e))
          .toList(),
      steps: entity.steps
          .map((e) => StepModelEntityExtension.fromEntity(e))
          .toList(),
      authorId: entity.authorId,
      createdAt: entity.createdAt,
      updatedAt: updatedAt,
      changeLog: entity.changeLog,
      baseVersionId: entity.baseVersionId, // 기반 버전 ID 추가
    );
  }
}
