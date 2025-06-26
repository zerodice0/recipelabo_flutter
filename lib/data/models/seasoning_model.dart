import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saucerer_flutter/domain/entities/seasoning_entity.dart';

part 'seasoning_model.freezed.dart';
part 'seasoning_model.g.dart';

@freezed
class SeasoningModel with _$SeasoningModel {
  const factory SeasoningModel({
    required String id,
    required String name,
    String? category,
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
      category: category,
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
      category: entity.category,
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
      'category': category,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'usage_count': usageCount,
    };
  }

  static SeasoningModel fromSqlMap(Map<String, dynamic> map) {
    return SeasoningModel(
      id: map['id'] as String,
      name: map['name'] as String,
      category: map['category'] as String?,
      description: map['description'] as String?,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
      usageCount: map['usage_count'] as int? ?? 0,
    );
  }
}