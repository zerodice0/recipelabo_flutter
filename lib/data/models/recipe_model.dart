import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

/// 레시피 기본 모델 (버전들을 포함)
@freezed
abstract class RecipeModel with _$RecipeModel {
  const factory RecipeModel({
    required String id,
    required String authorId,
    required String latestVersionId,
    required String name,
    String? description,
    @Default(true) bool isPublic,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDeleted,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
}

extension RecipeModelExtension on RecipeModel {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'authorId': authorId,
      'latestVersionId': latestVersionId,
      'name': name,
      'description': description,
      'isPublic': isPublic ? 1 : 0,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isDeleted': isDeleted ? 1 : 0,
    };
  }

  static RecipeModel fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['id'],
      authorId: map['authorId'],
      latestVersionId: map['latestVersionId'],
      name: map['name'],
      description: map['description'],
      isPublic: map['isPublic'] == 1,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      isDeleted: map['isDeleted'] == 1,
    );
  }
}
