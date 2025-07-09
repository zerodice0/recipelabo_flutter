import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

/// 카테고리 엔티티
///
/// 사전 정의된 카테고리와 사용자 정의 카테고리를 모두 지원하는 Value Object
@freezed
abstract class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required String id,
    required String name,
    required String displayName,
    String? description,
    String? iconCode, // Material Icons 코드
    String? colorCode, // 색상 코드 (선택적)
    required CategoryType type,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(0) int usageCount,
    @Default(true) bool isActive,
  }) = _CategoryEntity;

  const CategoryEntity._();

  /// 사전 정의된 카테고리인지 확인
  bool get isPredefined => type == CategoryType.predefined;

  /// 사용자 정의 카테고리인지 확인
  bool get isCustom => type == CategoryType.custom;

  /// 카테고리 표시명 (다국어 지원 시 사용)
  String get localizedName => displayName;
}

/// 카테고리 타입
enum CategoryType {
  /// 사전 정의된 카테고리 (시스템 제공)
  predefined,

  /// 사용자 정의 카테고리
  custom,
}

/// 사전 정의된 카테고리 상수
class PredefinedCategories {
  static final CategoryEntity ingredient = CategoryEntity(
    id: 'ingredient',
    name: 'ingredient',
    displayName: '재료',
    description: '요리에 사용되는 재료들',
    iconCode: 'restaurant',
    type: CategoryType.predefined,
    createdAt: DateTime.parse(_defaultDateTimeString),
    updatedAt: DateTime.parse(_defaultDateTimeString),
  );

  static final CategoryEntity unit = CategoryEntity(
    id: 'unit',
    name: 'unit',
    displayName: '단위',
    description: '계량 단위들',
    iconCode: 'straighten',
    type: CategoryType.predefined,
    createdAt: DateTime.parse(_defaultDateTimeString),
    updatedAt: DateTime.parse(_defaultDateTimeString),
  );

  static final CategoryEntity seasoning = CategoryEntity(
    id: 'seasoning',
    name: 'seasoning',
    displayName: '양념',
    description: '조미료 및 향신료',
    iconCode: 'spa',
    type: CategoryType.predefined,
    createdAt: DateTime.parse(_defaultDateTimeString),
    updatedAt: DateTime.parse(_defaultDateTimeString),
  );

  static final CategoryEntity vegetable = CategoryEntity(
    id: 'vegetable',
    name: 'vegetable',
    displayName: '채소',
    description: '채소류',
    iconCode: 'eco',
    type: CategoryType.predefined,
    createdAt: DateTime.parse(_defaultDateTimeString),
    updatedAt: DateTime.parse(_defaultDateTimeString),
  );

  static final CategoryEntity meat = CategoryEntity(
    id: 'meat',
    name: 'meat',
    displayName: '육류',
    description: '고기류',
    iconCode: 'food_bank',
    type: CategoryType.predefined,
    createdAt: DateTime.parse(_defaultDateTimeString),
    updatedAt: DateTime.parse(_defaultDateTimeString),
  );

  static final CategoryEntity seafood = CategoryEntity(
    id: 'seafood',
    name: 'seafood',
    displayName: '해산물',
    description: '생선 및 해산물',
    iconCode: 'phishing',
    type: CategoryType.predefined,
    createdAt: DateTime.parse(_defaultDateTimeString),
    updatedAt: DateTime.parse(_defaultDateTimeString),
  );

  static final CategoryEntity dairy = CategoryEntity(
    id: 'dairy',
    name: 'dairy',
    displayName: '유제품',
    description: '우유, 치즈, 버터 등',
    iconCode: 'local_drink',
    type: CategoryType.predefined,
    createdAt: DateTime.parse(_defaultDateTimeString),
    updatedAt: DateTime.parse(_defaultDateTimeString),
  );

  static final CategoryEntity grain = CategoryEntity(
    id: 'grain',
    name: 'grain',
    displayName: '곡물',
    description: '쌀, 밀가루, 면류 등',
    iconCode: 'grain',
    type: CategoryType.predefined,
    createdAt: DateTime.parse(_defaultDateTimeString),
    updatedAt: DateTime.parse(_defaultDateTimeString),
  );

  /// 모든 사전 정의된 카테고리 목록
  static final List<CategoryEntity> all = [
    ingredient,
    unit,
    seasoning,
    vegetable,
    meat,
    seafood,
    dairy,
    grain,
  ];

  /// 카테고리 ID로 찾기
  static CategoryEntity? findById(String id) {
    try {
      return all.firstWhere((category) => category.id == id);
    } catch (e) {
      return null;
    }
  }

  /// 카테고리 이름으로 찾기
  static CategoryEntity? findByName(String name) {
    try {
      return all.firstWhere((category) => category.name == name);
    } catch (e) {
      return null;
    }
  }
}

// 기본 DateTime 문자열
const String _defaultDateTimeString = '2024-01-01T00:00:00.000Z';
