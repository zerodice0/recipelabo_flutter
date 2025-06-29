import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saucerer_flutter/domain/entities/seasoning_entity.dart';

part 'seasoning_model.freezed.dart';
part 'seasoning_model.g.dart';

@freezed
class SeasoningModel with _$SeasoningModel {
  const factory SeasoningModel({
    required String id,
    required String name,
    required String categoryId,
    String? category, // 마이그레이션 기간 동안 임시 유지
    String? subCategory, // 세부 카테고리
    String? description,
    required String createdAt,
    required String updatedAt,
    @Default(0) int usageCount,
  }) = _SeasoningModel;

  factory SeasoningModel.fromJson(Map<String, dynamic> json) => _$SeasoningModelFromJson(json);
}

extension SeasoningModelX on SeasoningModel {
  SeasoningEntity toEntity() {
    return SeasoningEntity(
      id: id,
      name: name,
      categoryId: categoryId,
      subCategory: subCategory,
      description: description,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      usageCount: usageCount,
    );
  }

  static SeasoningModel fromEntity(SeasoningEntity entity) {
    return SeasoningModel(
      id: entity.id,
      name: entity.name,
      categoryId: entity.categoryId,
      subCategory: entity.subCategory,
      description: entity.description,
      createdAt: entity.createdAt.toIso8601String(),
      updatedAt: entity.updatedAt.toIso8601String(),
      usageCount: entity.usageCount,
    );
  }

  Map<String, dynamic> toSqlMap() {
    return {
      'id': id,
      'name': name,
      'category_id': categoryId,
      'category': category, // 임시 유지
      'sub_category': subCategory,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'usage_count': usageCount,
    };
  }

  static SeasoningModel fromSqlMap(Map<String, dynamic> map) {
    // 마이그레이션을 위해 category_id가 없으면 category 값 사용
    String categoryId = map['category_id'] as String? ?? 
                      _mapLegacyCategoryToId(map['category'] as String?);
    
    return SeasoningModel(
      id: map['id'] as String,
      name: map['name'] as String,
      categoryId: categoryId,
      category: map['category'] as String?,
      subCategory: map['sub_category'] as String?,
      description: map['description'] as String?,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
      usageCount: map['usage_count'] as int? ?? 0,
    );
  }

  // 기존 카테고리 문자열을 새로운 ID로 매핑
  static String _mapLegacyCategoryToId(String? category) {
    if (category == null) return 'ingredient'; // 기본값
    
    switch (category) {
      case '재료':
        return 'ingredient';
      case '단위':
        return 'unit';
      case '양념':
        return 'seasoning';
      case '채소':
        return 'vegetable';
      case '육류':
        return 'meat';
      case '해산물':
        return 'seafood';
      case '유제품':
        return 'dairy';
      case '곡물':
        return 'grain';
      default:
        return 'ingredient'; // 알 수 없는 카테고리는 기본값
    }
  }
}