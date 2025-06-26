import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_model.freezed.dart';
part 'ingredient_model.g.dart';

/// 레시피 재료 모델
@freezed
class IngredientModel with _$IngredientModel {
  const factory IngredientModel({
    required String id,
    String? recipeVersionId,
    required String name,
    required double quantity,
    required String unit,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDeleted,
  }) = _IngredientModel;

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);

}

/// IngredientModel을 위한 SQLite 매핑 확장
extension IngredientModelExtension on IngredientModel {
  /// SQLite 데이터베이스용 Map으로 변환
  /// boolean 값은 정수로, DateTime은 ISO8601 문자열로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'recipeVersionId': recipeVersionId,
      'name': name,
      'quantity': quantity,
      'unit': unit,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isDeleted': isDeleted ? 1 : 0,
    };
  }

  /// SQLite 데이터베이스의 Map에서 객체 생성
  /// 정수를 boolean으로, 문자열을 DateTime으로 변환
  static IngredientModel fromMap(Map<String, dynamic> map) {
    return IngredientModel(
      id: map['id'] as String,
      recipeVersionId: map['recipeVersionId'] as String?,
      name: map['name'] as String,
      quantity: (map['quantity'] as num).toDouble(),
      unit: map['unit'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      isDeleted: (map['isDeleted'] as int) == 1,
    );
  }
}
