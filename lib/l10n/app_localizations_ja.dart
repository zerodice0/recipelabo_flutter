// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get nav_tab_recipes => 'レシピ';

  @override
  String get nav_tab_search => '検索';

  @override
  String get nav_tab_timer => 'タイマー';

  @override
  String get nav_tab_settings => '設定';

  @override
  String get screen_recipe_list_title => 'マイレシピ';

  @override
  String get screen_recipe_detail_title => 'レシピ詳細';

  @override
  String get screen_recipe_edit_title => 'レシピ編集';

  @override
  String get screen_recipe_create_title => '新しいレシピ';

  @override
  String get screen_ingredient_search_title => '材料で検索';

  @override
  String get screen_cooking_log_create_title => '調理ログ作成';

  @override
  String get screen_seasoning_management_title => 'カテゴリ管理';

  @override
  String get screen_timer_title => '調理タイマー';

  @override
  String get button_recipe_add => 'レシピ追加';

  @override
  String get button_ingredient_search => '材料検索';

  @override
  String get button_cooking_log_add => 'ログ追加';

  @override
  String get button_save => '保存';

  @override
  String get button_cancel => 'キャンセル';

  @override
  String get button_delete => '削除';

  @override
  String get button_confirm => '確認';

  @override
  String get button_retry => '再試行';

  @override
  String get button_timer_start => 'タイマー開始';

  @override
  String get button_timer_custom => 'カスタムタイマー';

  @override
  String get button_notification_allow => '通知を許可';

  @override
  String get button_notification_later => '後で';

  @override
  String get label_recipe_name => 'レシピ名';

  @override
  String get label_recipe_description => '説明';

  @override
  String get label_recipe_ingredients => '材料';

  @override
  String get label_recipe_steps => '調理手順';

  @override
  String get label_cooking_log_title => 'タイトル *';

  @override
  String get label_cooking_log_datetime => '調理日時 *';

  @override
  String get label_cooking_log_photo => '写真';

  @override
  String get label_cooking_log_memo => 'メモ';

  @override
  String get hint_ingredient_search => '材料名を検索してください...';

  @override
  String get hint_seasoning_search => 'カテゴリ名を検索してください...';

  @override
  String get hint_cooking_log_title => '調理ログのタイトルを入力してください';

  @override
  String get hint_cooking_log_memo => '調理中に感じたことや改善点を書いてください';

  @override
  String get error_general => 'エラーが発生しました';

  @override
  String get error_validation_title_required => 'タイトルを入力してください';

  @override
  String get error_recipe_load_failed => 'レシピを読み込めません';

  @override
  String get empty_recipes_title => 'まだレシピがありません';

  @override
  String get empty_recipes_description => 'あなただけの特別な\\nソースレシピを作ってみましょう！';

  @override
  String get empty_cooking_logs_title => 'まだ調理ログがありません';

  @override
  String get empty_cooking_logs_description => '最初の調理ログを追加してみましょう！';

  @override
  String get status_loading_recipe => 'レシピを読み込み中...';

  @override
  String get success_recipe_deleted => 'レシピが削除されました';

  @override
  String get success_timer_started => 'タイマーが開始されました';

  @override
  String get dialog_recipe_delete_title => 'レシピ削除';

  @override
  String get dialog_delete_confirmation => '本当に削除しますか？';

  @override
  String dialog_recipe_delete_question(String recipeName) {
    return '$recipeName\' レシピを削除しますか？';
  }

  @override
  String search_results_count(int count) {
    return '$count個のレシピが見つかりました';
  }

  @override
  String timer_active_count(int count) {
    return '$count個実行中';
  }

  @override
  String get timer_preset_pasta => 'パスタを茹でる';

  @override
  String get timer_preset_pasta_description => 'アルデンテパスタの標準時間';

  @override
  String get timer_preset_egg_hard => '卵の固茹で';

  @override
  String get timer_preset_egg_soft => '卵の半熟';

  @override
  String get unit_category_weight => '重量';

  @override
  String get unit_category_volume => '容量';

  @override
  String get unit_category_count => '個数';

  @override
  String get settings_user_section => 'ユーザー';

  @override
  String get settings_seasoning_management => '調味料管理';
}
