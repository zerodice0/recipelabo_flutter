// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => '레시피라보';

  @override
  String get navigationRecipes => '레시피';

  @override
  String get navigationSearch => '검색';

  @override
  String get navigationTimer => '타이머';

  @override
  String get navigationSettings => '설정';

  @override
  String get actionSave => '저장';

  @override
  String get actionCancel => '취소';

  @override
  String get actionDelete => '삭제';

  @override
  String get actionEdit => '편집';

  @override
  String get actionConfirm => '확인';

  @override
  String get actionStart => '시작';

  @override
  String get actionRetry => '다시 시도';

  @override
  String get actionGoBack => '돌아가기';

  @override
  String get actionRefresh => '새로고침';

  @override
  String get recipeAdd => '레시피 추가';

  @override
  String get recipeEdit => '레시피 편집';

  @override
  String get recipeDetail => '레시피 상세';

  @override
  String get recipeName => '레시피 이름';

  @override
  String get recipeIngredients => '재료';

  @override
  String get recipeCookingSteps => '조리 과정';

  @override
  String get recipeEmptyState => '아직 레시피가 없습니다';

  @override
  String get recipeEmptyStateDescription => '맛있는 레시피를 기록하고\n나만의 버전으로 발전시켜보세요!';

  @override
  String get recipeDeleteConfirm => '레시피를 삭제하시겠습니까?\n\n이 작업은 되돌릴 수 없습니다.';

  @override
  String get recipeDeleteSuccess => '레시피가 삭제되었습니다';

  @override
  String get recipeDeleteFailed => '삭제 실패';

  @override
  String get recipeLoadingError => '레시피를 불러올 수 없습니다';

  @override
  String get recipeLoading => '레시피를 불러오는 중...';

  @override
  String get recipeNewTitle => '새 레시피';

  @override
  String get recipeVersionsRequired => '레시피에는 최소 하나의 버전이 있어야 합니다.';

  @override
  String get recipeList => '레시피 목록';

  @override
  String get versionCreate => '새 버전 생성';

  @override
  String get versionOverwrite => '기존 버전 덮어쓰기';

  @override
  String get versionName => '버전 이름';

  @override
  String get versionNameOptional => '버전명 (선택사항)';

  @override
  String get versionNameHint => '예: 매운맛, 설탕 덜 넣은, 비건';

  @override
  String get versionChangeLog => '변경 사항';

  @override
  String get versionChangeLogOptional => '변경사항 (선택사항)';

  @override
  String get versionChangeLogHint => '예: 설탕량 줄임, 야채 추가';

  @override
  String get versionDelete => '버전 삭제';

  @override
  String get versionDeleteConfirm => '정말로 이 버전을 삭제하시겠습니까?';

  @override
  String versionDeleteError(String error) {
    return '버전 삭제 중 오류가 발생했습니다: $error';
  }

  @override
  String get versionSaveAsDerived => '새 버전으로 저장';

  @override
  String versionDerivedDescription(String versionName) {
    return '$versionName에서 파생된 새 버전을 생성합니다';
  }

  @override
  String get versionKeepExisting => '기존 버전은 유지하고 새 버전을 생성합니다';

  @override
  String versionUpdateDescription(String versionName) {
    return '$versionName을(를) 업데이트합니다';
  }

  @override
  String get versionUpdateCurrent => '현재 버전을 업데이트합니다';

  @override
  String get ingredientSearchOrAddHint => '재료를 검색하거나 새로 추가하세요...';

  @override
  String get ingredientUserAdded => '사용자 추가 재료';

  @override
  String ingredientNewAdded(String name) {
    return '새 재료 \"$name\"이(가) 추가되었습니다';
  }

  @override
  String get ingredientQuantityLabel => '양';

  @override
  String get ingredientUnitLabel => '단위';

  @override
  String ingredientAddNew(String name) {
    return '새 재료 추가: \"$name\"';
  }

  @override
  String get ingredientAddNewSubtitle => '새로운 재료를 추가합니다';

  @override
  String get ingredientSearchPlaceholder => '재료를 입력하여 검색하세요';

  @override
  String get ingredientLoadingError => '재료를 불러오는 중 오류가 발생했습니다';

  @override
  String versionBaseVersion(String versionName) {
    return '기반 버전: $versionName';
  }

  @override
  String versionEditingCurrent(String versionName) {
    return '편집 중: $versionName';
  }

  @override
  String get ingredientAdd => '재료 추가';

  @override
  String get ingredientName => '재료명';

  @override
  String get ingredientQuantity => '수량';

  @override
  String get ingredientUnit => '단위';

  @override
  String get ingredientSelectUnit => '단위 선택';

  @override
  String get ingredientSearch => '재료 검색';

  @override
  String get ingredientSearchHint => '재료 이름을 검색하세요...';

  @override
  String get ingredientSearchByIngredients => '재료로 검색';

  @override
  String get ingredientPopular => '자주 사용된 재료';

  @override
  String get ingredientShowPopular => '자주 사용된 재료 보기';

  @override
  String get ingredientShowAll => '모든 재료 보기';

  @override
  String get ingredientSearchResults => '재료 검색 결과';

  @override
  String get timerStart => '시작';

  @override
  String get timerStop => '정지';

  @override
  String get timerReset => '재설정';

  @override
  String timerFinished(String duration) {
    return '$duration 타이머가 끝났습니다.';
  }

  @override
  String timerRunning(String count) {
    return '$count개 타이머 진행 중';
  }

  @override
  String get timerPaused => '일시정지';

  @override
  String get timerCompleted => '완료';

  @override
  String get timerCancelled => '취소됨';

  @override
  String get timerStatusRunning => '진행 중';

  @override
  String get timerCompleteStatus => '완료!';

  @override
  String get timerRemainingTime => '남은 시간';

  @override
  String get timerTotalTime => '전체 시간';

  @override
  String timerInProgress(String count) {
    return '$count개 진행중';
  }

  @override
  String get timerRunningList => '진행 중인 타이머';

  @override
  String get timerCooking => '요리 타이머';

  @override
  String get timerFrequentlyUsed => '자주 사용하는 타이머';

  @override
  String get timerCustom => '커스텀 타이머';

  @override
  String get timerCreateCustom => '커스텀 타이머 만들기';

  @override
  String get timerName => '타이머 이름';

  @override
  String get timerNameHint => '예: 계란 삶기, 차 우리기';

  @override
  String get timerNameRequired => '타이머 이름을 입력해주세요';

  @override
  String get timerTimeRequired => '시간을 설정해주세요';

  @override
  String get timerTimeSetting => '시간 설정';

  @override
  String get timerMinutes => '분';

  @override
  String get timerSeconds => '초';

  @override
  String get timerDescriptionOptional => '설명 (선택사항)';

  @override
  String get timerDescriptionHint => '예: 모닝 티에 완벽한 시간';

  @override
  String get timerPresetSave => '프리셋으로 저장';

  @override
  String get timerPresetSaveDescription => '다음에 쉽게 재사용할 수 있도록 저장';

  @override
  String timerPresetSaved(String name) {
    return '$name 프리셋이 저장되었습니다';
  }

  @override
  String get timerPresetDelete => '프리셋 삭제';

  @override
  String timerPresetDeleteConfirm(String presetName) {
    return '$presetName 프리셋을 삭제하시겠습니까?\n삭제된 프리셋은 복구할 수 없습니다.';
  }

  @override
  String timerPresetDeleted(String name) {
    return '$name 프리셋이 삭제되었습니다';
  }

  @override
  String get timerPresetCannotDeleteDefault => '기본 프리셋은 삭제할 수 없습니다';

  @override
  String get timerPresetAlreadyExists => '같은 이름의 프리셋이 이미 존재합니다';

  @override
  String get timerPresetSaveFailed => '프리셋 저장에 실패했습니다';

  @override
  String get cookingLogAdd => '요리 기록 추가';

  @override
  String get cookingLogWrite => '요리 기록 작성';

  @override
  String get cookingLogTitle => '제목';

  @override
  String get cookingLogTitleRequired => '제목 *';

  @override
  String get cookingLogTitleHint => '요리 기록 제목을 입력하세요';

  @override
  String get cookingLogEnterTitle => '제목을 입력해주세요';

  @override
  String get cookingLogDateTime => '요리한 날짜 및 시간 *';

  @override
  String get cookingLogSelectDateTime => '날짜와 시간을 선택하세요';

  @override
  String get cookingLogPhoto => '사진';

  @override
  String get cookingLogAddPhoto => '사진 추가';

  @override
  String get cookingLogTakePhoto => '카메라로 촬영';

  @override
  String get cookingLogSelectFromGallery => '갤러리에서 선택';

  @override
  String get cookingLogMemo => '메모';

  @override
  String get cookingLogMemoHint => '요리하면서 느낀 점이나 개선사항을 적어보세요';

  @override
  String get cookingLogRecipeInfo => '레시피 정보';

  @override
  String get cookingStepAdd => '단계 추가';

  @override
  String cookingStepNumber(String number) {
    return '$number번째 단계';
  }

  @override
  String get cookingStepDescription => '단계 설명';

  @override
  String get searchResults => '검색 결과';

  @override
  String get searchRecipeResults => '레시피 검색 결과';

  @override
  String get searchReset => '검색 초기화';

  @override
  String get searchNoResults => '선택한 재료로 만들 수 있는\n레시피가 없습니다';

  @override
  String searchRecipesFound(String count) {
    return '$count개의 레시피를 찾았습니다';
  }

  @override
  String get settingsManagement => '관리';

  @override
  String get settingsSeasoningUnitManagement => '조미료/단위 관리';

  @override
  String get settingsSeasoningUnitDescription => '조미료/단위 추가, 수정, 삭제';

  @override
  String get settingsAppInfo => '앱 정보';

  @override
  String get settingsVersion => '버전';

  @override
  String get settingsLicense => '라이선스';

  @override
  String get settingsLanguage => '언어 설정';

  @override
  String get settingsSelectLanguage => '언어를 선택하세요';

  @override
  String get settingsLanguageSystem => '시스템 언어';

  @override
  String get settingsLanguageKorean => '한국어';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLanguageJapanese => '日本語';

  @override
  String get settingsLanguageChanged => '언어가 변경되었습니다';

  @override
  String unitTypeSelection(String unitName) {
    return '\"$unitName\" 단위가 어떤 종류인지 선택해주세요.';
  }

  @override
  String get unitFrequentlyUsed => '자주 사용하는 단위';

  @override
  String get unitWeightBasic => '무게 (기본)';

  @override
  String get unitWeightCustom => '무게 (사용자 추가)';

  @override
  String get unitVolumeBasic => '부피 (기본)';

  @override
  String get unitVolumeCustom => '부피 (사용자 추가)';

  @override
  String get unitCountBasic => '개수 (기본)';

  @override
  String get unitCountCustom => '개수 (사용자 추가)';

  @override
  String get unitMiscBasic => '기타 (기본)';

  @override
  String get unitMiscCustom => '기타 (사용자 추가)';

  @override
  String get unitBasic => '기본';

  @override
  String unitNewAdded(String unitName, String category) {
    return '새 단위 \"$unitName\"이(가) $category 카테고리에 추가되었습니다';
  }

  @override
  String get unitSearch => '단위 검색...';

  @override
  String unitAddNew(String unitName) {
    return '새 단위 추가: \"$unitName\"';
  }

  @override
  String get unitAddNewSubtitle => '새로운 단위를 추가합니다';

  @override
  String unitUsageCount(String count) {
    return '$count회';
  }

  @override
  String get unitErrorLoading => '단위를 불러오는 중 오류가 발생했습니다';

  @override
  String unitUsedTimes(String count) {
    return '$count회 사용';
  }

  @override
  String get unitWeightGrams => 'g';

  @override
  String get unitWeightGramsDesc => '그램';

  @override
  String get unitWeightKilograms => 'kg';

  @override
  String get unitWeightKilogramsDesc => '킬로그램';

  @override
  String get unitWeightMilligrams => 'mg';

  @override
  String get unitWeightMilligramsDesc => '밀리그램';

  @override
  String get unitVolumeMilliliters => 'ml';

  @override
  String get unitVolumeLiters => 'l';

  @override
  String get unitVolumeTablespoon => '큰술';

  @override
  String get unitVolumeTeaspoon => '작은술';

  @override
  String get unitVolumeCup => '컵';

  @override
  String get unitVolumeDrops => '방울';

  @override
  String get unitVolumeMillilitersDesc => '밀리리터';

  @override
  String get unitVolumeLitersDesc => '리터';

  @override
  String get unitVolumeTablespoonDesc => '큰술 (15ml)';

  @override
  String get unitVolumeTeaspoonDesc => '작은술 (5ml)';

  @override
  String get unitVolumeCupDesc => '컵 (200ml)';

  @override
  String get unitVolumeDropsDesc => '방울';

  @override
  String get unitCountPieces => '개';

  @override
  String get unitCountSlices => '조각';

  @override
  String get unitCountCloves => '쪽';

  @override
  String get unitCountBalls => '알';

  @override
  String get unitCountContainers => '통';

  @override
  String get unitCountContainersDesc => '통';

  @override
  String get unitCountBunches => '포기';

  @override
  String get unitCountBunchesDesc => '포기';

  @override
  String get unitCountStalks => '줄기';

  @override
  String get unitCountSheets => '장';

  @override
  String get unitCountPiecesDesc => '개';

  @override
  String get unitCountSlicesDesc => '조각';

  @override
  String get unitCountClovesDesc => '쪽';

  @override
  String get unitCountBallsDesc => '알';

  @override
  String get unitCountStalksDesc => '줄기';

  @override
  String get unitCountSheetsDesc => '장';

  @override
  String get unitMiscPinch => '꼬집';

  @override
  String get unitMiscHandful => '한 줌';

  @override
  String get unitMiscModerate => '적당량';

  @override
  String get unitMiscLittle => '조금';

  @override
  String get unitMiscSlightly => '약간';

  @override
  String get unitMiscPinchDesc => '꼬집';

  @override
  String get unitMiscHandfulDesc => '한 줌';

  @override
  String get unitMiscModerateDesc => '적당량';

  @override
  String get unitMiscLittleDesc => '조금';

  @override
  String get unitMiscSlightlyDesc => '약간';

  @override
  String get unitCategoryWeight => '무게';

  @override
  String get unitCategoryVolume => '부피';

  @override
  String get unitCategoryCount => '개수';

  @override
  String get unitCategoryMisc => '기타';

  @override
  String get notificationTimerTitle => '타이머 알림';

  @override
  String get notificationBackgroundRefresh => '백그라운드 앱 새로고침';

  @override
  String get notificationBackgroundRefreshDescription => '타이머 알림이 정확히 작동하도록 설정';

  @override
  String get notificationActivated => '타이머 알림이 활성화되었습니다';

  @override
  String get notificationDenied => '알림 권한이 거부되었습니다. 시스템 설정에서 수동으로 활성화할 수 있습니다';

  @override
  String get notificationSettings => '알림 설정';

  @override
  String get notificationEnabled => '타이머 알림이 활성화되어 있습니다';

  @override
  String get notificationTurnOff => '알림을 끄고 싶다면:';

  @override
  String get notificationTurnOffInstructions =>
      '1. 아이폰 설정 앱 열기\n2. 알림 > Recilab 선택\n3. 알림 허용 끄기';

  @override
  String get notificationTurnOffWarning => '알림을 끄면 타이머 완료 시 알림을 받을 수 없습니다';

  @override
  String get notificationActivatedStatus => '활성화됨';

  @override
  String get notificationDeactivatedStatus => '비활성화됨';

  @override
  String get notificationOpenSettings => '설정 열기';

  @override
  String get notificationEnableInSettings => '설정에서 알림을 활성화해주세요';

  @override
  String get notificationPermissionDenied => '알림 권한이 거부되었습니다';

  @override
  String get notificationTestSent => '테스트 알림이 전송되었습니다';

  @override
  String get notificationTest => '알림 테스트';

  @override
  String get timerNotificationChannelTitle => '요리 타이머';

  @override
  String get timerNotificationChannelDescription => '요리 타이머 완료 알림';

  @override
  String timerNotificationCompleteTitle(String timerName) {
    return '🍳 $timerName 완료!';
  }

  @override
  String timerNotificationCompleteBody(String duration) {
    return '$duration 타이머가 끝났습니다.';
  }

  @override
  String get timerNotificationTestChannelTitle => '테스트 알림';

  @override
  String get timerNotificationTestChannelDescription => '테스트 알림 채널';

  @override
  String get timerNotificationTestTitle => '🧪 테스트 알림';

  @override
  String get timerNotificationTestBody => '이것은 테스트 알림입니다. 알림이 정상적으로 작동하고 있습니다!';

  @override
  String get generalErrorOccurred => '오류가 발생했습니다';

  @override
  String get generalSaveFailed => '저장 실패';

  @override
  String generalSaveFailedWithError(String error) {
    return '저장 실패: $error';
  }

  @override
  String get generalCategoryManagement => '카테고리 관리';

  @override
  String get generalAddCategory => '카테고리 추가';

  @override
  String get generalName => '이름';

  @override
  String get generalDescription => '설명';

  @override
  String get generalSaveOptions => '저장 옵션';

  @override
  String get generalHowToSave => '어떻게 저장하시겠습니까?';

  @override
  String get ingredientNotFound => '재료를 찾을 수 없습니다';

  @override
  String ingredientSelectedCount(String count) {
    return '선택된 재료 ($count개)';
  }

  @override
  String get recipeNoDescription => '설명이 없습니다';

  @override
  String get ingredientClearAll => '전체 삭제';

  @override
  String get timerPresetPastaCooking => '파스타 면 삶기';

  @override
  String get timerPresetPastaCookingDesc => '알덴테 파스타를 위한 표준 시간';

  @override
  String get timerPresetPastaCookingDescription => '알덴테 파스타를 위한 표준 시간';

  @override
  String get timerPresetHardBoiledEgg => '달걀 완숙';

  @override
  String get timerPresetHardBoiledEggDesc => '완전히 익힌 삶은 달걀';

  @override
  String get timerPresetHardBoiledEggDescription => '완전히 익힌 삶은 달걀';

  @override
  String get timerPresetSoftBoiledEgg => '달걀 반숙';

  @override
  String get timerPresetSoftBoiledEggDesc => '노른자가 부드러운 반숙 달걀';

  @override
  String get timerPresetSoftBoiledEggDescription => '노른자가 부드러운 반숙 달걀';

  @override
  String get timerPresetInstantNoodle => '라면 끓이기';

  @override
  String get timerPresetInstantNoodleDesc => '표준 라면 조리 시간';

  @override
  String get timerPresetInstantNoodles => '라면 끓이기';

  @override
  String get timerPresetInstantNoodlesDescription => '표준 라면 조리 시간';

  @override
  String get timerPresetTeaBrewing => '차 우리기';

  @override
  String get timerPresetTeaBrewingDesc => '홍차나 녹차 우리는 시간';

  @override
  String get timerPresetTeaBrewingDescription => '홍차나 녹차 우리는 시간';

  @override
  String get timerPresetSteakMedium => '스테이크 굽기 (미디엄)';

  @override
  String get timerPresetSteakMediumDesc => '양면 각각 굽는 시간';

  @override
  String get timerPresetSteakCooking => '스테이크 굽기 (미디엄)';

  @override
  String get timerPresetSteakCookingDescription => '양면 각각 굽는 시간';

  @override
  String get timerPresetRiceSteaming => '밥 뜸들이기';

  @override
  String get timerPresetRiceSteamingDesc => '밥솥 밥이 완성된 후 뜸들이는 시간';

  @override
  String get timerPresetOvenPreheating => '빵 굽기 예열';

  @override
  String get timerPresetOvenPreheatingDesc => '오븐 예열 시간';

  @override
  String get timerPresetCookieBaking => '쿠키 굽기';

  @override
  String get timerPresetCookieBakingDesc => '일반적인 쿠키 굽는 시간';

  @override
  String get timerPresetSteaming => '찜 요리';

  @override
  String get timerPresetSteamingDesc => '찜기에서 찌는 기본 시간';

  @override
  String get dateCreated => '생성일:';

  @override
  String get dateLastUpdated => '최근 업데이트:';

  @override
  String get versionSelect => '버전 선택';

  @override
  String get versionNoVersionsAvailable => '버전이 없습니다';

  @override
  String get versionChanges => '변경 사항';

  @override
  String get versionDeleted => '삭제된 버전';

  @override
  String get versionBase => '기반 버전';

  @override
  String get versionBaseDeleted => '기반 버전이 삭제되었습니다';

  @override
  String get versionIsInitial => '초기 버전';

  @override
  String get ingredientNoIngredientsAvailable => '재료가 없습니다';

  @override
  String get cookingStepNoStepsAvailable => '조리 단계가 없습니다';

  @override
  String get cookingLog => '요리 기록';

  @override
  String get cookingLogLoadingError => '요리 기록을 불러오는 중 오류가 발생했습니다:';

  @override
  String get cookingLogNoLogsAvailable => '아직 요리 기록이 없습니다';

  @override
  String get cookingLogAddFirstLog => '첫 번째 요리 기록을 추가해주세요!';

  @override
  String get seasoningManagement => '카테고리 관리';

  @override
  String get seasoningManagementTooltip => '카테고리 추가';

  @override
  String get seasoningSearchPlaceholder => '카테고리 이름을 검색하세요...';

  @override
  String get seasoningCategoryLabel => '카테고리';

  @override
  String get seasoningFilterAll => '전체';

  @override
  String get seasoningNoResults => '검색 결과가 없습니다';

  @override
  String get seasoningEmpty => '등록된 재료가 없습니다';

  @override
  String get seasoningEmptySubtitle => '카테고리를 추가해보세요!';

  @override
  String get seasoningDeleteTitle => '재료 삭제';

  @override
  String seasoningDeleteConfirm(String name) {
    return '$name을(를) 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.';
  }

  @override
  String get seasoningDeleteTooltip => '삭제';

  @override
  String get seasoningCreateTitle => '항목 추가';

  @override
  String get seasoningCreateNameLabel => '재료 이름';

  @override
  String get seasoningCreateNameHint => '예: 소금, 설탕, 간장 등';

  @override
  String get seasoningCreateNameRequired => '재료 이름을 입력해주세요';

  @override
  String get seasoningCreateNewCategory => '새 카테고리';

  @override
  String get seasoningCreateCategoryHint => '예: 기본양념, 특수양념, 향신료 등';

  @override
  String get seasoningCreateDescriptionLabel => '설명 (선택사항)';

  @override
  String get seasoningCreateDescriptionHint => '항목에 대한 간단한 설명';
}
