// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get recipes => 'Recipes';

  @override
  String get search => 'Search';

  @override
  String get timer => 'Timer';

  @override
  String get settings => 'Settings';

  @override
  String get addRecipe => 'Add Recipe';

  @override
  String get editRecipe => 'Edit Recipe';

  @override
  String get recipeDetail => 'Recipe Detail';

  @override
  String get noRecipesYet => 'No recipes yet';

  @override
  String get createSpecialRecipe => 'Create your own special\nsauce recipe!';

  @override
  String get searchIngredients => 'Search Ingredients';

  @override
  String get recipeDeleted => 'Recipe has been deleted';

  @override
  String get confirmDeleteRecipe => 'Are you sure you want to delete this recipe?\n\nThis action cannot be undone.';

  @override
  String get deleteFailed => 'Delete failed';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get confirm => 'Confirm';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get selectUnit => 'Select Unit';

  @override
  String get management => 'Management';

  @override
  String get seasoningUnitManagement => 'Seasoning/Unit Management';

  @override
  String get seasoningUnitDescription => 'Add, edit, delete seasonings/units';

  @override
  String get appInfo => 'App Info';

  @override
  String get version => 'Version';

  @override
  String get license => 'License';

  @override
  String get timerNotification => 'Timer Notification';

  @override
  String get backgroundAppRefresh => 'Background App Refresh';

  @override
  String get backgroundAppRefreshDescription => 'Set up for accurate timer notifications';

  @override
  String get notificationActivated => '타이머 알림이 활성화되었습니다';

  @override
  String get notificationDenied => '알림 권한이 거부되었습니다. 시스템 설정에서 수동으로 활성화할 수 있습니다';

  @override
  String get notificationSettings => '알림 설정';

  @override
  String get timerNotificationEnabled => '타이머 알림이 활성화되어 있습니다';

  @override
  String get toTurnOffNotifications => '알림을 끄고 싶다면:';

  @override
  String get turnOffInstructions => '1. 아이폰 설정 앱 열기 2. 알림 > Saucerer 선택 3. 알림 허용 끄기';

  @override
  String get turnOffWarning => '알림을 끄면 타이머 완료 시 알림을 받을 수 없습니다';

  @override
  String get activated => '활성화됨';

  @override
  String get deactivated => '비활성화됨';

  @override
  String get openSettings => '설정 열기';

  @override
  String unitTypeSelection(Object unitName) {
    return '\"$unitName\" 단위가 어떤 종류인지 선택해주세요.';
  }

  @override
  String get frequently_used_units => '자주 사용하는 단위';

  @override
  String get weight_basic => '무게 (기본)';

  @override
  String get weight_custom => '무게 (사용자 추가)';

  @override
  String get volume_basic => '부피 (기본)';

  @override
  String get volume_custom => '부피 (사용자 추가)';

  @override
  String get count_basic => '개수 (기본)';

  @override
  String get count_custom => '개수 (사용자 추가)';

  @override
  String get misc_basic => '기타 (기본)';

  @override
  String get misc_custom => '기타 (사용자 추가)';

  @override
  String get basic => '기본';

  @override
  String newUnitAdded(Object category, Object unitName) {
    return '새 단위 \"$unitName\"이(가) $category 카테고리에 추가되었습니다';
  }

  @override
  String get unitSearch => '단위 검색...';

  @override
  String addNewUnit(Object unitName) {
    return '새 단위 추가: \"$unitName\"';
  }

  @override
  String get addNewUnitSubtitle => '새로운 단위를 추가합니다';

  @override
  String usageCount(Object count) {
    return '$count회';
  }

  @override
  String get errorLoadingUnits => '단위를 불러오는 중 오류가 발생했습니다';

  @override
  String get retry => '다시 시도';

  @override
  String timerFinished(Object duration) {
    return '$duration 타이머가 끝났습니다.';
  }

  @override
  String presetSaved(Object name) {
    return '$name 프리셋이 저장되었습니다';
  }

  @override
  String timersInProgress(Object count) {
    return '$count개 진행중';
  }

  @override
  String get createNewVersion => '새 버전 생성';

  @override
  String get overwriteExistingVersion => '기존 버전 덮어쓰기';

  @override
  String get versionName => '버전 이름';

  @override
  String get changeLog => '변경 사항';

  @override
  String createDerivedVersion(Object versionName) {
    return '$versionName에서 파생된 새 버전을 생성합니다';
  }

  @override
  String updateVersion(Object versionName) {
    return '$versionName을(를) 업데이트합니다';
  }

  @override
  String get ingredients => '재료';

  @override
  String get steps => '조리 과정';

  @override
  String get unit => '단위';

  @override
  String get quantity => '수량';

  @override
  String get name => '이름';

  @override
  String get description => '설명';

  @override
  String get cookingLog => '요리 기록';

  @override
  String get addCookingLog => '요리 기록 추가';

  @override
  String get deletePreset => 'Delete Preset';

  @override
  String confirmDeletePreset(String presetName) {
    return 'Are you sure you want to delete the $presetName preset?\nDeleted presets cannot be recovered.';
  }

  @override
  String get frequentlyUsedTimers => 'Frequently Used Timers';

  @override
  String get saveFailed => 'Save failed';

  @override
  String get newRecipe => 'New Recipe';

  @override
  String get loadingRecipe => 'Loading recipe...';

  @override
  String get cannotLoadRecipe => 'Cannot load recipe';

  @override
  String get goBack => 'Go Back';

  @override
  String get recipeName => 'Recipe Name';

  @override
  String get cookingSteps => 'Cooking Steps';

  @override
  String get saveOptions => 'Save Options';

  @override
  String get howToSave => 'How would you like to save?';

  @override
  String editingVersion(String versionName) {
    return 'Editing: $versionName';
  }

  @override
  String get saveAsNewVersion => 'Save as New Version';

  @override
  String createDerivedVersionDescription(String versionName) {
    return 'Create a new version derived from $versionName';
  }

  @override
  String get keepExistingVersion => 'Keep the existing version and create a new version';

  @override
  String get overwriteVersion => 'Overwrite Existing Version';

  @override
  String updateVersionDescription(String versionName) {
    return 'Update $versionName';
  }

  @override
  String get updateCurrentVersion => 'Update the current version';

  @override
  String baseVersion(String versionName) {
    return 'Base version: $versionName';
  }

  @override
  String get versionNameOptional => 'Version Name (Optional)';

  @override
  String get versionNameHint => 'e.g., Spicy, Less Sugar, Vegan';

  @override
  String get changeLogOptional => 'Change Log (Optional)';

  @override
  String get changeLogHint => 'e.g., Reduced sugar, Added vegetables';

  @override
  String get cookingTimer => 'Cooking Timer';

  @override
  String get pastaCooking => 'Pasta Cooking';

  @override
  String get pastaCookingDescription => 'Standard pasta cooking time';

  @override
  String get hardBoiledEgg => 'Hard-boiled Egg';

  @override
  String get hardBoiledEggDescription => 'Perfect hard-boiled egg';

  @override
  String get softBoiledEgg => 'Soft-boiled Egg';

  @override
  String get softBoiledEggDescription => 'Soft and runny egg yolk';

  @override
  String get instantNoodles => 'Instant Noodles';

  @override
  String get instantNoodlesDescription => 'Quick instant noodles';

  @override
  String get teaBrewing => 'Tea Brewing';

  @override
  String get teaBrewingDescription => 'Perfect tea steeping time';

  @override
  String get steakCooking => 'Steak Cooking';

  @override
  String get steakCookingDescription => 'Medium-rare steak';

  @override
  String get enableNotificationInSettings => 'Please enable notifications in settings';

  @override
  String get notificationEnabled => 'Notifications enabled';

  @override
  String get notificationPermissionDenied => 'Notification permission denied';

  @override
  String get testNotificationSent => 'Test notification sent';

  @override
  String get notificationTest => 'Test Notification';

  @override
  String timersRunning(int count) {
    return '$count timers running';
  }

  @override
  String get runningTimers => 'Running Timers';

  @override
  String presetDeleted(String name) {
    return '$name preset deleted';
  }

  @override
  String get cannotDeleteDefaultPreset => 'Cannot delete default preset';

  @override
  String get customTimer => 'Custom Timer';

  @override
  String get createCustomTimer => 'Create Custom Timer';

  @override
  String get enterTimerName => 'Please enter timer name';

  @override
  String get setTime => 'Please set time';

  @override
  String get presetAlreadyExists => 'Preset with same name already exists';

  @override
  String get failedToSavePreset => 'Failed to save preset';

  @override
  String get timerName => 'Timer Name';

  @override
  String get timerNameHint => 'e.g., Egg boiling, Tea brewing';

  @override
  String get timeSetting => 'Time Setting';

  @override
  String get minutes => 'Minutes';

  @override
  String get seconds => 'Seconds';

  @override
  String get descriptionOptional => 'Description (Optional)';

  @override
  String get timerDescriptionHint => 'e.g., Perfect for morning tea';

  @override
  String get saveAsPreset => 'Save as Preset';

  @override
  String get saveAsPresetDescription => 'Save for easy reuse next time';

  @override
  String get start => 'Start';

  @override
  String saveFailedWithError(String error) {
    return 'Save failed: $error';
  }

  @override
  String get addStep => 'Add Step';

  @override
  String stepNumber(int number) {
    return 'Step $number';
  }

  @override
  String get writeCookingLog => 'Write Cooking Log';

  @override
  String get recipeInfo => 'Recipe Information';

  @override
  String get titleRequired => 'Title *';

  @override
  String get cookingLogTitleHint => 'Enter cooking log title';

  @override
  String get enterTitle => 'Please enter a title';

  @override
  String get cookingDateTimeRequired => 'Cooking Date & Time *';

  @override
  String get selectDateTime => 'Select date and time';

  @override
  String get photo => 'Photo';

  @override
  String get addPhoto => 'Add Photo';

  @override
  String get takeWithCamera => 'Take with Camera';

  @override
  String get selectFromGallery => 'Select from Gallery';

  @override
  String get memo => 'Memo';

  @override
  String get cookingMemoHint => 'Write down your thoughts or improvements while cooking';

  @override
  String get searchByIngredients => 'Search by Ingredients';

  @override
  String get resetSearch => 'Reset Search';

  @override
  String get showPopularIngredients => 'Show Popular Ingredients';

  @override
  String get showAllIngredients => 'Show All Ingredients';

  @override
  String get searchIngredientsHint => 'Search ingredient names...';

  @override
  String get searchResults => 'Search Results';

  @override
  String get noRecipesFound => 'No recipes can be made\nwith selected ingredients';

  @override
  String recipesFound(int count) {
    return '$count recipes found';
  }

  @override
  String get popularIngredients => 'Popular Ingredients';

  @override
  String get searchResultsIngredients => 'Search Results';

  @override
  String get recipeRequiresMinimumVersion => 'Recipe must have at least one version.';

  @override
  String get deleteVersion => 'Delete Version';

  @override
  String get confirmDeleteVersion => 'Are you sure you want to delete this version?';

  @override
  String get categoryManagement => 'Category Management';

  @override
  String get refresh => 'Refresh';

  @override
  String get addCategory => 'Add Category';

  @override
  String versionDeleteError(String error) {
    return 'Error occurred while deleting version: $error';
  }

  @override
  String get cookingTimerChannel => 'Cooking Timer';

  @override
  String get timerNotificationDescription => 'Cooking timer completion notifications';

  @override
  String timerCompleteTitle(String timerName) {
    return '🍳 $timerName Complete!';
  }

  @override
  String timerCompleteBody(String duration) {
    return '$duration timer finished.';
  }

  @override
  String get testNotificationChannel => 'Test Notifications';

  @override
  String get testNotificationDescription => 'Test notification channel';

  @override
  String get testNotificationTitle => '🧪 Test Notification';

  @override
  String get testNotificationBody => 'This is a test notification. Notifications are working properly!';

  @override
  String get recipeList => 'Recipe List';

  @override
  String usedTimes(int count) {
    return 'Used $count times';
  }

  @override
  String get languageSettings => 'Language Settings';

  @override
  String get selectLanguage => 'Please select a language';

  @override
  String get systemLanguage => 'System Language';

  @override
  String get korean => '한국어';

  @override
  String get english => 'English';

  @override
  String get japanese => '日本語';

  @override
  String get languageChanged => 'Language has been changed';
}
