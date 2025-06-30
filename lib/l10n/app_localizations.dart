import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ko'),
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @nav_tab_recipes.
  ///
  /// In en, this message translates to:
  /// **'Recipes'**
  String get nav_tab_recipes;

  /// No description provided for @nav_tab_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get nav_tab_search;

  /// No description provided for @nav_tab_timer.
  ///
  /// In en, this message translates to:
  /// **'Timer'**
  String get nav_tab_timer;

  /// No description provided for @nav_tab_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get nav_tab_settings;

  /// No description provided for @screen_recipe_list_title.
  ///
  /// In en, this message translates to:
  /// **'My Recipes'**
  String get screen_recipe_list_title;

  /// No description provided for @screen_recipe_detail_title.
  ///
  /// In en, this message translates to:
  /// **'Recipe Details'**
  String get screen_recipe_detail_title;

  /// No description provided for @screen_recipe_edit_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Recipe'**
  String get screen_recipe_edit_title;

  /// No description provided for @screen_recipe_create_title.
  ///
  /// In en, this message translates to:
  /// **'New Recipe'**
  String get screen_recipe_create_title;

  /// No description provided for @screen_ingredient_search_title.
  ///
  /// In en, this message translates to:
  /// **'Search by Ingredients'**
  String get screen_ingredient_search_title;

  /// No description provided for @screen_cooking_log_create_title.
  ///
  /// In en, this message translates to:
  /// **'Create Cooking Log'**
  String get screen_cooking_log_create_title;

  /// No description provided for @screen_seasoning_management_title.
  ///
  /// In en, this message translates to:
  /// **'Manage Categories'**
  String get screen_seasoning_management_title;

  /// No description provided for @screen_timer_title.
  ///
  /// In en, this message translates to:
  /// **'Cooking Timer'**
  String get screen_timer_title;

  /// No description provided for @button_recipe_add.
  ///
  /// In en, this message translates to:
  /// **'Add Recipe'**
  String get button_recipe_add;

  /// No description provided for @button_ingredient_search.
  ///
  /// In en, this message translates to:
  /// **'Search Ingredients'**
  String get button_ingredient_search;

  /// No description provided for @button_cooking_log_add.
  ///
  /// In en, this message translates to:
  /// **'Add Log'**
  String get button_cooking_log_add;

  /// No description provided for @button_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get button_save;

  /// No description provided for @button_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get button_cancel;

  /// No description provided for @button_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get button_delete;

  /// No description provided for @button_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get button_confirm;

  /// No description provided for @button_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get button_retry;

  /// No description provided for @button_timer_start.
  ///
  /// In en, this message translates to:
  /// **'Start Timer'**
  String get button_timer_start;

  /// No description provided for @button_timer_custom.
  ///
  /// In en, this message translates to:
  /// **'Custom Timer'**
  String get button_timer_custom;

  /// No description provided for @button_notification_allow.
  ///
  /// In en, this message translates to:
  /// **'Allow Notifications'**
  String get button_notification_allow;

  /// No description provided for @button_notification_later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get button_notification_later;

  /// No description provided for @label_recipe_name.
  ///
  /// In en, this message translates to:
  /// **'Recipe Name'**
  String get label_recipe_name;

  /// No description provided for @label_recipe_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get label_recipe_description;

  /// No description provided for @label_recipe_ingredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get label_recipe_ingredients;

  /// No description provided for @label_recipe_steps.
  ///
  /// In en, this message translates to:
  /// **'Cooking Steps'**
  String get label_recipe_steps;

  /// No description provided for @label_cooking_log_title.
  ///
  /// In en, this message translates to:
  /// **'Title *'**
  String get label_cooking_log_title;

  /// No description provided for @label_cooking_log_datetime.
  ///
  /// In en, this message translates to:
  /// **'Cooking Date & Time *'**
  String get label_cooking_log_datetime;

  /// No description provided for @label_cooking_log_photo.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get label_cooking_log_photo;

  /// No description provided for @label_cooking_log_memo.
  ///
  /// In en, this message translates to:
  /// **'Memo'**
  String get label_cooking_log_memo;

  /// No description provided for @hint_ingredient_search.
  ///
  /// In en, this message translates to:
  /// **'Search ingredient names...'**
  String get hint_ingredient_search;

  /// No description provided for @hint_seasoning_search.
  ///
  /// In en, this message translates to:
  /// **'Search category names...'**
  String get hint_seasoning_search;

  /// No description provided for @hint_cooking_log_title.
  ///
  /// In en, this message translates to:
  /// **'Enter cooking log title'**
  String get hint_cooking_log_title;

  /// No description provided for @hint_cooking_log_memo.
  ///
  /// In en, this message translates to:
  /// **'Write your thoughts or improvements while cooking'**
  String get hint_cooking_log_memo;

  /// No description provided for @error_general.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get error_general;

  /// No description provided for @error_validation_title_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get error_validation_title_required;

  /// No description provided for @error_recipe_load_failed.
  ///
  /// In en, this message translates to:
  /// **'Could not load recipe'**
  String get error_recipe_load_failed;

  /// No description provided for @empty_recipes_title.
  ///
  /// In en, this message translates to:
  /// **'No recipes yet'**
  String get empty_recipes_title;

  /// No description provided for @empty_recipes_description.
  ///
  /// In en, this message translates to:
  /// **'Create your own special\\nsauce recipes!'**
  String get empty_recipes_description;

  /// No description provided for @empty_cooking_logs_title.
  ///
  /// In en, this message translates to:
  /// **'No cooking logs yet'**
  String get empty_cooking_logs_title;

  /// No description provided for @empty_cooking_logs_description.
  ///
  /// In en, this message translates to:
  /// **'Add your first cooking log!'**
  String get empty_cooking_logs_description;

  /// No description provided for @status_loading_recipe.
  ///
  /// In en, this message translates to:
  /// **'Loading recipe...'**
  String get status_loading_recipe;

  /// No description provided for @success_recipe_deleted.
  ///
  /// In en, this message translates to:
  /// **'Recipe deleted'**
  String get success_recipe_deleted;

  /// No description provided for @success_timer_started.
  ///
  /// In en, this message translates to:
  /// **'Timer started'**
  String get success_timer_started;

  /// No description provided for @dialog_recipe_delete_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Recipe'**
  String get dialog_recipe_delete_title;

  /// No description provided for @dialog_delete_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete?'**
  String get dialog_delete_confirmation;

  /// No description provided for @dialog_recipe_delete_question.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete \'{recipeName}\' recipe?'**
  String dialog_recipe_delete_question(String recipeName);

  /// No description provided for @search_results_count.
  ///
  /// In en, this message translates to:
  /// **'Found {count} recipes'**
  String search_results_count(int count);

  /// No description provided for @timer_active_count.
  ///
  /// In en, this message translates to:
  /// **'{count} active'**
  String timer_active_count(int count);

  /// No description provided for @timer_preset_pasta.
  ///
  /// In en, this message translates to:
  /// **'Boil Pasta'**
  String get timer_preset_pasta;

  /// No description provided for @timer_preset_pasta_description.
  ///
  /// In en, this message translates to:
  /// **'Standard time for al dente pasta'**
  String get timer_preset_pasta_description;

  /// No description provided for @timer_preset_egg_hard.
  ///
  /// In en, this message translates to:
  /// **'Hard-boiled Egg'**
  String get timer_preset_egg_hard;

  /// No description provided for @timer_preset_egg_soft.
  ///
  /// In en, this message translates to:
  /// **'Soft-boiled Egg'**
  String get timer_preset_egg_soft;

  /// No description provided for @unit_category_weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get unit_category_weight;

  /// No description provided for @unit_category_volume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get unit_category_volume;

  /// No description provided for @unit_category_count.
  ///
  /// In en, this message translates to:
  /// **'Count'**
  String get unit_category_count;

  /// No description provided for @settings_user_section.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get settings_user_section;

  /// No description provided for @settings_seasoning_management.
  ///
  /// In en, this message translates to:
  /// **'Seasoning Management'**
  String get settings_seasoning_management;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ja': return AppLocalizationsJa();
    case 'ko': return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
