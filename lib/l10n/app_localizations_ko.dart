// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get nav_tab_recipes => '레시피';

  @override
  String get nav_tab_search => '검색';

  @override
  String get nav_tab_timer => '타이머';

  @override
  String get nav_tab_settings => '설정';

  @override
  String get screen_recipe_list_title => '나의 레시피';

  @override
  String get screen_recipe_detail_title => '레시피 상세';

  @override
  String get screen_recipe_edit_title => '레시피 편집';

  @override
  String get screen_recipe_create_title => '새 레시피';

  @override
  String get screen_ingredient_search_title => '재료로 검색';

  @override
  String get screen_cooking_log_create_title => '쿠킹 로그 작성';

  @override
  String get screen_seasoning_management_title => '카테고리 관리';

  @override
  String get screen_timer_title => '요리 타이머';

  @override
  String get button_recipe_add => '레시피 추가';

  @override
  String get button_ingredient_search => '재료 검색';

  @override
  String get button_cooking_log_add => '로그 추가';

  @override
  String get button_save => '저장';

  @override
  String get button_cancel => '취소';

  @override
  String get button_delete => '삭제';

  @override
  String get button_confirm => '확인';

  @override
  String get button_retry => '다시 시도';

  @override
  String get button_timer_start => '타이머 시작';

  @override
  String get button_timer_custom => '커스텀 타이머';

  @override
  String get button_notification_allow => '알림 허용';

  @override
  String get button_notification_later => '나중에';

  @override
  String get label_recipe_name => '레시피 이름';

  @override
  String get label_recipe_description => '설명';

  @override
  String get label_recipe_ingredients => '재료';

  @override
  String get label_recipe_steps => '조리 단계';

  @override
  String get label_cooking_log_title => '제목 *';

  @override
  String get label_cooking_log_datetime => '요리한 날짜 및 시간 *';

  @override
  String get label_cooking_log_photo => '사진';

  @override
  String get label_cooking_log_memo => '메모';

  @override
  String get hint_ingredient_search => '재료 이름을 검색하세요...';

  @override
  String get hint_seasoning_search => '카테고리 이름을 검색하세요...';

  @override
  String get hint_cooking_log_title => '쿠킹 로그 제목을 입력하세요';

  @override
  String get hint_cooking_log_memo => '요리하면서 느낀 점이나 개선사항을 적어보세요';

  @override
  String get error_general => '오류가 발생했습니다';

  @override
  String get error_validation_title_required => '제목을 입력해주세요';

  @override
  String get error_recipe_load_failed => '레시피를 불러올 수 없습니다';

  @override
  String get empty_recipes_title => '아직 레시피가 없습니다';

  @override
  String get empty_recipes_description => '나만의 특별한 소스 레시피를\\n만들어보세요!';

  @override
  String get empty_cooking_logs_title => '아직 쿠킹 로그가 없습니다';

  @override
  String get empty_cooking_logs_description => '첫 번째 쿠킹 로그를 추가해보세요!';

  @override
  String get status_loading_recipe => '레시피를 불러오는 중...';

  @override
  String get success_recipe_deleted => '레시피가 삭제되었습니다';

  @override
  String get success_timer_started => '타이머가 시작되었습니다';

  @override
  String get dialog_recipe_delete_title => '레시피 삭제';

  @override
  String get dialog_delete_confirmation => '정말로 삭제하시겠습니까?';

  @override
  String dialog_recipe_delete_question(String recipeName) {
    return '$recipeName\' 레시피를 삭제하시겠습니까?';
  }

  @override
  String search_results_count(int count) {
    return '$count개의 레시피를 찾았습니다';
  }

  @override
  String timer_active_count(int count) {
    return '$count개 진행중';
  }

  @override
  String get timer_preset_pasta => '파스타 면 삶기';

  @override
  String get timer_preset_pasta_description => '알덴테 파스타를 위한 표준 시간';

  @override
  String get timer_preset_egg_hard => '달걀 완숙';

  @override
  String get timer_preset_egg_soft => '달걀 반숙';

  @override
  String get unit_category_weight => '무게';

  @override
  String get unit_category_volume => '부피';

  @override
  String get unit_category_count => '개수';

  @override
  String get settings_user_section => '사용자';

  @override
  String get settings_seasoning_management => '조미료 관리';
}
