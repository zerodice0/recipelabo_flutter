// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get navigationRecipes => 'Recipes';

  @override
  String get navigationSearch => 'Search';

  @override
  String get navigationTimer => 'Timer';

  @override
  String get navigationSettings => 'Settings';

  @override
  String get actionSave => 'Save';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionEdit => 'Edit';

  @override
  String get actionConfirm => 'Confirm';

  @override
  String get actionStart => 'Start';

  @override
  String get actionRetry => 'Retry';

  @override
  String get actionGoBack => 'Go Back';

  @override
  String get actionRefresh => 'Refresh';

  @override
  String get recipeAdd => 'Add Recipe';

  @override
  String get recipeEdit => 'Edit Recipe';

  @override
  String get recipeDetail => 'Recipe Detail';

  @override
  String get recipeName => 'Recipe Name';

  @override
  String get recipeIngredients => 'Ingredients';

  @override
  String get recipeCookingSteps => 'Cooking Steps';

  @override
  String get recipeEmptyState => 'No recipes yet';

  @override
  String get recipeEmptyStateDescription =>
      'Record delicious recipes and\ndevelop them into your own versions!';

  @override
  String get recipeDeleteConfirm =>
      'Are you sure you want to delete this recipe?\n\nThis action cannot be undone.';

  @override
  String get recipeDeleteSuccess => 'Recipe has been deleted';

  @override
  String get recipeDeleteFailed => 'Delete failed';

  @override
  String get recipeLoadingError => 'Cannot load recipe';

  @override
  String get recipeLoading => 'Loading recipe...';

  @override
  String get recipeNewTitle => 'New Recipe';

  @override
  String get recipeVersionsRequired => 'Recipe must have at least one version.';

  @override
  String get recipeList => 'Recipe List';

  @override
  String get versionCreate => 'Create New Version';

  @override
  String get versionOverwrite => 'Overwrite Existing Version';

  @override
  String get versionName => 'Version Name';

  @override
  String get versionNameOptional => 'Version Name (Optional)';

  @override
  String get versionNameHint => 'e.g., Spicy, Less Sugar, Vegan';

  @override
  String get versionChangeLog => 'Change Log';

  @override
  String get versionChangeLogOptional => 'Change Log (Optional)';

  @override
  String get versionChangeLogHint => 'e.g., Reduced sugar, Added vegetables';

  @override
  String get versionDelete => 'Delete Version';

  @override
  String get versionDeleteConfirm =>
      'Are you sure you want to delete this version?';

  @override
  String versionDeleteError(String error) {
    return 'Error occurred while deleting version: $error';
  }

  @override
  String get versionSaveAsDerived => 'Save as New Version';

  @override
  String versionDerivedDescription(String versionName) {
    return 'Create a new version derived from $versionName';
  }

  @override
  String get versionKeepExisting =>
      'Keep the existing version and create a new version';

  @override
  String versionUpdateDescription(String versionName) {
    return 'Update $versionName';
  }

  @override
  String get versionUpdateCurrent => 'Update the current version';

  @override
  String versionBaseVersion(String versionName) {
    return 'Base version: $versionName';
  }

  @override
  String versionEditingCurrent(String versionName) {
    return 'Editing: $versionName';
  }

  @override
  String get ingredientAdd => 'Add Ingredient';

  @override
  String get ingredientName => 'Ingredient Name';

  @override
  String get ingredientQuantity => 'Quantity';

  @override
  String get ingredientUnit => 'Unit';

  @override
  String get ingredientSelectUnit => 'Select Unit';

  @override
  String get ingredientSearch => 'Search Ingredients';

  @override
  String get ingredientSearchHint => 'Search ingredient names...';

  @override
  String get ingredientSearchByIngredients => 'Search by Ingredients';

  @override
  String get ingredientPopular => 'Popular Ingredients';

  @override
  String get ingredientShowPopular => 'Show Popular Ingredients';

  @override
  String get ingredientShowAll => 'Show All Ingredients';

  @override
  String get ingredientSearchResults => 'Ingredient Search Results';

  @override
  String get timerStart => 'Start';

  @override
  String get timerStop => 'Stop';

  @override
  String get timerReset => 'Reset';

  @override
  String timerFinished(String duration) {
    return '$duration timer finished.';
  }

  @override
  String timerRunning(String count) {
    return '$count timers running';
  }

  @override
  String timerInProgress(String count) {
    return '$count in progress';
  }

  @override
  String get timerRunningList => 'Running Timers';

  @override
  String get timerCooking => 'Cooking Timer';

  @override
  String get timerFrequentlyUsed => 'Frequently Used Timers';

  @override
  String get timerCustom => 'Custom Timer';

  @override
  String get timerCreateCustom => 'Create Custom Timer';

  @override
  String get timerName => 'Timer Name';

  @override
  String get timerNameHint => 'e.g., Egg boiling, Tea brewing';

  @override
  String get timerNameRequired => 'Please enter timer name';

  @override
  String get timerTimeRequired => 'Please set time';

  @override
  String get timerTimeSetting => 'Time Setting';

  @override
  String get timerMinutes => 'Minutes';

  @override
  String get timerSeconds => 'Seconds';

  @override
  String get timerDescriptionOptional => 'Description (Optional)';

  @override
  String get timerDescriptionHint => 'e.g., Perfect for morning tea';

  @override
  String get timerPresetSave => 'Save as Preset';

  @override
  String get timerPresetSaveDescription => 'Save for easy reuse next time';

  @override
  String timerPresetSaved(String name) {
    return '$name preset saved';
  }

  @override
  String get timerPresetDelete => 'Delete Preset';

  @override
  String timerPresetDeleteConfirm(String presetName) {
    return 'Are you sure you want to delete the $presetName preset?\nDeleted presets cannot be recovered.';
  }

  @override
  String timerPresetDeleted(String name) {
    return '$name preset deleted';
  }

  @override
  String get timerPresetCannotDeleteDefault => 'Cannot delete default preset';

  @override
  String get timerPresetAlreadyExists => 'Preset with same name already exists';

  @override
  String get timerPresetSaveFailed => 'Failed to save preset';

  @override
  String get timerPresetPastaCooking => 'Pasta Cooking';

  @override
  String get timerPresetPastaCookingDescription =>
      'Standard pasta cooking time';

  @override
  String get timerPresetHardBoiledEgg => 'Hard-boiled Egg';

  @override
  String get timerPresetHardBoiledEggDescription => 'Perfect hard-boiled egg';

  @override
  String get timerPresetSoftBoiledEgg => 'Soft-boiled Egg';

  @override
  String get timerPresetSoftBoiledEggDescription => 'Soft and runny egg yolk';

  @override
  String get timerPresetInstantNoodles => 'Instant Noodles';

  @override
  String get timerPresetInstantNoodlesDescription => 'Quick instant noodles';

  @override
  String get timerPresetTeaBrewing => 'Tea Brewing';

  @override
  String get timerPresetTeaBrewingDescription => 'Perfect tea steeping time';

  @override
  String get timerPresetSteakCooking => 'Steak Cooking';

  @override
  String get timerPresetSteakCookingDescription => 'Medium-rare steak';

  @override
  String get cookingLogAdd => 'Add Cooking Log';

  @override
  String get cookingLogWrite => 'Write Cooking Log';

  @override
  String get cookingLogTitle => 'Title';

  @override
  String get cookingLogTitleRequired => 'Title *';

  @override
  String get cookingLogTitleHint => 'Enter cooking log title';

  @override
  String get cookingLogEnterTitle => 'Please enter a title';

  @override
  String get cookingLogDateTime => 'Cooking Date & Time *';

  @override
  String get cookingLogSelectDateTime => 'Select date and time';

  @override
  String get cookingLogPhoto => 'Photo';

  @override
  String get cookingLogAddPhoto => 'Add Photo';

  @override
  String get cookingLogTakePhoto => 'Take with Camera';

  @override
  String get cookingLogSelectFromGallery => 'Select from Gallery';

  @override
  String get cookingLogMemo => 'Memo';

  @override
  String get cookingLogMemoHint =>
      'Write down your thoughts or improvements while cooking';

  @override
  String get cookingLogRecipeInfo => 'Recipe Information';

  @override
  String get cookingStepAdd => 'Add Step';

  @override
  String cookingStepNumber(String number) {
    return 'Step $number';
  }

  @override
  String get cookingStepDescription => 'Step Description';

  @override
  String get searchResults => 'Search Results';

  @override
  String get searchReset => 'Reset Search';

  @override
  String get searchNoResults =>
      'No recipes can be made\nwith selected ingredients';

  @override
  String searchRecipesFound(String count) {
    return '$count recipes found';
  }

  @override
  String get settingsManagement => 'Management';

  @override
  String get settingsSeasoningUnitManagement => 'Seasoning/Unit Management';

  @override
  String get settingsSeasoningUnitDescription =>
      'Add, edit, delete seasonings/units';

  @override
  String get settingsAppInfo => 'App Info';

  @override
  String get settingsVersion => 'Version';

  @override
  String get settingsLicense => 'License';

  @override
  String get settingsLanguage => 'Language Settings';

  @override
  String get settingsSelectLanguage => 'Please select a language';

  @override
  String get settingsLanguageSystem => 'System Language';

  @override
  String get settingsLanguageKorean => 'Korean';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLanguageJapanese => 'Japanese';

  @override
  String get settingsLanguageChanged => 'Language has been changed';

  @override
  String unitTypeSelection(String unitName) {
    return 'Please select what type of unit \"$unitName\" is.';
  }

  @override
  String get unitFrequentlyUsed => 'Frequently Used Units';

  @override
  String get unitWeightBasic => 'Weight (Basic)';

  @override
  String get unitWeightCustom => 'Weight (Custom)';

  @override
  String get unitVolumeBasic => 'Volume (Basic)';

  @override
  String get unitVolumeCustom => 'Volume (Custom)';

  @override
  String get unitCountBasic => 'Count (Basic)';

  @override
  String get unitCountCustom => 'Count (Custom)';

  @override
  String get unitMiscBasic => 'Misc (Basic)';

  @override
  String get unitMiscCustom => 'Misc (Custom)';

  @override
  String get unitBasic => 'Basic';

  @override
  String unitNewAdded(String unitName, String category) {
    return 'New unit \"$unitName\" added to $category category';
  }

  @override
  String get unitSearch => 'Search units...';

  @override
  String unitAddNew(String unitName) {
    return 'Add new unit: \"$unitName\"';
  }

  @override
  String get unitAddNewSubtitle => 'Add a new unit';

  @override
  String unitUsageCount(String count) {
    return '$count times';
  }

  @override
  String get unitErrorLoading => 'Error loading units';

  @override
  String unitUsedTimes(String count) {
    return 'Used $count times';
  }

  @override
  String get notificationTimerTitle => 'Timer Notification';

  @override
  String get notificationBackgroundRefresh => 'Background App Refresh';

  @override
  String get notificationBackgroundRefreshDescription =>
      'Set up for accurate timer notifications';

  @override
  String get notificationActivated => 'Timer notifications activated';

  @override
  String get notificationDenied =>
      'Notification permission denied. You can manually activate it in system settings';

  @override
  String get notificationSettings => 'Notification Settings';

  @override
  String get notificationEnabled => 'Timer notifications are enabled';

  @override
  String get notificationTurnOff => 'To turn off notifications:';

  @override
  String get notificationTurnOffInstructions =>
      '1. Open iPhone Settings app\n2. Select Notifications > Recipick\n3. Turn off Allow Notifications';

  @override
  String get notificationTurnOffWarning =>
      'If you turn off notifications, you will not receive timer completion alerts';

  @override
  String get notificationActivatedStatus => 'Activated';

  @override
  String get notificationDeactivatedStatus => 'Deactivated';

  @override
  String get notificationOpenSettings => 'Open Settings';

  @override
  String get notificationEnableInSettings =>
      'Please enable notifications in settings';

  @override
  String get notificationPermissionDenied => 'Notification permission denied';

  @override
  String get notificationTestSent => 'Test notification sent';

  @override
  String get notificationTest => 'Test Notification';

  @override
  String get timerNotificationChannelTitle => 'Cooking Timer';

  @override
  String get timerNotificationChannelDescription =>
      'Cooking timer completion notifications';

  @override
  String timerNotificationCompleteTitle(String timerName) {
    return '🍳 $timerName Complete!';
  }

  @override
  String timerNotificationCompleteBody(String duration) {
    return '$duration timer finished.';
  }

  @override
  String get timerNotificationTestChannelTitle => 'Test Notifications';

  @override
  String get timerNotificationTestChannelDescription =>
      'Test notification channel';

  @override
  String get timerNotificationTestTitle => '🧪 Test Notification';

  @override
  String get timerNotificationTestBody =>
      'This is a test notification. Notifications are working properly!';

  @override
  String get generalErrorOccurred => 'An error occurred';

  @override
  String get generalSaveFailed => 'Save failed';

  @override
  String generalSaveFailedWithError(String error) {
    return 'Save failed: $error';
  }

  @override
  String get generalCategoryManagement => 'Category Management';

  @override
  String get generalAddCategory => 'Add Category';

  @override
  String get generalName => 'Name';

  @override
  String get generalDescription => 'Description';

  @override
  String get generalSaveOptions => 'Save Options';

  @override
  String get generalHowToSave => 'How would you like to save?';

  @override
  String get ingredientNotFound => 'No ingredients found';

  @override
  String ingredientSelectedCount(String count) {
    return 'Selected ingredients ($count)';
  }

  @override
  String get ingredientClearAll => 'Clear All';
}
