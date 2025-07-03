// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get recipes => '레시피';

  @override
  String get search => '검색';

  @override
  String get timer => '타이머';

  @override
  String get settings => '설정';

  @override
  String get addRecipe => '레시피 추가';

  @override
  String get editRecipe => '레시피 편집';

  @override
  String get recipeDetail => '레시피 상세';

  @override
  String get noRecipesYet => '아직 레시피가 없습니다';

  @override
  String get createSpecialRecipe => '나만의 특별한 소스 레시피를\n만들어보세요!';

  @override
  String get searchIngredients => '재료 검색';

  @override
  String get recipeDeleted => '레시피가 삭제되었습니다';

  @override
  String get confirmDeleteRecipe => '레시피를 삭제하시겠습니까?\n\n이 작업은 되돌릴 수 없습니다.';

  @override
  String get deleteFailed => '삭제 실패';

  @override
  String get save => '저장';

  @override
  String get cancel => '취소';

  @override
  String get delete => '삭제';

  @override
  String get edit => '편집';

  @override
  String get confirm => '확인';

  @override
  String get errorOccurred => '오류가 발생했습니다';

  @override
  String get selectUnit => '단위 선택';

  @override
  String get management => '관리';

  @override
  String get seasoningUnitManagement => '조미료/단위 관리';

  @override
  String get seasoningUnitDescription => '조미료/단위 추가, 수정, 삭제';

  @override
  String get appInfo => '앱 정보';

  @override
  String get version => '버전';

  @override
  String get license => '라이선스';

  @override
  String get timerNotification => '타이머 알림';

  @override
  String get backgroundAppRefresh => '백그라운드 앱 새로고침';

  @override
  String get backgroundAppRefreshDescription => '타이머 알림이 정확히 작동하도록 설정';

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
  String get turnOffInstructions => '1. 아이폰 설정 앱 열기\n2. 알림 > Saucerer 선택\n3. 알림 허용 끄기';

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
  String get deletePreset => '프리셋 삭제';

  @override
  String confirmDeletePreset(String presetName) {
    return '$presetName 프리셋을 삭제하시겠습니까?\n삭제된 프리셋은 복구할 수 없습니다.';
  }

  @override
  String get frequentlyUsedTimers => '자주 사용하는 타이머';

  @override
  String get saveFailed => '저장 실패';

  @override
  String get newRecipe => '새 레시피';

  @override
  String get loadingRecipe => '레시피를 불러오는 중...';

  @override
  String get cannotLoadRecipe => '레시피를 불러올 수 없습니다';

  @override
  String get goBack => '돌아가기';

  @override
  String get recipeName => '레시피 이름';

  @override
  String get cookingSteps => '조리 단계';

  @override
  String get saveOptions => '저장 옵션';

  @override
  String get howToSave => '어떻게 저장하시겠습니까?';

  @override
  String editingVersion(String versionName) {
    return '편집 중: $versionName';
  }

  @override
  String get saveAsNewVersion => '새 버전으로 저장';

  @override
  String createDerivedVersionDescription(String versionName) {
    return '$versionName에서 파생된 새 버전을 생성합니다';
  }

  @override
  String get keepExistingVersion => '기존 버전은 유지하고 새 버전을 생성합니다';

  @override
  String get overwriteVersion => '기존 버전 덮어쓰기';

  @override
  String updateVersionDescription(String versionName) {
    return '$versionName을(를) 업데이트합니다';
  }

  @override
  String get updateCurrentVersion => '현재 버전을 업데이트합니다';

  @override
  String baseVersion(String versionName) {
    return '기반 버전: $versionName';
  }

  @override
  String get versionNameOptional => '버전명 (선택사항)';

  @override
  String get versionNameHint => '예: 라볶이, 설탕 대체제, 매운맛';

  @override
  String get changeLogOptional => '변경사항 (선택사항)';

  @override
  String get changeLogHint => '예: 설탕량 줄임, 야채 추가';

  @override
  String get cookingTimer => '요리 타이머';

  @override
  String get pastaCooking => '파스타 삶기';

  @override
  String get pastaCookingDescription => '표준 파스타 조리 시간';

  @override
  String get hardBoiledEgg => '완숙 계란';

  @override
  String get hardBoiledEggDescription => '완벽한 완숙 계란';

  @override
  String get softBoiledEgg => '반숙 계란';

  @override
  String get softBoiledEggDescription => '부드럽고 흐르는 노른자';

  @override
  String get instantNoodles => '라면';

  @override
  String get instantNoodlesDescription => '빠른 라면 조리';

  @override
  String get teaBrewing => '차 우리기';

  @override
  String get teaBrewingDescription => '완벽한 차 우리는 시간';

  @override
  String get steakCooking => '스테이크 굽기';

  @override
  String get steakCookingDescription => '미디움 레어 스테이크';

  @override
  String get enableNotificationInSettings => '설정에서 알림을 활성화해주세요';

  @override
  String get notificationEnabled => '알림이 활성화되었습니다';

  @override
  String get notificationPermissionDenied => '알림 권한이 거부되었습니다';

  @override
  String get testNotificationSent => '테스트 알림이 전송되었습니다';

  @override
  String get notificationTest => '알림 테스트';

  @override
  String timersRunning(int count) {
    return '$count개 타이머 진행 중';
  }

  @override
  String get runningTimers => '진행 중인 타이먨';

  @override
  String presetDeleted(String name) {
    return '$name 프리셋이 삭제되었습니다';
  }

  @override
  String get cannotDeleteDefaultPreset => '기본 프리셋은 삭제할 수 없습니다';

  @override
  String get customTimer => '커스텀 타이머';

  @override
  String get createCustomTimer => '커스텀 타이멲 만들기';

  @override
  String get enterTimerName => '타이멲 이름을 입력해주세요';

  @override
  String get setTime => '시간을 설정해주세요';

  @override
  String get presetAlreadyExists => '같은 이름의 프리셋이 이미 존재합니다';

  @override
  String get failedToSavePreset => '프리셋 저장에 실패했습니다';

  @override
  String get timerName => '타이멲 이름';

  @override
  String get timerNameHint => '예: 계란 삶기, 차 우리기';

  @override
  String get timeSetting => '시간 설정';

  @override
  String get minutes => '분';

  @override
  String get seconds => '초';

  @override
  String get descriptionOptional => '설명 (선택사항)';

  @override
  String get timerDescriptionHint => '예: 모닝 티에 완벽한 시간';

  @override
  String get saveAsPreset => '프리셋으로 저장';

  @override
  String get saveAsPresetDescription => '다음에 쉽게 재사용할 수 있도록 저장';

  @override
  String get start => '시작';

  @override
  String saveFailedWithError(String error) {
    return '저장 실패: $error';
  }

  @override
  String get addStep => '단계 추가';

  @override
  String stepNumber(int number) {
    return '$number번째 단계';
  }

  @override
  String get writeCookingLog => '쿼킹 로그 작성';

  @override
  String get recipeInfo => '레시피 정보';

  @override
  String get titleRequired => '제목 *';

  @override
  String get cookingLogTitleHint => '쿼킹 로그 제목을 입력하세요';

  @override
  String get enterTitle => '제목을 입력해주세요';

  @override
  String get cookingDateTimeRequired => '요리한 날짜 및 시간 *';

  @override
  String get selectDateTime => '날짜와 시간을 선택하세요';

  @override
  String get photo => '사진';

  @override
  String get addPhoto => '사진 추가';

  @override
  String get takeWithCamera => '카메라로 촬영';

  @override
  String get selectFromGallery => '갤러리에서 선택';

  @override
  String get memo => '메모';

  @override
  String get cookingMemoHint => '요리하면서 느난 점이나 개선사항을 적어보세요';

  @override
  String get searchByIngredients => '재료로 검색';

  @override
  String get resetSearch => '검색 초기화';

  @override
  String get showPopularIngredients => '자주 사용된 재료 보기';

  @override
  String get showAllIngredients => '모든 재료 보기';

  @override
  String get searchIngredientsHint => '재료 이름을 검색하세요...';

  @override
  String get searchResults => '검색 결과';

  @override
  String get noRecipesFound => '선택한 재료로 만들 수 있는\n레시피가 없습니다';

  @override
  String recipesFound(int count) {
    return '$count개의 레시피를 찾았습니다';
  }

  @override
  String get popularIngredients => '자주 사용된 재료';

  @override
  String get searchResultsIngredients => '검색 결과';

  @override
  String get recipeRequiresMinimumVersion => '레시피에는 최소 하나의 버전이 있어야 합니다.';

  @override
  String get deleteVersion => '버전 삭제';

  @override
  String get confirmDeleteVersion => '정말로 이 버전을 삭제하시겠습니까?';

  @override
  String get categoryManagement => '카테고리 관리';

  @override
  String get refresh => '새로고침';

  @override
  String get addCategory => '카테고리 추가';

  @override
  String versionDeleteError(String error) {
    return '버전 삭제 중 오류가 발생했습니다: $error';
  }

  @override
  String get cookingTimerChannel => '요리 타이멲';

  @override
  String get timerNotificationDescription => '요리 타이멲 완료 알림';

  @override
  String timerCompleteTitle(String timerName) {
    return '🍳 $timerName 완료!';
  }

  @override
  String timerCompleteBody(String duration) {
    return '$duration 타이멲가 끝났습니다.';
  }

  @override
  String get testNotificationChannel => '테스트 알림';

  @override
  String get testNotificationDescription => '테스트 알림 채널';

  @override
  String get testNotificationTitle => '🧪 테스트 알림';

  @override
  String get testNotificationBody => '이것은 테스트 알림입니다. 알림이 정상적으로 작동하고 있습니다!';

  @override
  String get recipeList => '레시피 목록';

  @override
  String usedTimes(int count) {
    return '$count회 사용';
  }

  @override
  String get languageSettings => '언어 설정';

  @override
  String get selectLanguage => '언어를 선택하세요';

  @override
  String get systemLanguage => '시스템 언어';

  @override
  String get korean => '한국어';

  @override
  String get english => 'English';

  @override
  String get japanese => '日本語';

  @override
  String get languageChanged => '언어가 변경되었습니다';
}
