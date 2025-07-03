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

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Recipes'**
  String get recipes;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Timer'**
  String get timer;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Add Recipe'**
  String get addRecipe;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Edit Recipe'**
  String get editRecipe;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Recipe Detail'**
  String get recipeDetail;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'No recipes yet'**
  String get noRecipesYet;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Create your own special\nsauce recipe!'**
  String get createSpecialRecipe;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Search Ingredients'**
  String get searchIngredients;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Recipe has been deleted'**
  String get recipeDeleted;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this recipe?\n\nThis action cannot be undone.'**
  String get confirmDeleteRecipe;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Delete failed'**
  String get deleteFailed;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get errorOccurred;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Select Unit'**
  String get selectUnit;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Management'**
  String get management;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Seasoning/Unit Management'**
  String get seasoningUnitManagement;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Add, edit, delete seasonings/units'**
  String get seasoningUnitDescription;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'App Info'**
  String get appInfo;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Timer Notification'**
  String get timerNotification;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Background App Refresh'**
  String get backgroundAppRefresh;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'Set up for accurate timer notifications'**
  String get backgroundAppRefreshDescription;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'타이머 알림이 활성화되었습니다'**
  String get notificationActivated;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'알림 권한이 거부되었습니다. 시스템 설정에서 수동으로 활성화할 수 있습니다'**
  String get notificationDenied;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'알림 설정'**
  String get notificationSettings;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'타이머 알림이 활성화되어 있습니다'**
  String get timerNotificationEnabled;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'알림을 끄고 싶다면:'**
  String get toTurnOffNotifications;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'1. 아이폰 설정 앱 열기 2. 알림 > Saucerer 선택 3. 알림 허용 끄기'**
  String get turnOffInstructions;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'알림을 끄면 타이머 완료 시 알림을 받을 수 없습니다'**
  String get turnOffWarning;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'활성화됨'**
  String get activated;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'비활성화됨'**
  String get deactivated;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'설정 열기'**
  String get openSettings;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'\"{unitName}\" 단위가 어떤 종류인지 선택해주세요.'**
  String unitTypeSelection(Object unitName);

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'자주 사용하는 단위'**
  String get frequently_used_units;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'무게 (기본)'**
  String get weight_basic;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'무게 (사용자 추가)'**
  String get weight_custom;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'부피 (기본)'**
  String get volume_basic;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'부피 (사용자 추가)'**
  String get volume_custom;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'개수 (기본)'**
  String get count_basic;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'개수 (사용자 추가)'**
  String get count_custom;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'기타 (기본)'**
  String get misc_basic;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'기타 (사용자 추가)'**
  String get misc_custom;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'기본'**
  String get basic;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'새 단위 \"{unitName}\"이(가) {category} 카테고리에 추가되었습니다'**
  String newUnitAdded(Object category, Object unitName);

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'단위 검색...'**
  String get unitSearch;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'새 단위 추가: \"{unitName}\"'**
  String addNewUnit(Object unitName);

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'새로운 단위를 추가합니다'**
  String get addNewUnitSubtitle;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'{count}회'**
  String usageCount(Object count);

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'단위를 불러오는 중 오류가 발생했습니다'**
  String get errorLoadingUnits;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'다시 시도'**
  String get retry;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'{duration} 타이머가 끝났습니다.'**
  String timerFinished(Object duration);

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'{name} 프리셋이 저장되었습니다'**
  String presetSaved(Object name);

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'{count}개 진행중'**
  String timersInProgress(Object count);

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'새 버전 생성'**
  String get createNewVersion;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'기존 버전 덮어쓰기'**
  String get overwriteExistingVersion;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'버전 이름'**
  String get versionName;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'변경 사항'**
  String get changeLog;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'{versionName}에서 파생된 새 버전을 생성합니다'**
  String createDerivedVersion(Object versionName);

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'{versionName}을(를) 업데이트합니다'**
  String updateVersion(Object versionName);

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'재료'**
  String get ingredients;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'조리 과정'**
  String get steps;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'단위'**
  String get unit;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'수량'**
  String get quantity;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'이름'**
  String get name;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'설명'**
  String get description;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'요리 기록'**
  String get cookingLog;

  /// Auto-generated from hardcoded strings
  ///
  /// In en, this message translates to:
  /// **'요리 기록 추가'**
  String get addCookingLog;

  /// 프리셋 삭제 다이얼로그 제목
  ///
  /// In en, this message translates to:
  /// **'Delete Preset'**
  String get deletePreset;

  /// 프리셋 삭제 확인 메시지
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the {presetName} preset?\nDeleted presets cannot be recovered.'**
  String confirmDeletePreset(String presetName);

  /// 자주 사용하는 타이머 섹션 제목
  ///
  /// In en, this message translates to:
  /// **'Frequently Used Timers'**
  String get frequentlyUsedTimers;

  /// 저장 실패 메시지
  ///
  /// In en, this message translates to:
  /// **'Save failed'**
  String get saveFailed;

  /// 새 레시피 제목
  ///
  /// In en, this message translates to:
  /// **'New Recipe'**
  String get newRecipe;

  /// 레시피 로딩 메시지
  ///
  /// In en, this message translates to:
  /// **'Loading recipe...'**
  String get loadingRecipe;

  /// 레시피 로드 실패 메시지
  ///
  /// In en, this message translates to:
  /// **'Cannot load recipe'**
  String get cannotLoadRecipe;

  /// 돌아가기 버튼
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

  /// 레시피 이름 입력 라벨
  ///
  /// In en, this message translates to:
  /// **'Recipe Name'**
  String get recipeName;

  /// 조리 단계 섹션 제목
  ///
  /// In en, this message translates to:
  /// **'Cooking Steps'**
  String get cookingSteps;

  /// 저장 옵션 다이얼로그 제목
  ///
  /// In en, this message translates to:
  /// **'Save Options'**
  String get saveOptions;

  /// 저장 방법 질문
  ///
  /// In en, this message translates to:
  /// **'How would you like to save?'**
  String get howToSave;

  /// 현재 편집 중인 버전 표시
  ///
  /// In en, this message translates to:
  /// **'Editing: {versionName}'**
  String editingVersion(String versionName);

  /// 새 버전으로 저장 옵션
  ///
  /// In en, this message translates to:
  /// **'Save as New Version'**
  String get saveAsNewVersion;

  /// 파생 버전 생성 설명
  ///
  /// In en, this message translates to:
  /// **'Create a new version derived from {versionName}'**
  String createDerivedVersionDescription(String versionName);

  /// 기존 버전 유지 설명
  ///
  /// In en, this message translates to:
  /// **'Keep the existing version and create a new version'**
  String get keepExistingVersion;

  /// 기존 버전 덮어쓰기 옵션
  ///
  /// In en, this message translates to:
  /// **'Overwrite Existing Version'**
  String get overwriteVersion;

  /// 버전 업데이트 설명
  ///
  /// In en, this message translates to:
  /// **'Update {versionName}'**
  String updateVersionDescription(String versionName);

  /// 현재 버전 업데이트 설명
  ///
  /// In en, this message translates to:
  /// **'Update the current version'**
  String get updateCurrentVersion;

  /// 기반 버전 표시
  ///
  /// In en, this message translates to:
  /// **'Base version: {versionName}'**
  String baseVersion(String versionName);

  /// 버전명 입력 라벨
  ///
  /// In en, this message translates to:
  /// **'Version Name (Optional)'**
  String get versionNameOptional;

  /// 버전명 입력 힌트
  ///
  /// In en, this message translates to:
  /// **'e.g., Spicy, Less Sugar, Vegan'**
  String get versionNameHint;

  /// 변경사항 입력 라벨
  ///
  /// In en, this message translates to:
  /// **'Change Log (Optional)'**
  String get changeLogOptional;

  /// 변경사항 입력 힌트
  ///
  /// In en, this message translates to:
  /// **'e.g., Reduced sugar, Added vegetables'**
  String get changeLogHint;

  /// No description provided for @cookingTimer.
  ///
  /// In en, this message translates to:
  /// **'Cooking Timer'**
  String get cookingTimer;

  /// No description provided for @pastaCooking.
  ///
  /// In en, this message translates to:
  /// **'Pasta Cooking'**
  String get pastaCooking;

  /// No description provided for @pastaCookingDescription.
  ///
  /// In en, this message translates to:
  /// **'Standard pasta cooking time'**
  String get pastaCookingDescription;

  /// No description provided for @hardBoiledEgg.
  ///
  /// In en, this message translates to:
  /// **'Hard-boiled Egg'**
  String get hardBoiledEgg;

  /// No description provided for @hardBoiledEggDescription.
  ///
  /// In en, this message translates to:
  /// **'Perfect hard-boiled egg'**
  String get hardBoiledEggDescription;

  /// No description provided for @softBoiledEgg.
  ///
  /// In en, this message translates to:
  /// **'Soft-boiled Egg'**
  String get softBoiledEgg;

  /// No description provided for @softBoiledEggDescription.
  ///
  /// In en, this message translates to:
  /// **'Soft and runny egg yolk'**
  String get softBoiledEggDescription;

  /// No description provided for @instantNoodles.
  ///
  /// In en, this message translates to:
  /// **'Instant Noodles'**
  String get instantNoodles;

  /// No description provided for @instantNoodlesDescription.
  ///
  /// In en, this message translates to:
  /// **'Quick instant noodles'**
  String get instantNoodlesDescription;

  /// No description provided for @teaBrewing.
  ///
  /// In en, this message translates to:
  /// **'Tea Brewing'**
  String get teaBrewing;

  /// No description provided for @teaBrewingDescription.
  ///
  /// In en, this message translates to:
  /// **'Perfect tea steeping time'**
  String get teaBrewingDescription;

  /// No description provided for @steakCooking.
  ///
  /// In en, this message translates to:
  /// **'Steak Cooking'**
  String get steakCooking;

  /// No description provided for @steakCookingDescription.
  ///
  /// In en, this message translates to:
  /// **'Medium-rare steak'**
  String get steakCookingDescription;

  /// No description provided for @enableNotificationInSettings.
  ///
  /// In en, this message translates to:
  /// **'Please enable notifications in settings'**
  String get enableNotificationInSettings;

  /// No description provided for @notificationEnabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications enabled'**
  String get notificationEnabled;

  /// No description provided for @notificationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Notification permission denied'**
  String get notificationPermissionDenied;

  /// No description provided for @testNotificationSent.
  ///
  /// In en, this message translates to:
  /// **'Test notification sent'**
  String get testNotificationSent;

  /// No description provided for @notificationTest.
  ///
  /// In en, this message translates to:
  /// **'Test Notification'**
  String get notificationTest;

  /// No description provided for @timersRunning.
  ///
  /// In en, this message translates to:
  /// **'{count} timers running'**
  String timersRunning(int count);

  /// No description provided for @runningTimers.
  ///
  /// In en, this message translates to:
  /// **'Running Timers'**
  String get runningTimers;

  /// No description provided for @presetDeleted.
  ///
  /// In en, this message translates to:
  /// **'{name} preset deleted'**
  String presetDeleted(String name);

  /// No description provided for @cannotDeleteDefaultPreset.
  ///
  /// In en, this message translates to:
  /// **'Cannot delete default preset'**
  String get cannotDeleteDefaultPreset;

  /// No description provided for @customTimer.
  ///
  /// In en, this message translates to:
  /// **'Custom Timer'**
  String get customTimer;

  /// No description provided for @createCustomTimer.
  ///
  /// In en, this message translates to:
  /// **'Create Custom Timer'**
  String get createCustomTimer;

  /// No description provided for @enterTimerName.
  ///
  /// In en, this message translates to:
  /// **'Please enter timer name'**
  String get enterTimerName;

  /// No description provided for @setTime.
  ///
  /// In en, this message translates to:
  /// **'Please set time'**
  String get setTime;

  /// No description provided for @presetAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Preset with same name already exists'**
  String get presetAlreadyExists;

  /// No description provided for @failedToSavePreset.
  ///
  /// In en, this message translates to:
  /// **'Failed to save preset'**
  String get failedToSavePreset;

  /// No description provided for @timerName.
  ///
  /// In en, this message translates to:
  /// **'Timer Name'**
  String get timerName;

  /// No description provided for @timerNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Egg boiling, Tea brewing'**
  String get timerNameHint;

  /// No description provided for @timeSetting.
  ///
  /// In en, this message translates to:
  /// **'Time Setting'**
  String get timeSetting;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get minutes;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'Seconds'**
  String get seconds;

  /// No description provided for @descriptionOptional.
  ///
  /// In en, this message translates to:
  /// **'Description (Optional)'**
  String get descriptionOptional;

  /// No description provided for @timerDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Perfect for morning tea'**
  String get timerDescriptionHint;

  /// No description provided for @saveAsPreset.
  ///
  /// In en, this message translates to:
  /// **'Save as Preset'**
  String get saveAsPreset;

  /// No description provided for @saveAsPresetDescription.
  ///
  /// In en, this message translates to:
  /// **'Save for easy reuse next time'**
  String get saveAsPresetDescription;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @saveFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Save failed: {error}'**
  String saveFailedWithError(String error);

  /// No description provided for @addStep.
  ///
  /// In en, this message translates to:
  /// **'Add Step'**
  String get addStep;

  /// No description provided for @stepNumber.
  ///
  /// In en, this message translates to:
  /// **'Step {number}'**
  String stepNumber(int number);

  /// No description provided for @writeCookingLog.
  ///
  /// In en, this message translates to:
  /// **'Write Cooking Log'**
  String get writeCookingLog;

  /// No description provided for @recipeInfo.
  ///
  /// In en, this message translates to:
  /// **'Recipe Information'**
  String get recipeInfo;

  /// No description provided for @titleRequired.
  ///
  /// In en, this message translates to:
  /// **'Title *'**
  String get titleRequired;

  /// No description provided for @cookingLogTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Enter cooking log title'**
  String get cookingLogTitleHint;

  /// No description provided for @enterTitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get enterTitle;

  /// No description provided for @cookingDateTimeRequired.
  ///
  /// In en, this message translates to:
  /// **'Cooking Date & Time *'**
  String get cookingDateTimeRequired;

  /// No description provided for @selectDateTime.
  ///
  /// In en, this message translates to:
  /// **'Select date and time'**
  String get selectDateTime;

  /// No description provided for @photo.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get photo;

  /// No description provided for @addPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get addPhoto;

  /// No description provided for @takeWithCamera.
  ///
  /// In en, this message translates to:
  /// **'Take with Camera'**
  String get takeWithCamera;

  /// No description provided for @selectFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Select from Gallery'**
  String get selectFromGallery;

  /// No description provided for @memo.
  ///
  /// In en, this message translates to:
  /// **'Memo'**
  String get memo;

  /// No description provided for @cookingMemoHint.
  ///
  /// In en, this message translates to:
  /// **'Write down your thoughts or improvements while cooking'**
  String get cookingMemoHint;

  /// No description provided for @searchByIngredients.
  ///
  /// In en, this message translates to:
  /// **'Search by Ingredients'**
  String get searchByIngredients;

  /// No description provided for @resetSearch.
  ///
  /// In en, this message translates to:
  /// **'Reset Search'**
  String get resetSearch;

  /// No description provided for @showPopularIngredients.
  ///
  /// In en, this message translates to:
  /// **'Show Popular Ingredients'**
  String get showPopularIngredients;

  /// No description provided for @showAllIngredients.
  ///
  /// In en, this message translates to:
  /// **'Show All Ingredients'**
  String get showAllIngredients;

  /// No description provided for @searchIngredientsHint.
  ///
  /// In en, this message translates to:
  /// **'Search ingredient names...'**
  String get searchIngredientsHint;

  /// No description provided for @searchResults.
  ///
  /// In en, this message translates to:
  /// **'Search Results'**
  String get searchResults;

  /// No description provided for @noRecipesFound.
  ///
  /// In en, this message translates to:
  /// **'No recipes can be made\nwith selected ingredients'**
  String get noRecipesFound;

  /// No description provided for @recipesFound.
  ///
  /// In en, this message translates to:
  /// **'{count} recipes found'**
  String recipesFound(int count);

  /// No description provided for @popularIngredients.
  ///
  /// In en, this message translates to:
  /// **'Popular Ingredients'**
  String get popularIngredients;

  /// No description provided for @searchResultsIngredients.
  ///
  /// In en, this message translates to:
  /// **'Search Results'**
  String get searchResultsIngredients;

  /// No description provided for @recipeRequiresMinimumVersion.
  ///
  /// In en, this message translates to:
  /// **'Recipe must have at least one version.'**
  String get recipeRequiresMinimumVersion;

  /// No description provided for @deleteVersion.
  ///
  /// In en, this message translates to:
  /// **'Delete Version'**
  String get deleteVersion;

  /// No description provided for @confirmDeleteVersion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this version?'**
  String get confirmDeleteVersion;

  /// No description provided for @categoryManagement.
  ///
  /// In en, this message translates to:
  /// **'Category Management'**
  String get categoryManagement;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @addCategory.
  ///
  /// In en, this message translates to:
  /// **'Add Category'**
  String get addCategory;

  /// No description provided for @versionDeleteError.
  ///
  /// In en, this message translates to:
  /// **'Error occurred while deleting version: {error}'**
  String versionDeleteError(String error);

  /// No description provided for @cookingTimerChannel.
  ///
  /// In en, this message translates to:
  /// **'Cooking Timer'**
  String get cookingTimerChannel;

  /// No description provided for @timerNotificationDescription.
  ///
  /// In en, this message translates to:
  /// **'Cooking timer completion notifications'**
  String get timerNotificationDescription;

  /// No description provided for @timerCompleteTitle.
  ///
  /// In en, this message translates to:
  /// **'🍳 {timerName} Complete!'**
  String timerCompleteTitle(String timerName);

  /// No description provided for @timerCompleteBody.
  ///
  /// In en, this message translates to:
  /// **'{duration} timer finished.'**
  String timerCompleteBody(String duration);

  /// No description provided for @testNotificationChannel.
  ///
  /// In en, this message translates to:
  /// **'Test Notifications'**
  String get testNotificationChannel;

  /// No description provided for @testNotificationDescription.
  ///
  /// In en, this message translates to:
  /// **'Test notification channel'**
  String get testNotificationDescription;

  /// No description provided for @testNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'🧪 Test Notification'**
  String get testNotificationTitle;

  /// No description provided for @testNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'This is a test notification. Notifications are working properly!'**
  String get testNotificationBody;

  /// No description provided for @recipeList.
  ///
  /// In en, this message translates to:
  /// **'Recipe List'**
  String get recipeList;

  /// No description provided for @usedTimes.
  ///
  /// In en, this message translates to:
  /// **'Used {count} times'**
  String usedTimes(int count);
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
