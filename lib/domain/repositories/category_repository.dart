import '../entities/category_entity.dart';

/// 카테고리 데이터 접근을 위한 리포지토리 인터페이스
abstract class CategoryRepository {
  /// 모든 카테고리 조회 (사전 정의 + 사용자 정의)
  Future<List<CategoryEntity>> getAllCategories();

  /// 사전 정의된 카테고리 조회
  Future<List<CategoryEntity>> getPredefinedCategories();

  /// 사용자 정의 카테고리 조회
  Future<List<CategoryEntity>> getCustomCategories();

  /// ID로 카테고리 조회
  Future<CategoryEntity?> getCategoryById(String id);

  /// 이름으로 카테고리 검색
  Future<List<CategoryEntity>> searchCategoriesByName(String name);

  /// 사용자 정의 카테고리 생성
  Future<CategoryEntity> createCustomCategory({
    required String name,
    required String displayName,
    String? description,
    String? iconCode,
    String? colorCode,
  });

  /// 사용자 정의 카테고리 업데이트
  Future<CategoryEntity> updateCustomCategory(CategoryEntity category);

  /// 사용자 정의 카테고리 삭제
  Future<void> deleteCustomCategory(String id);

  /// 카테고리 사용 횟수 증가
  Future<void> incrementUsageCount(String id);

  /// 카테고리 활성화/비활성화
  Future<void> toggleCategoryActive(String id, bool isActive);
}
