// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get recipes => 'レシピ';

  @override
  String get search => '検索';

  @override
  String get timer => 'タイマー';

  @override
  String get settings => '設定';

  @override
  String get addRecipe => 'レシピ追加';

  @override
  String get editRecipe => 'レシピ編集';

  @override
  String get recipeDetail => 'レシピ詳細';

  @override
  String get noRecipesYet => 'まだレシピがありません';

  @override
  String get createSpecialRecipe => 'あなただけの特別な\nソースレシピを作ってみましょう！';

  @override
  String get searchIngredients => '材料検索';

  @override
  String get recipeDeleted => 'レシピが削除されました';

  @override
  String get confirmDeleteRecipe => 'このレシピを削除しますか？\n\nこの操作は元に戻せません。';

  @override
  String get deleteFailed => '削除失敗';

  @override
  String get save => '保存';

  @override
  String get cancel => 'キャンセル';

  @override
  String get delete => '削除';

  @override
  String get edit => '編集';

  @override
  String get confirm => '確認';

  @override
  String get errorOccurred => 'エラーが発生しました';

  @override
  String get selectUnit => '単位選択';

  @override
  String get management => '管理';

  @override
  String get seasoningUnitManagement => '調味料/単位管理';

  @override
  String get seasoningUnitDescription => '調味料/単位の追加、編集、削除';

  @override
  String get appInfo => 'アプリ情報';

  @override
  String get version => 'バージョン';

  @override
  String get license => 'ライセンス';

  @override
  String get timerNotification => 'タイマー通知';

  @override
  String get backgroundAppRefresh => 'バックグラウンドアプリ更新';

  @override
  String get backgroundAppRefreshDescription => 'タイマー通知が正確に作動するよう設定';

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
  String get deletePreset => 'プリセット削除';

  @override
  String confirmDeletePreset(String presetName) {
    return '$presetNameプリセットを削除しますか？\n削除されたプリセットは復元できません。';
  }

  @override
  String get frequentlyUsedTimers => 'よく使うタイマー';

  @override
  String get saveFailed => '保存失敗';

  @override
  String get newRecipe => '新しいレシピ';

  @override
  String get loadingRecipe => 'レシピを読み込み中...';

  @override
  String get cannotLoadRecipe => 'レシピを読み込めません';

  @override
  String get goBack => '戻る';

  @override
  String get recipeName => 'レシピ名';

  @override
  String get cookingSteps => '調理手順';

  @override
  String get saveOptions => '保存オプション';

  @override
  String get howToSave => 'どのように保存しますか？';

  @override
  String editingVersion(String versionName) {
    return '編集中: $versionName';
  }

  @override
  String get saveAsNewVersion => '新しいバージョンとして保存';

  @override
  String createDerivedVersionDescription(String versionName) {
    return '$versionNameから派生した新しいバージョンを作成します';
  }

  @override
  String get keepExistingVersion => '既存のバージョンを維持し、新しいバージョンを作成します';

  @override
  String get overwriteVersion => '既存のバージョンを上書き';

  @override
  String updateVersionDescription(String versionName) {
    return '$versionNameを更新します';
  }

  @override
  String get updateCurrentVersion => '現在のバージョンを更新します';

  @override
  String baseVersion(String versionName) {
    return 'ベースバージョン: $versionName';
  }

  @override
  String get versionNameOptional => 'バージョン名（任意）';

  @override
  String get versionNameHint => '例: スパイシー、砂糖控えめ、ビーガン';

  @override
  String get changeLogOptional => '変更内容（任意）';

  @override
  String get changeLogHint => '例: 砂糖量を減らした、野菜を追加';

  @override
  String get cookingTimer => '料理タイマー';

  @override
  String get pastaCooking => 'パスタ茹で';

  @override
  String get pastaCookingDescription => '標準パスタ調理時間';

  @override
  String get hardBoiledEgg => '固ゆで卵';

  @override
  String get hardBoiledEggDescription => '完璧な固ゆで卵';

  @override
  String get softBoiledEgg => '半熟卵';

  @override
  String get softBoiledEggDescription => 'やわらかい黄身';

  @override
  String get instantNoodles => 'インスタント麺';

  @override
  String get instantNoodlesDescription => '簡単インスタント麺';

  @override
  String get teaBrewing => 'お茶を入れる';

  @override
  String get teaBrewingDescription => '完璧なお茶の時間';

  @override
  String get steakCooking => 'ステーキ調理';

  @override
  String get steakCookingDescription => 'ミディアムレアステーキ';

  @override
  String get enableNotificationInSettings => '設定で通知を有効にしてください';

  @override
  String get notificationEnabled => '通知が有効になりました';

  @override
  String get notificationPermissionDenied => '通知権限が拒否されました';

  @override
  String get testNotificationSent => 'テスト通知が送信されました';

  @override
  String get notificationTest => '通知テスト';

  @override
  String timersRunning(int count) {
    return '$count個のタイマーが進行中';
  }

  @override
  String get runningTimers => '進行中のタイマー';

  @override
  String presetDeleted(String name) {
    return '$nameプリセットが削除されました';
  }

  @override
  String get cannotDeleteDefaultPreset => 'デフォルトプリセットは削除できません';

  @override
  String get customTimer => 'カスタムタイマー';

  @override
  String get createCustomTimer => 'カスタムタイマー作成';

  @override
  String get enterTimerName => 'タイマー名を入力してください';

  @override
  String get setTime => '時間を設定してください';

  @override
  String get presetAlreadyExists => '同じ名前のプリセットが既に存在します';

  @override
  String get failedToSavePreset => 'プリセットの保存に失敗しました';

  @override
  String get timerName => 'タイマー名';

  @override
  String get timerNameHint => '例: 卵ゆで、お茶を入れる';

  @override
  String get timeSetting => '時間設定';

  @override
  String get minutes => '分';

  @override
  String get seconds => '秒';

  @override
  String get descriptionOptional => '説明（任意）';

  @override
  String get timerDescriptionHint => '例: 朝のお茶に完璧な時間';

  @override
  String get saveAsPreset => 'プリセットとして保存';

  @override
  String get saveAsPresetDescription => '次回簡単に再利用できるように保存';

  @override
  String get start => '開始';

  @override
  String saveFailedWithError(String error) {
    return '保存失敗: $error';
  }

  @override
  String get addStep => '手順追加';

  @override
  String stepNumber(int number) {
    return '$number番目の手順';
  }

  @override
  String get writeCookingLog => '料理ログ作成';

  @override
  String get recipeInfo => 'レシピ情報';

  @override
  String get titleRequired => 'タイトル *';

  @override
  String get cookingLogTitleHint => '料理ログのタイトルを入力してください';

  @override
  String get enterTitle => 'タイトルを入力してください';

  @override
  String get cookingDateTimeRequired => '料理日時 *';

  @override
  String get selectDateTime => '日時を選択してください';

  @override
  String get photo => '写真';

  @override
  String get addPhoto => '写真追加';

  @override
  String get takeWithCamera => 'カメラで撮影';

  @override
  String get selectFromGallery => 'ギャラリーから選択';

  @override
  String get memo => 'メモ';

  @override
  String get cookingMemoHint => '料理中に感じたことや改善点を書いてください';

  @override
  String get searchByIngredients => '材料で検索';

  @override
  String get resetSearch => '検索リセット';

  @override
  String get showPopularIngredients => '人気の材料を表示';

  @override
  String get showAllIngredients => 'すべての材料を表示';

  @override
  String get searchIngredientsHint => '材料名を検索...';

  @override
  String get searchResults => '検索結果';

  @override
  String get noRecipesFound => '選択した材料で作れる\nレシピがありません';

  @override
  String recipesFound(int count) {
    return '$count件のレシピが見つかりました';
  }

  @override
  String get popularIngredients => '人気の材料';

  @override
  String get searchResultsIngredients => '検索結果';

  @override
  String get recipeRequiresMinimumVersion => 'レシピには最低一つのバージョンが必要です。';

  @override
  String get deleteVersion => 'バージョン削除';

  @override
  String get confirmDeleteVersion => '本当にこのバージョンを削除しますか？';

  @override
  String get categoryManagement => 'カテゴリ管理';

  @override
  String get refresh => '更新';

  @override
  String get addCategory => 'カテゴリ追加';

  @override
  String versionDeleteError(String error) {
    return 'バージョン削除中にエラーが発生しました: $error';
  }

  @override
  String get cookingTimerChannel => '料理タイマー';

  @override
  String get timerNotificationDescription => '料理タイマー完了通知';

  @override
  String timerCompleteTitle(String timerName) {
    return '🍳 $timerName 完了！';
  }

  @override
  String timerCompleteBody(String duration) {
    return '$duration タイマーが終了しました。';
  }

  @override
  String get testNotificationChannel => 'テスト通知';

  @override
  String get testNotificationDescription => 'テスト通知チャンネル';

  @override
  String get testNotificationTitle => '🧪 テスト通知';

  @override
  String get testNotificationBody => 'これはテスト通知です。通知が正常に動作しています！';

  @override
  String get recipeList => 'レシピ一覧';

  @override
  String usedTimes(int count) {
    return '$count回使用';
  }
}
