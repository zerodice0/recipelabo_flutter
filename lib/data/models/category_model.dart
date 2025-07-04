import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String name,
    required String displayName,
    String? description,
    String? iconCode,
    String? colorCode,
    required String type, // 'predefined' or 'custom'
    required String createdAt,
    required String updatedAt,
    @Default(0) int usageCount,
    @Default(true) bool isActive,
  }) = _CategoryModel;

  const CategoryModel._();

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  /// Entity로 변환
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      displayName: displayName,
      description: description,
      iconCode: iconCode,
      colorCode: colorCode,
      type:
          type == 'predefined' ? CategoryType.predefined : CategoryType.custom,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      usageCount: usageCount,
      isActive: isActive,
    );
  }

  /// Entity에서 변환
  static CategoryModel fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      displayName: entity.displayName,
      description: entity.description,
      iconCode: entity.iconCode,
      colorCode: entity.colorCode,
      type: entity.type == CategoryType.predefined ? 'predefined' : 'custom',
      createdAt: entity.createdAt.toIso8601String(),
      updatedAt: entity.updatedAt.toIso8601String(),
      usageCount: entity.usageCount,
      isActive: entity.isActive,
    );
  }

  /// 데이터베이스 Map으로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'display_name': displayName,
      'description': description,
      'icon_code': iconCode,
      'color_code': colorCode,
      'type': type,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'usage_count': usageCount,
      'is_active': isActive ? 1 : 0,
    };
  }

  /// 데이터베이스 Map에서 변환
  static CategoryModel fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      displayName: map['display_name'] as String,
      description: map['description'] as String?,
      iconCode: map['icon_code'] as String?,
      colorCode: map['color_code'] as String?,
      type: map['type'] as String,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
      usageCount: map['usage_count'] as int? ?? 0,
      isActive: (map['is_active'] as int?) == 1,
    );
  }
}
