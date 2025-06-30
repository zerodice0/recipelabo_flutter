// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get nav_tab_recipes => 'Recipes';

  @override
  String get nav_tab_search => 'Search';

  @override
  String get nav_tab_timer => 'Timer';

  @override
  String get nav_tab_settings => 'Settings';

  @override
  String get screen_recipe_list_title => 'My Recipes';

  @override
  String get screen_recipe_detail_title => 'Recipe Details';

  @override
  String get screen_recipe_edit_title => 'Edit Recipe';

  @override
  String get screen_recipe_create_title => 'New Recipe';

  @override
  String get screen_ingredient_search_title => 'Search by Ingredients';

  @override
  String get screen_cooking_log_create_title => 'Create Cooking Log';

  @override
  String get screen_seasoning_management_title => 'Manage Categories';

  @override
  String get screen_timer_title => 'Cooking Timer';

  @override
  String get button_recipe_add => 'Add Recipe';

  @override
  String get button_ingredient_search => 'Search Ingredients';

  @override
  String get button_cooking_log_add => 'Add Log';

  @override
  String get button_save => 'Save';

  @override
  String get button_cancel => 'Cancel';

  @override
  String get button_delete => 'Delete';

  @override
  String get button_confirm => 'Confirm';

  @override
  String get button_retry => 'Retry';

  @override
  String get button_timer_start => 'Start Timer';

  @override
  String get button_timer_custom => 'Custom Timer';

  @override
  String get button_notification_allow => 'Allow Notifications';

  @override
  String get button_notification_later => 'Later';

  @override
  String get label_recipe_name => 'Recipe Name';

  @override
  String get label_recipe_description => 'Description';

  @override
  String get label_recipe_ingredients => 'Ingredients';

  @override
  String get label_recipe_steps => 'Cooking Steps';

  @override
  String get label_cooking_log_title => 'Title *';

  @override
  String get label_cooking_log_datetime => 'Cooking Date & Time *';

  @override
  String get label_cooking_log_photo => 'Photo';

  @override
  String get label_cooking_log_memo => 'Memo';

  @override
  String get hint_ingredient_search => 'Search ingredient names...';

  @override
  String get hint_seasoning_search => 'Search category names...';

  @override
  String get hint_cooking_log_title => 'Enter cooking log title';

  @override
  String get hint_cooking_log_memo => 'Write your thoughts or improvements while cooking';

  @override
  String get error_general => 'An error occurred';

  @override
  String get error_validation_title_required => 'Please enter a title';

  @override
  String get error_recipe_load_failed => 'Could not load recipe';

  @override
  String get empty_recipes_title => 'No recipes yet';

  @override
  String get empty_recipes_description => 'Create your own special\\nsauce recipes!';

  @override
  String get empty_cooking_logs_title => 'No cooking logs yet';

  @override
  String get empty_cooking_logs_description => 'Add your first cooking log!';

  @override
  String get status_loading_recipe => 'Loading recipe...';

  @override
  String get success_recipe_deleted => 'Recipe deleted';

  @override
  String get success_timer_started => 'Timer started';

  @override
  String get dialog_recipe_delete_title => 'Delete Recipe';

  @override
  String get dialog_delete_confirmation => 'Are you sure you want to delete?';

  @override
  String dialog_recipe_delete_question(String recipeName) {
    return 'Do you want to delete \'$recipeName\' recipe?';
  }

  @override
  String search_results_count(int count) {
    return 'Found $count recipes';
  }

  @override
  String timer_active_count(int count) {
    return '$count active';
  }

  @override
  String get timer_preset_pasta => 'Boil Pasta';

  @override
  String get timer_preset_pasta_description => 'Standard time for al dente pasta';

  @override
  String get timer_preset_egg_hard => 'Hard-boiled Egg';

  @override
  String get timer_preset_egg_soft => 'Soft-boiled Egg';

  @override
  String get unit_category_weight => 'Weight';

  @override
  String get unit_category_volume => 'Volume';

  @override
  String get unit_category_count => 'Count';

  @override
  String get settings_user_section => 'User';

  @override
  String get settings_seasoning_management => 'Seasoning Management';
}
