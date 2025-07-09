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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ko'),
    Locale('en'),
    Locale('ja'),
  ];

  /// 앱 이름
  ///
  /// In en, this message translates to:
  /// **'RecipeLabo'**
  String get appName;

  /// 메인 네비게이션: 레시피 탭
  ///
  /// In en, this message translates to:
  /// **'Recipes'**
  String get navigationRecipes;

  /// 메인 네비게이션: 검색 탭
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get navigationSearch;

  /// 메인 네비게이션: 타이머 탭
  ///
  /// In en, this message translates to:
  /// **'Timer'**
  String get navigationTimer;

  /// 메인 네비게이션: 설정 탭
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navigationSettings;

  /// 저장 버튼
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// 취소 버튼
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// 삭제 버튼
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// 편집 버튼
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get actionEdit;

  /// 확인 버튼
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get actionConfirm;

  /// 시작 버튼
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get actionStart;

  /// 다시 시도 버튼
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get actionRetry;

  /// 뒤로가기 버튼
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get actionGoBack;

  /// 새로고침 버튼
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get actionRefresh;

  /// 레시피 추가 버튼/화면 제목
  ///
  /// In en, this message translates to:
  /// **'Add Recipe'**
  String get recipeAdd;

  /// 레시피 편집 화면 제목
  ///
  /// In en, this message translates to:
  /// **'Edit Recipe'**
  String get recipeEdit;

  /// 레시피 상세 화면 제목
  ///
  /// In en, this message translates to:
  /// **'Recipe Detail'**
  String get recipeDetail;

  /// 레시피 이름 입력 라벨
  ///
  /// In en, this message translates to:
  /// **'Recipe Name'**
  String get recipeName;

  /// 재료 섹션 제목
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get recipeIngredients;

  /// 조리 단계 섹션 제목
  ///
  /// In en, this message translates to:
  /// **'Cooking Steps'**
  String get recipeCookingSteps;

  /// 레시피 목록 비어있을 때 메시지
  ///
  /// In en, this message translates to:
  /// **'No recipes yet'**
  String get recipeEmptyState;

  /// 레시피 목록 비어있을 때 안내 메시지
  ///
  /// In en, this message translates to:
  /// **'Record delicious recipes and\ndevelop them into your own versions!'**
  String get recipeEmptyStateDescription;

  /// 레시피 삭제 확인 메시지
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this recipe?\n\nThis action cannot be undone.'**
  String get recipeDeleteConfirm;

  /// 레시피 삭제 성공 메시지
  ///
  /// In en, this message translates to:
  /// **'Recipe has been deleted'**
  String get recipeDeleteSuccess;

  /// 레시피 삭제 실패 메시지
  ///
  /// In en, this message translates to:
  /// **'Delete failed'**
  String get recipeDeleteFailed;

  /// 레시피 로딩 실패 메시지
  ///
  /// In en, this message translates to:
  /// **'Cannot load recipe'**
  String get recipeLoadingError;

  /// 레시피 로딩 중 메시지
  ///
  /// In en, this message translates to:
  /// **'Loading recipe...'**
  String get recipeLoading;

  /// 새 레시피 화면 제목
  ///
  /// In en, this message translates to:
  /// **'New Recipe'**
  String get recipeNewTitle;

  /// 레시피 버전 필수 요구사항 메시지
  ///
  /// In en, this message translates to:
  /// **'Recipe must have at least one version.'**
  String get recipeVersionsRequired;

  /// 레시피 목록 화면
  ///
  /// In en, this message translates to:
  /// **'Recipe List'**
  String get recipeList;

  /// 새 버전 생성 옵션
  ///
  /// In en, this message translates to:
  /// **'Create New Version'**
  String get versionCreate;

  /// 기존 버전 덮어쓰기 옵션
  ///
  /// In en, this message translates to:
  /// **'Overwrite Existing Version'**
  String get versionOverwrite;

  /// 버전명 입력 라벨
  ///
  /// In en, this message translates to:
  /// **'Version Name'**
  String get versionName;

  /// 버전명 입력 라벨 (선택사항)
  ///
  /// In en, this message translates to:
  /// **'Version Name (Optional)'**
  String get versionNameOptional;

  /// 버전명 입력 힌트
  ///
  /// In en, this message translates to:
  /// **'e.g., Spicy, Less Sugar, Vegan'**
  String get versionNameHint;

  /// 변경사항 섹션 제목
  ///
  /// In en, this message translates to:
  /// **'Change Log'**
  String get versionChangeLog;

  /// 변경사항 입력 라벨 (선택사항)
  ///
  /// In en, this message translates to:
  /// **'Change Log (Optional)'**
  String get versionChangeLogOptional;

  /// 변경사항 입력 힌트
  ///
  /// In en, this message translates to:
  /// **'e.g., Reduced sugar, Added vegetables'**
  String get versionChangeLogHint;

  /// 버전 삭제 버튼
  ///
  /// In en, this message translates to:
  /// **'Delete Version'**
  String get versionDelete;

  /// 버전 삭제 확인 메시지
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this version?'**
  String get versionDeleteConfirm;

  /// 버전 삭제 오류 메시지
  ///
  /// In en, this message translates to:
  /// **'Error occurred while deleting version: {error}'**
  String versionDeleteError(String error);

  /// 새 버전으로 저장 옵션
  ///
  /// In en, this message translates to:
  /// **'Save as New Version'**
  String get versionSaveAsDerived;

  /// 파생 버전 생성 설명
  ///
  /// In en, this message translates to:
  /// **'Create a new version derived from {versionName}'**
  String versionDerivedDescription(String versionName);

  /// 기존 버전 유지 설명
  ///
  /// In en, this message translates to:
  /// **'Keep the existing version and create a new version'**
  String get versionKeepExisting;

  /// 버전 업데이트 설명
  ///
  /// In en, this message translates to:
  /// **'Update {versionName}'**
  String versionUpdateDescription(String versionName);

  /// 현재 버전 업데이트 설명
  ///
  /// In en, this message translates to:
  /// **'Update the current version'**
  String get versionUpdateCurrent;

  /// 재료 검색 입력 필드 힌트
  ///
  /// In en, this message translates to:
  /// **'Search or add new ingredients...'**
  String get ingredientSearchOrAddHint;

  /// 사용자 추가 재료 설명
  ///
  /// In en, this message translates to:
  /// **'User added ingredient'**
  String get ingredientUserAdded;

  /// 새 재료 추가 성공 메시지
  ///
  /// In en, this message translates to:
  /// **'New ingredient \"{name}\" has been added'**
  String ingredientNewAdded(String name);

  /// 재료 양 라벨
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get ingredientQuantityLabel;

  /// 재료 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get ingredientUnitLabel;

  /// 새 재료 추가 옵션
  ///
  /// In en, this message translates to:
  /// **'Add new ingredient: \"{name}\"'**
  String ingredientAddNew(String name);

  /// 새 재료 추가 설명
  ///
  /// In en, this message translates to:
  /// **'Add a new ingredient'**
  String get ingredientAddNewSubtitle;

  /// 재료 검색 플레이스홀더
  ///
  /// In en, this message translates to:
  /// **'Enter ingredient name to search'**
  String get ingredientSearchPlaceholder;

  /// 재료 로딩 에러 메시지
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading ingredients'**
  String get ingredientLoadingError;

  /// 기반 버전 표시
  ///
  /// In en, this message translates to:
  /// **'Base version: {versionName}'**
  String versionBaseVersion(String versionName);

  /// 현재 편집 중인 버전 표시
  ///
  /// In en, this message translates to:
  /// **'Editing: {versionName}'**
  String versionEditingCurrent(String versionName);

  /// 재료 추가 버튼
  ///
  /// In en, this message translates to:
  /// **'Add Ingredient'**
  String get ingredientAdd;

  /// 재료 이름 입력 라벨
  ///
  /// In en, this message translates to:
  /// **'Ingredient Name'**
  String get ingredientName;

  /// 수량 입력 라벨
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get ingredientQuantity;

  /// 단위 선택 라벨
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get ingredientUnit;

  /// 단위 선택 버튼
  ///
  /// In en, this message translates to:
  /// **'Select Unit'**
  String get ingredientSelectUnit;

  /// 재료 검색 화면 제목
  ///
  /// In en, this message translates to:
  /// **'Search Ingredients'**
  String get ingredientSearch;

  /// 재료 검색 입력 힌트
  ///
  /// In en, this message translates to:
  /// **'Search ingredient names...'**
  String get ingredientSearchHint;

  /// 재료 기반 검색 기능
  ///
  /// In en, this message translates to:
  /// **'Search by Ingredients'**
  String get ingredientSearchByIngredients;

  /// 인기 재료 섹션
  ///
  /// In en, this message translates to:
  /// **'Popular Ingredients'**
  String get ingredientPopular;

  /// 인기 재료 보기 버튼
  ///
  /// In en, this message translates to:
  /// **'Show Popular Ingredients'**
  String get ingredientShowPopular;

  /// 모든 재료 보기 버튼
  ///
  /// In en, this message translates to:
  /// **'Show All Ingredients'**
  String get ingredientShowAll;

  /// 재료 검색 결과 섹션
  ///
  /// In en, this message translates to:
  /// **'Ingredient Search Results'**
  String get ingredientSearchResults;

  /// 타이머 시작 버튼
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get timerStart;

  /// 타이머 정지 버튼
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get timerStop;

  /// 타이머 재설정 버튼
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get timerReset;

  /// 타이머 완료 메시지
  ///
  /// In en, this message translates to:
  /// **'{duration} timer finished.'**
  String timerFinished(String duration);

  /// 실행 중인 타이머 수
  ///
  /// In en, this message translates to:
  /// **'{count} timers running'**
  String timerRunning(String count);

  /// 타이머 일시정지 상태
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get timerPaused;

  /// 타이머 완료 상태
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get timerCompleted;

  /// 타이머 취소 상태
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get timerCancelled;

  /// 타이머 진행 중 상태
  ///
  /// In en, this message translates to:
  /// **'Running'**
  String get timerStatusRunning;

  /// 타이머 완료 상태 표시
  ///
  /// In en, this message translates to:
  /// **'Complete!'**
  String get timerCompleteStatus;

  /// 남은 시간 라벨
  ///
  /// In en, this message translates to:
  /// **'Remaining Time'**
  String get timerRemainingTime;

  /// 전체 시간 라벨
  ///
  /// In en, this message translates to:
  /// **'Total Time'**
  String get timerTotalTime;

  /// 진행 중인 타이머 수
  ///
  /// In en, this message translates to:
  /// **'{count} in progress'**
  String timerInProgress(String count);

  /// 실행 중인 타이머 목록
  ///
  /// In en, this message translates to:
  /// **'Running Timers'**
  String get timerRunningList;

  /// 요리 타이머 섹션
  ///
  /// In en, this message translates to:
  /// **'Cooking Timer'**
  String get timerCooking;

  /// 자주 사용하는 타이머 섹션
  ///
  /// In en, this message translates to:
  /// **'Frequently Used Timers'**
  String get timerFrequentlyUsed;

  /// 커스텀 타이머 제목
  ///
  /// In en, this message translates to:
  /// **'Custom Timer'**
  String get timerCustom;

  /// 커스텀 타이머 생성 버튼
  ///
  /// In en, this message translates to:
  /// **'Create Custom Timer'**
  String get timerCreateCustom;

  /// 타이머 이름 입력 라벨
  ///
  /// In en, this message translates to:
  /// **'Timer Name'**
  String get timerName;

  /// 타이머 이름 입력 힌트
  ///
  /// In en, this message translates to:
  /// **'e.g., Egg boiling, Tea brewing'**
  String get timerNameHint;

  /// 타이머 이름 필수 입력 메시지
  ///
  /// In en, this message translates to:
  /// **'Please enter timer name'**
  String get timerNameRequired;

  /// 타이머 시간 필수 설정 메시지
  ///
  /// In en, this message translates to:
  /// **'Please set time'**
  String get timerTimeRequired;

  /// 시간 설정 섹션
  ///
  /// In en, this message translates to:
  /// **'Time Setting'**
  String get timerTimeSetting;

  /// 분 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get timerMinutes;

  /// 초 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'Seconds'**
  String get timerSeconds;

  /// 타이머 설명 입력 라벨
  ///
  /// In en, this message translates to:
  /// **'Description (Optional)'**
  String get timerDescriptionOptional;

  /// 타이머 설명 입력 힌트
  ///
  /// In en, this message translates to:
  /// **'e.g., Perfect for morning tea'**
  String get timerDescriptionHint;

  /// 프리셋 저장 버튼
  ///
  /// In en, this message translates to:
  /// **'Save as Preset'**
  String get timerPresetSave;

  /// 프리셋 저장 설명
  ///
  /// In en, this message translates to:
  /// **'Save for easy reuse next time'**
  String get timerPresetSaveDescription;

  /// 프리셋 저장 완료 메시지
  ///
  /// In en, this message translates to:
  /// **'{name} preset saved'**
  String timerPresetSaved(String name);

  /// 프리셋 삭제 버튼
  ///
  /// In en, this message translates to:
  /// **'Delete Preset'**
  String get timerPresetDelete;

  /// 프리셋 삭제 확인 메시지
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the {presetName} preset?\nDeleted presets cannot be recovered.'**
  String timerPresetDeleteConfirm(String presetName);

  /// 프리셋 삭제 완료 메시지
  ///
  /// In en, this message translates to:
  /// **'{name} preset deleted'**
  String timerPresetDeleted(String name);

  /// 기본 프리셋 삭제 불가 메시지
  ///
  /// In en, this message translates to:
  /// **'Cannot delete default preset'**
  String get timerPresetCannotDeleteDefault;

  /// 프리셋 이름 중복 오류 메시지
  ///
  /// In en, this message translates to:
  /// **'Preset with same name already exists'**
  String get timerPresetAlreadyExists;

  /// 프리셋 저장 실패 메시지
  ///
  /// In en, this message translates to:
  /// **'Failed to save preset'**
  String get timerPresetSaveFailed;

  /// 요리 기록 추가 버튼
  ///
  /// In en, this message translates to:
  /// **'Add Cooking Log'**
  String get cookingLogAdd;

  /// 요리 기록 작성 화면 제목
  ///
  /// In en, this message translates to:
  /// **'Write Cooking Log'**
  String get cookingLogWrite;

  /// 요리 기록 제목
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get cookingLogTitle;

  /// 요리 기록 제목 필수 입력
  ///
  /// In en, this message translates to:
  /// **'Title *'**
  String get cookingLogTitleRequired;

  /// 요리 기록 제목 입력 힌트
  ///
  /// In en, this message translates to:
  /// **'Enter cooking log title'**
  String get cookingLogTitleHint;

  /// 제목 필수 입력 메시지
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get cookingLogEnterTitle;

  /// 요리 날짜/시간 선택 라벨
  ///
  /// In en, this message translates to:
  /// **'Cooking Date & Time *'**
  String get cookingLogDateTime;

  /// 날짜/시간 선택 힌트
  ///
  /// In en, this message translates to:
  /// **'Select date and time'**
  String get cookingLogSelectDateTime;

  /// 요리 사진 섹션
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get cookingLogPhoto;

  /// 사진 추가 버튼
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get cookingLogAddPhoto;

  /// 카메라로 사진 촬영 옵션
  ///
  /// In en, this message translates to:
  /// **'Take with Camera'**
  String get cookingLogTakePhoto;

  /// 갤러리에서 사진 선택 옵션
  ///
  /// In en, this message translates to:
  /// **'Select from Gallery'**
  String get cookingLogSelectFromGallery;

  /// 요리 메모 섹션
  ///
  /// In en, this message translates to:
  /// **'Memo'**
  String get cookingLogMemo;

  /// 요리 메모 입력 힌트
  ///
  /// In en, this message translates to:
  /// **'Write down your thoughts or improvements while cooking'**
  String get cookingLogMemoHint;

  /// 레시피 정보 섹션
  ///
  /// In en, this message translates to:
  /// **'Recipe Information'**
  String get cookingLogRecipeInfo;

  /// 조리 단계 추가 버튼
  ///
  /// In en, this message translates to:
  /// **'Add Step'**
  String get cookingStepAdd;

  /// 조리 단계 번호
  ///
  /// In en, this message translates to:
  /// **'Step {number}'**
  String cookingStepNumber(String number);

  /// 조리 단계 설명 입력
  ///
  /// In en, this message translates to:
  /// **'Step Description'**
  String get cookingStepDescription;

  /// 검색 결과 섹션
  ///
  /// In en, this message translates to:
  /// **'Search Results'**
  String get searchResults;

  /// 레시피 검색 결과 섹션 제목
  ///
  /// In en, this message translates to:
  /// **'Recipe Search Results'**
  String get searchRecipeResults;

  /// 검색 초기화 버튼
  ///
  /// In en, this message translates to:
  /// **'Reset Search'**
  String get searchReset;

  /// 검색 결과 없음 메시지
  ///
  /// In en, this message translates to:
  /// **'No recipes can be made\nwith selected ingredients'**
  String get searchNoResults;

  /// 검색 결과 개수
  ///
  /// In en, this message translates to:
  /// **'{count} recipes found'**
  String searchRecipesFound(String count);

  /// 관리 섹션
  ///
  /// In en, this message translates to:
  /// **'Management'**
  String get settingsManagement;

  /// 조미료/단위 관리 메뉴
  ///
  /// In en, this message translates to:
  /// **'Seasoning/Unit Management'**
  String get settingsSeasoningUnitManagement;

  /// 조미료/단위 관리 설명
  ///
  /// In en, this message translates to:
  /// **'Add, edit, delete seasonings/units'**
  String get settingsSeasoningUnitDescription;

  /// 앱 정보 섹션
  ///
  /// In en, this message translates to:
  /// **'App Info'**
  String get settingsAppInfo;

  /// 앱 버전
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settingsVersion;

  /// 라이선스 정보
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get settingsLicense;

  /// 언어 설정 메뉴
  ///
  /// In en, this message translates to:
  /// **'Language Settings'**
  String get settingsLanguage;

  /// 언어 선택 요청
  ///
  /// In en, this message translates to:
  /// **'Please select a language'**
  String get settingsSelectLanguage;

  /// 시스템 언어 옵션
  ///
  /// In en, this message translates to:
  /// **'System Language'**
  String get settingsLanguageSystem;

  /// 한국어 옵션
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get settingsLanguageKorean;

  /// 영어 옵션
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguageEnglish;

  /// 일본어 옵션
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get settingsLanguageJapanese;

  /// 언어 변경 완료 메시지
  ///
  /// In en, this message translates to:
  /// **'Language has been changed'**
  String get settingsLanguageChanged;

  /// 단위 타입 선택 요청
  ///
  /// In en, this message translates to:
  /// **'Please select what type of unit \"{unitName}\" is.'**
  String unitTypeSelection(String unitName);

  /// 자주 사용하는 단위 섹션
  ///
  /// In en, this message translates to:
  /// **'Frequently Used Units'**
  String get unitFrequentlyUsed;

  /// 기본 무게 단위 카테고리
  ///
  /// In en, this message translates to:
  /// **'Weight (Basic)'**
  String get unitWeightBasic;

  /// 사용자 추가 무게 단위 카테고리
  ///
  /// In en, this message translates to:
  /// **'Weight (Custom)'**
  String get unitWeightCustom;

  /// 기본 부피 단위 카테고리
  ///
  /// In en, this message translates to:
  /// **'Volume (Basic)'**
  String get unitVolumeBasic;

  /// 사용자 추가 부피 단위 카테고리
  ///
  /// In en, this message translates to:
  /// **'Volume (Custom)'**
  String get unitVolumeCustom;

  /// 기본 개수 단위 카테고리
  ///
  /// In en, this message translates to:
  /// **'Count (Basic)'**
  String get unitCountBasic;

  /// 사용자 추가 개수 단위 카테고리
  ///
  /// In en, this message translates to:
  /// **'Count (Custom)'**
  String get unitCountCustom;

  /// 기본 기타 단위 카테고리
  ///
  /// In en, this message translates to:
  /// **'Misc (Basic)'**
  String get unitMiscBasic;

  /// 사용자 추가 기타 단위 카테고리
  ///
  /// In en, this message translates to:
  /// **'Misc (Custom)'**
  String get unitMiscCustom;

  /// 기본 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'Basic'**
  String get unitBasic;

  /// 새 단위 추가 완료 메시지
  ///
  /// In en, this message translates to:
  /// **'New unit \"{unitName}\" added to {category} category'**
  String unitNewAdded(String unitName, String category);

  /// 단위 검색 힌트
  ///
  /// In en, this message translates to:
  /// **'Search units...'**
  String get unitSearch;

  /// 새 단위 추가 버튼
  ///
  /// In en, this message translates to:
  /// **'Add new unit: \"{unitName}\"'**
  String unitAddNew(String unitName);

  /// 새 단위 추가 설명
  ///
  /// In en, this message translates to:
  /// **'Add a new unit'**
  String get unitAddNewSubtitle;

  /// 단위 사용 횟수
  ///
  /// In en, this message translates to:
  /// **'{count} times'**
  String unitUsageCount(String count);

  /// 단위 로딩 오류 메시지
  ///
  /// In en, this message translates to:
  /// **'Error loading units'**
  String get unitErrorLoading;

  /// 사용자 추가 단위 설명
  ///
  /// In en, this message translates to:
  /// **'User added unit'**
  String get unitUserAddedDescription;

  /// 단위 사용 횟수 표시
  ///
  /// In en, this message translates to:
  /// **'Used {count} times'**
  String unitUsedTimes(String count);

  /// 그램 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'g'**
  String get unitWeightGrams;

  /// 그램 단위 설명
  ///
  /// In en, this message translates to:
  /// **'grams'**
  String get unitWeightGramsDesc;

  /// 킬로그램 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get unitWeightKilograms;

  /// 킬로그램 단위 설명
  ///
  /// In en, this message translates to:
  /// **'kilograms'**
  String get unitWeightKilogramsDesc;

  /// 밀리그램 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'mg'**
  String get unitWeightMilligrams;

  /// 밀리그램 단위 설명
  ///
  /// In en, this message translates to:
  /// **'milligrams'**
  String get unitWeightMilligramsDesc;

  /// 밀리리터 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'ml'**
  String get unitVolumeMilliliters;

  /// 리터 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'l'**
  String get unitVolumeLiters;

  /// 테이블스푼 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'tbsp'**
  String get unitVolumeTablespoon;

  /// 티스푼 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'tsp'**
  String get unitVolumeTeaspoon;

  /// 컵 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'cup'**
  String get unitVolumeCup;

  /// 드롭 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'drops'**
  String get unitVolumeDrops;

  /// 밀리리터 단위 설명
  ///
  /// In en, this message translates to:
  /// **'milliliters'**
  String get unitVolumeMillilitersDesc;

  /// 리터 단위 설명
  ///
  /// In en, this message translates to:
  /// **'liters'**
  String get unitVolumeLitersDesc;

  /// 테이블스푼 단위 설명
  ///
  /// In en, this message translates to:
  /// **'tablespoon (15ml)'**
  String get unitVolumeTablespoonDesc;

  /// 티스푼 단위 설명
  ///
  /// In en, this message translates to:
  /// **'teaspoon (5ml)'**
  String get unitVolumeTeaspoonDesc;

  /// 컵 단위 설명
  ///
  /// In en, this message translates to:
  /// **'cup (200ml)'**
  String get unitVolumeCupDesc;

  /// 드롭 단위 설명
  ///
  /// In en, this message translates to:
  /// **'drops'**
  String get unitVolumeDropsDesc;

  /// 개수 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'pcs'**
  String get unitCountPieces;

  /// 슬라이스 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'slices'**
  String get unitCountSlices;

  /// 오이 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'cloves'**
  String get unitCountCloves;

  /// 볼 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'balls'**
  String get unitCountBalls;

  /// 컨테이너 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'containers'**
  String get unitCountContainers;

  /// 컨테이너 단위 설명
  ///
  /// In en, this message translates to:
  /// **'containers'**
  String get unitCountContainersDesc;

  /// 묶음 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'bunches'**
  String get unitCountBunches;

  /// 묶음 단위 설명
  ///
  /// In en, this message translates to:
  /// **'bunches'**
  String get unitCountBunchesDesc;

  /// 대 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'stalks'**
  String get unitCountStalks;

  /// 종이 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'sheets'**
  String get unitCountSheets;

  /// 개수 단위 설명
  ///
  /// In en, this message translates to:
  /// **'pieces'**
  String get unitCountPiecesDesc;

  /// 슬라이스 단위 설명
  ///
  /// In en, this message translates to:
  /// **'slices'**
  String get unitCountSlicesDesc;

  /// 오이 단위 설명
  ///
  /// In en, this message translates to:
  /// **'cloves'**
  String get unitCountClovesDesc;

  /// 볼 단위 설명
  ///
  /// In en, this message translates to:
  /// **'balls'**
  String get unitCountBallsDesc;

  /// 대 단위 설명
  ///
  /// In en, this message translates to:
  /// **'stalks'**
  String get unitCountStalksDesc;

  /// 종이 단위 설명
  ///
  /// In en, this message translates to:
  /// **'sheets'**
  String get unitCountSheetsDesc;

  /// 꼬집 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'pinch'**
  String get unitMiscPinch;

  /// 한줌 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'handful'**
  String get unitMiscHandful;

  /// 적당량 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'moderate amount'**
  String get unitMiscModerate;

  /// 조금 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'a little'**
  String get unitMiscLittle;

  /// 약간 단위 라벨
  ///
  /// In en, this message translates to:
  /// **'slightly'**
  String get unitMiscSlightly;

  /// 꼬집 단위 설명
  ///
  /// In en, this message translates to:
  /// **'pinch'**
  String get unitMiscPinchDesc;

  /// 한줌 단위 설명
  ///
  /// In en, this message translates to:
  /// **'handful'**
  String get unitMiscHandfulDesc;

  /// 적당량 단위 설명
  ///
  /// In en, this message translates to:
  /// **'moderate amount'**
  String get unitMiscModerateDesc;

  /// 조금 단위 설명
  ///
  /// In en, this message translates to:
  /// **'a little'**
  String get unitMiscLittleDesc;

  /// 약간 단위 설명
  ///
  /// In en, this message translates to:
  /// **'slightly'**
  String get unitMiscSlightlyDesc;

  /// 무게 카테고리
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get unitCategoryWeight;

  /// 부피 카테고리
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get unitCategoryVolume;

  /// 개수 카테고리
  ///
  /// In en, this message translates to:
  /// **'Count'**
  String get unitCategoryCount;

  /// 기타 카테고리
  ///
  /// In en, this message translates to:
  /// **'Misc'**
  String get unitCategoryMisc;

  /// 타이머 알림 설정
  ///
  /// In en, this message translates to:
  /// **'Timer Notification'**
  String get notificationTimerTitle;

  /// 백그라운드 앱 새로고침 설정
  ///
  /// In en, this message translates to:
  /// **'Background App Refresh'**
  String get notificationBackgroundRefresh;

  /// 백그라운드 앱 새로고침 설명
  ///
  /// In en, this message translates to:
  /// **'Set up for accurate timer notifications'**
  String get notificationBackgroundRefreshDescription;

  /// 알림 활성화 메시지
  ///
  /// In en, this message translates to:
  /// **'Timer notifications activated'**
  String get notificationActivated;

  /// 알림 권한 거부 메시지
  ///
  /// In en, this message translates to:
  /// **'Notification permission denied. You can manually activate it in system settings'**
  String get notificationDenied;

  /// 알림 설정 메뉴
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get notificationSettings;

  /// 알림 활성화 상태
  ///
  /// In en, this message translates to:
  /// **'Timer notifications are enabled'**
  String get notificationEnabled;

  /// 알림 끄기 안내
  ///
  /// In en, this message translates to:
  /// **'To turn off notifications:'**
  String get notificationTurnOff;

  /// 알림 끄기 방법
  ///
  /// In en, this message translates to:
  /// **'1. Open iPhone Settings app\n2. Select Notifications > Recilab\n3. Turn off Allow Notifications'**
  String get notificationTurnOffInstructions;

  /// 알림 끄기 경고
  ///
  /// In en, this message translates to:
  /// **'If you turn off notifications, you will not receive timer completion alerts'**
  String get notificationTurnOffWarning;

  /// 활성화 상태
  ///
  /// In en, this message translates to:
  /// **'Activated'**
  String get notificationActivatedStatus;

  /// 비활성화 상태
  ///
  /// In en, this message translates to:
  /// **'Deactivated'**
  String get notificationDeactivatedStatus;

  /// 설정 열기 버튼
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get notificationOpenSettings;

  /// 설정에서 알림 활성화 요청
  ///
  /// In en, this message translates to:
  /// **'Please enable notifications in settings'**
  String get notificationEnableInSettings;

  /// 알림 권한 거부 메시지
  ///
  /// In en, this message translates to:
  /// **'Notification permission denied'**
  String get notificationPermissionDenied;

  /// 테스트 알림 전송 메시지
  ///
  /// In en, this message translates to:
  /// **'Test notification sent'**
  String get notificationTestSent;

  /// 알림 테스트 기능
  ///
  /// In en, this message translates to:
  /// **'Test Notification'**
  String get notificationTest;

  /// 타이머 알림 채널 제목
  ///
  /// In en, this message translates to:
  /// **'Cooking Timer'**
  String get timerNotificationChannelTitle;

  /// 타이머 알림 채널 설명
  ///
  /// In en, this message translates to:
  /// **'Cooking timer completion notifications'**
  String get timerNotificationChannelDescription;

  /// 타이머 완료 알림 제목
  ///
  /// In en, this message translates to:
  /// **'🍳 {timerName} Complete!'**
  String timerNotificationCompleteTitle(String timerName);

  /// 타이머 완료 알림 내용
  ///
  /// In en, this message translates to:
  /// **'{duration} timer finished.'**
  String timerNotificationCompleteBody(String duration);

  /// 테스트 알림 채널 제목
  ///
  /// In en, this message translates to:
  /// **'Test Notifications'**
  String get timerNotificationTestChannelTitle;

  /// 테스트 알림 채널 설명
  ///
  /// In en, this message translates to:
  /// **'Test notification channel'**
  String get timerNotificationTestChannelDescription;

  /// 테스트 알림 제목
  ///
  /// In en, this message translates to:
  /// **'🧪 Test Notification'**
  String get timerNotificationTestTitle;

  /// 테스트 알림 내용
  ///
  /// In en, this message translates to:
  /// **'This is a test notification. Notifications are working properly!'**
  String get timerNotificationTestBody;

  /// 일반 오류 메시지
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get generalErrorOccurred;

  /// 저장 실패 메시지
  ///
  /// In en, this message translates to:
  /// **'Save failed'**
  String get generalSaveFailed;

  /// 저장 실패 오류 메시지
  ///
  /// In en, this message translates to:
  /// **'Save failed: {error}'**
  String generalSaveFailedWithError(String error);

  /// 카테고리 관리 메뉴
  ///
  /// In en, this message translates to:
  /// **'Category Management'**
  String get generalCategoryManagement;

  /// 카테고리 추가 버튼
  ///
  /// In en, this message translates to:
  /// **'Add Category'**
  String get generalAddCategory;

  /// 재료 카테고리명
  ///
  /// In en, this message translates to:
  /// **'Ingredient'**
  String get generalCategoryIngredient;

  /// 단위 카테고리명
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get generalCategoryUnit;

  /// 양념 카테고리명
  ///
  /// In en, this message translates to:
  /// **'Seasoning'**
  String get generalCategorySeasoning;

  /// 채소 카테고리명
  ///
  /// In en, this message translates to:
  /// **'Vegetable'**
  String get generalCategoryVegetable;

  /// 육류 카테고리명
  ///
  /// In en, this message translates to:
  /// **'Meat'**
  String get generalCategoryMeat;

  /// 해산물 카테고리명
  ///
  /// In en, this message translates to:
  /// **'Seafood'**
  String get generalCategorySeafood;

  /// 유제품 카테고리명
  ///
  /// In en, this message translates to:
  /// **'Dairy'**
  String get generalCategoryDairy;

  /// 곡물 카테고리명
  ///
  /// In en, this message translates to:
  /// **'Grain'**
  String get generalCategoryGrain;

  /// 이름 라벨
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get generalName;

  /// 설명 라벨
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get generalDescription;

  /// 저장 옵션 다이얼로그
  ///
  /// In en, this message translates to:
  /// **'Save Options'**
  String get generalSaveOptions;

  /// 저장 방법 질문
  ///
  /// In en, this message translates to:
  /// **'How would you like to save?'**
  String get generalHowToSave;

  /// 재료 검색 결과 없음 메시지
  ///
  /// In en, this message translates to:
  /// **'No ingredients found'**
  String get ingredientNotFound;

  /// 선택된 재료 개수 표시
  ///
  /// In en, this message translates to:
  /// **'Selected ingredients ({count})'**
  String ingredientSelectedCount(String count);

  /// 레시피 설명이 없을 때 표시되는 메시지
  ///
  /// In en, this message translates to:
  /// **'No description'**
  String get recipeNoDescription;

  /// 전체 삭제 버튼
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get ingredientClearAll;

  /// 파스타 조리 타이머 프리셋
  ///
  /// In en, this message translates to:
  /// **'Pasta Cooking'**
  String get timerPresetPastaCooking;

  /// 파스타 조리 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Standard time for al dente pasta'**
  String get timerPresetPastaCookingDesc;

  /// 파스타 조리 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Standard time for al dente pasta'**
  String get timerPresetPastaCookingDescription;

  /// 계란 조리 타이머 프리셋
  ///
  /// In en, this message translates to:
  /// **'Hard-boiled Egg'**
  String get timerPresetHardBoiledEgg;

  /// 계란 조리 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Fully cooked boiled egg'**
  String get timerPresetHardBoiledEggDesc;

  /// 계란 조리 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Fully cooked boiled egg'**
  String get timerPresetHardBoiledEggDescription;

  /// 계란 조리 타이머 프리셋
  ///
  /// In en, this message translates to:
  /// **'Soft-boiled Egg'**
  String get timerPresetSoftBoiledEgg;

  /// 계란 조리 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Soft-yolk boiled egg'**
  String get timerPresetSoftBoiledEggDesc;

  /// 계란 조리 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Soft-yolk boiled egg'**
  String get timerPresetSoftBoiledEggDescription;

  /// 인스턴트 라면 조리 타이머 프리셋
  ///
  /// In en, this message translates to:
  /// **'Instant Noodle'**
  String get timerPresetInstantNoodle;

  /// 인스턴트 라면 조리 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Standard instant noodle cooking time'**
  String get timerPresetInstantNoodleDesc;

  /// 인스턴트 라면 조리 타이머 프리셋
  ///
  /// In en, this message translates to:
  /// **'Instant Noodles'**
  String get timerPresetInstantNoodles;

  /// 인스턴트 라면 조리 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Standard instant noodle cooking time'**
  String get timerPresetInstantNoodlesDescription;

  /// 차 조리 타이머 프리셋
  ///
  /// In en, this message translates to:
  /// **'Tea Brewing'**
  String get timerPresetTeaBrewing;

  /// 차 조리 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Time for brewing black or green tea'**
  String get timerPresetTeaBrewingDesc;

  /// 차 조리 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Time for brewing black or green tea'**
  String get timerPresetTeaBrewingDescription;

  /// 스테이크 조리 타이머 프리셋
  ///
  /// In en, this message translates to:
  /// **'Steak (Medium)'**
  String get timerPresetSteakMedium;

  /// 스테이크 조리 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Time for each side'**
  String get timerPresetSteakMediumDesc;

  /// 스테이크 조리 타이머 프리셋
  ///
  /// In en, this message translates to:
  /// **'Steak Cooking'**
  String get timerPresetSteakCooking;

  /// 스테이크 조리 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Time for medium-rare steak'**
  String get timerPresetSteakCookingDescription;

  /// 밥 찜 타이머 프리셋
  ///
  /// In en, this message translates to:
  /// **'Rice Steaming'**
  String get timerPresetRiceSteaming;

  /// 밥 찜 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Steaming time after rice is cooked'**
  String get timerPresetRiceSteamingDesc;

  /// 오븐 예열 타이머 프리셋
  ///
  /// In en, this message translates to:
  /// **'Oven Preheating'**
  String get timerPresetOvenPreheating;

  /// 오븐 예열 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Oven preheating time'**
  String get timerPresetOvenPreheatingDesc;

  /// 쿠키 조리 타이머 프리셋
  ///
  /// In en, this message translates to:
  /// **'Cookie Baking'**
  String get timerPresetCookieBaking;

  /// 쿠키 조리 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'General cookie baking time'**
  String get timerPresetCookieBakingDesc;

  /// 찜 타이머 프리셋
  ///
  /// In en, this message translates to:
  /// **'Steaming'**
  String get timerPresetSteaming;

  /// 찜 타이머 프리셋 설명
  ///
  /// In en, this message translates to:
  /// **'Basic steaming time'**
  String get timerPresetSteamingDesc;

  /// 생성 날짜
  ///
  /// In en, this message translates to:
  /// **'Created:'**
  String get dateCreated;

  /// 마지막 업데이트 날짜
  ///
  /// In en, this message translates to:
  /// **'Last Updated:'**
  String get dateLastUpdated;

  /// 버전 선택 버튼
  ///
  /// In en, this message translates to:
  /// **'Select Version'**
  String get versionSelect;

  /// 버전 없음 메시지
  ///
  /// In en, this message translates to:
  /// **'No versions available'**
  String get versionNoVersionsAvailable;

  /// 버전 변경 내용
  ///
  /// In en, this message translates to:
  /// **'Changes'**
  String get versionChanges;

  /// 삭제된 버전
  ///
  /// In en, this message translates to:
  /// **'Deleted Version'**
  String get versionDeleted;

  /// 기반 버전
  ///
  /// In en, this message translates to:
  /// **'Base Version'**
  String get versionBase;

  /// 기반 버전 삭제 메시지
  ///
  /// In en, this message translates to:
  /// **'Base version has been deleted'**
  String get versionBaseDeleted;

  /// 초기 버전 메시지
  ///
  /// In en, this message translates to:
  /// **'This is the initial version'**
  String get versionIsInitial;

  /// 재료 없음 메시지
  ///
  /// In en, this message translates to:
  /// **'No ingredients available'**
  String get ingredientNoIngredientsAvailable;

  /// 요리 단계 없음 메시지
  ///
  /// In en, this message translates to:
  /// **'No cooking steps available'**
  String get cookingStepNoStepsAvailable;

  /// 요리 기록 메뉴
  ///
  /// In en, this message translates to:
  /// **'Cooking Log'**
  String get cookingLog;

  /// 요리 기록 로딩 오류 메시지
  ///
  /// In en, this message translates to:
  /// **'Error occurred while loading cooking logs:'**
  String get cookingLogLoadingError;

  /// 요리 기록 없음 메시지
  ///
  /// In en, this message translates to:
  /// **'No cooking logs yet'**
  String get cookingLogNoLogsAvailable;

  /// 첫 번째 요리 기록 추가 메시지
  ///
  /// In en, this message translates to:
  /// **'Add your first cooking log!'**
  String get cookingLogAddFirstLog;

  /// 카테고리 관리 메뉴
  ///
  /// In en, this message translates to:
  /// **'Category Management'**
  String get seasoningManagement;

  /// 카테고리 추가 버튼
  ///
  /// In en, this message translates to:
  /// **'Add Category'**
  String get seasoningManagementTooltip;

  /// 카테고리 검색 플레이스홀더
  ///
  /// In en, this message translates to:
  /// **'Search category names...'**
  String get seasoningSearchPlaceholder;

  /// 카테고리 라벨
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get seasoningCategoryLabel;

  /// 전체 카테고리 필터
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get seasoningFilterAll;

  /// 검색 결과 없음 메시지
  ///
  /// In en, this message translates to:
  /// **'No search results'**
  String get seasoningNoResults;

  /// 등록된 재료 없음 메시지
  ///
  /// In en, this message translates to:
  /// **'No ingredients registered'**
  String get seasoningEmpty;

  /// 카테고리 추가 메시지
  ///
  /// In en, this message translates to:
  /// **'Add a category!'**
  String get seasoningEmptySubtitle;

  /// 재료 삭제 메시지
  ///
  /// In en, this message translates to:
  /// **'Delete Ingredient'**
  String get seasoningDeleteTitle;

  /// 재료 삭제 확인 메시지
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {name}?\nThis action cannot be undone.'**
  String seasoningDeleteConfirm(String name);

  /// 재료 삭제 버튼
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get seasoningDeleteTooltip;

  /// 항목 추가 메시지
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get seasoningCreateTitle;

  /// 항목 이름 라벨
  ///
  /// In en, this message translates to:
  /// **'Ingredient Name'**
  String get seasoningCreateNameLabel;

  /// 항목 이름 힌트
  ///
  /// In en, this message translates to:
  /// **'e.g., Salt, Sugar, Soy Sauce, etc.'**
  String get seasoningCreateNameHint;

  /// 항목 이름 필수 메시지
  ///
  /// In en, this message translates to:
  /// **'Please enter ingredient name'**
  String get seasoningCreateNameRequired;

  /// 새 카테고리 라벨
  ///
  /// In en, this message translates to:
  /// **'New Category'**
  String get seasoningCreateNewCategory;

  /// 새 카테고리 힌트
  ///
  /// In en, this message translates to:
  /// **'e.g., Basic Seasonings, Special Seasonings, Spices, etc.'**
  String get seasoningCreateCategoryHint;

  /// 항목 설명 라벨
  ///
  /// In en, this message translates to:
  /// **'Description (Optional)'**
  String get seasoningCreateDescriptionLabel;

  /// 항목 설명 힌트
  ///
  /// In en, this message translates to:
  /// **'Brief description of the item'**
  String get seasoningCreateDescriptionHint;

  /// 새 카테고리 추가 제목
  ///
  /// In en, this message translates to:
  /// **'Add New Category'**
  String get categoryCreateTitle;

  /// 카테고리 이름 라벨
  ///
  /// In en, this message translates to:
  /// **'Category Name'**
  String get categoryCreateNameLabel;

  /// 카테고리 이름 힌트
  ///
  /// In en, this message translates to:
  /// **'e.g., Fruits, Nuts, Dairy, etc.'**
  String get categoryCreateNameHint;

  /// 카테고리 이름 필수 메시지
  ///
  /// In en, this message translates to:
  /// **'Please enter category name'**
  String get categoryCreateNameRequired;

  /// 아이콘 선택 라벨
  ///
  /// In en, this message translates to:
  /// **'Select Icon (Optional)'**
  String get categoryCreateIconLabel;

  /// 카테고리 설명 라벨
  ///
  /// In en, this message translates to:
  /// **'Description (Optional)'**
  String get categoryCreateDescriptionLabel;

  /// 카테고리 설명 힌트
  ///
  /// In en, this message translates to:
  /// **'Brief description of the category'**
  String get categoryCreateDescriptionHint;

  /// 생성 액션
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get actionCreate;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
