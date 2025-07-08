// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'レシピラボ';

  @override
  String get navigationRecipes => 'レシピ';

  @override
  String get navigationSearch => '検索';

  @override
  String get navigationTimer => 'タイマー';

  @override
  String get navigationSettings => '設定';

  @override
  String get actionSave => '保存';

  @override
  String get actionCancel => 'キャンセル';

  @override
  String get actionDelete => '削除';

  @override
  String get actionEdit => '編集';

  @override
  String get actionConfirm => '確認';

  @override
  String get actionStart => '開始';

  @override
  String get actionRetry => '再試行';

  @override
  String get actionGoBack => '戻る';

  @override
  String get actionRefresh => '更新';

  @override
  String get recipeAdd => 'レシピ追加';

  @override
  String get recipeEdit => 'レシピ編集';

  @override
  String get recipeDetail => 'レシピ詳細';

  @override
  String get recipeName => 'レシピ名';

  @override
  String get recipeIngredients => '材料';

  @override
  String get recipeCookingSteps => '調理手順';

  @override
  String get recipeEmptyState => 'まだレシピがありません';

  @override
  String get recipeEmptyStateDescription =>
      '美味しいレシピを記録して\nあなただけのバージョンに発展させましょう！';

  @override
  String get recipeDeleteConfirm => 'このレシピを削除しますか？\n\nこの操作は元に戻せません。';

  @override
  String get recipeDeleteSuccess => 'レシピが削除されました';

  @override
  String get recipeDeleteFailed => '削除失敗';

  @override
  String get recipeLoadingError => 'レシピを読み込めません';

  @override
  String get recipeLoading => 'レシピを読み込み中...';

  @override
  String get recipeNewTitle => '新しいレシピ';

  @override
  String get recipeVersionsRequired => 'レシピには少なくとも1つのバージョンが必要です。';

  @override
  String get recipeList => 'レシピ一覧';

  @override
  String get versionCreate => '新しいバージョンを作成';

  @override
  String get versionOverwrite => '既存のバージョンを上書き';

  @override
  String get versionName => 'バージョン名';

  @override
  String get versionNameOptional => 'バージョン名 (任意)';

  @override
  String get versionNameHint => '例: 辛口、砂糖控えめ、ビーガン';

  @override
  String get versionChangeLog => '変更履歴';

  @override
  String get versionChangeLogOptional => '変更履歴 (任意)';

  @override
  String get versionChangeLogHint => '例: 砂糖の量を減らした、野菜を追加した';

  @override
  String get versionDelete => 'バージョンを削除';

  @override
  String get versionDeleteConfirm => '本当にこのバージョンを削除しますか？';

  @override
  String versionDeleteError(String error) {
    return 'バージョン削除中にエラーが発生しました: $error';
  }

  @override
  String get versionSaveAsDerived => '新しいバージョンとして保存';

  @override
  String versionDerivedDescription(String versionName) {
    return '$versionNameから派生した新しいバージョンを作成します';
  }

  @override
  String get versionKeepExisting => '既存のバージョンを保持し、新しいバージョンを作成します';

  @override
  String versionUpdateDescription(String versionName) {
    return '$versionNameを更新します';
  }

  @override
  String get versionUpdateCurrent => '現在のバージョンを更新します';

  @override
  String versionBaseVersion(String versionName) {
    return 'ベースバージョン: $versionName';
  }

  @override
  String versionEditingCurrent(String versionName) {
    return '編集中: $versionName';
  }

  @override
  String get ingredientAdd => '材料を追加';

  @override
  String get ingredientName => '材料名';

  @override
  String get ingredientQuantity => '数量';

  @override
  String get ingredientUnit => '単位';

  @override
  String get ingredientSelectUnit => '単位を選択';

  @override
  String get ingredientSearch => '材料を検索';

  @override
  String get ingredientSearchHint => '材料名を検索してください...';

  @override
  String get ingredientSearchByIngredients => '材料で検索';

  @override
  String get ingredientPopular => 'よく使われる材料';

  @override
  String get ingredientShowPopular => 'よく使われる材料を表示';

  @override
  String get ingredientShowAll => 'すべての材料を表示';

  @override
  String get ingredientSearchResults => '材料検索結果';

  @override
  String get timerStart => '開始';

  @override
  String get timerStop => '停止';

  @override
  String get timerReset => 'リセット';

  @override
  String timerFinished(String duration) {
    return '$durationタイマーが終了しました。';
  }

  @override
  String timerRunning(String count) {
    return '$count個のタイマーが動作中';
  }

  @override
  String timerInProgress(String count) {
    return '$count個進行中';
  }

  @override
  String get timerRunningList => '実行中のタイマー';

  @override
  String get timerCooking => '料理タイマー';

  @override
  String get timerFrequentlyUsed => 'よく使うタイマー';

  @override
  String get timerCustom => 'カスタムタイマー';

  @override
  String get timerCreateCustom => 'カスタムタイマーを作成';

  @override
  String get timerName => 'タイマー名';

  @override
  String get timerNameHint => '例: 卵茹で、お茶を淹れる';

  @override
  String get timerNameRequired => 'タイマー名を入力してください';

  @override
  String get timerTimeRequired => '時間を設定してください';

  @override
  String get timerTimeSetting => '時間設定';

  @override
  String get timerMinutes => '分';

  @override
  String get timerSeconds => '秒';

  @override
  String get timerDescriptionOptional => '説明 (任意)';

  @override
  String get timerDescriptionHint => '例: 朝のお茶に最適な時間';

  @override
  String get timerPresetSave => 'プリセットとして保存';

  @override
  String get timerPresetSaveDescription => '次回簡単に再利用できるよう保存';

  @override
  String timerPresetSaved(String name) {
    return '$nameプリセットが保存されました';
  }

  @override
  String get timerPresetDelete => 'プリセットを削除';

  @override
  String timerPresetDeleteConfirm(String presetName) {
    return '$presetNameプリセットを削除しますか？\n削除されたプリセットは復元できません。';
  }

  @override
  String timerPresetDeleted(String name) {
    return '$nameプリセットが削除されました';
  }

  @override
  String get timerPresetCannotDeleteDefault => 'デフォルトプリセットは削除できません';

  @override
  String get timerPresetAlreadyExists => '同じ名前のプリセットが既に存在します';

  @override
  String get timerPresetSaveFailed => 'プリセットの保存に失敗しました';

  @override
  String get cookingLogAdd => '料理記録を追加';

  @override
  String get cookingLogWrite => '料理記録を書く';

  @override
  String get cookingLogTitle => 'タイトル';

  @override
  String get cookingLogTitleRequired => 'タイトル *';

  @override
  String get cookingLogTitleHint => '料理記録のタイトルを入力してください';

  @override
  String get cookingLogEnterTitle => 'タイトルを入力してください';

  @override
  String get cookingLogDateTime => '料理した日時 *';

  @override
  String get cookingLogSelectDateTime => '日付と時刻を選択してください';

  @override
  String get cookingLogPhoto => '写真';

  @override
  String get cookingLogAddPhoto => '写真を追加';

  @override
  String get cookingLogTakePhoto => 'カメラで撮影';

  @override
  String get cookingLogSelectFromGallery => 'ギャラリーから選択';

  @override
  String get cookingLogMemo => 'メモ';

  @override
  String get cookingLogMemoHint => '料理しながら感じたことや改善点を書いてみてください';

  @override
  String get cookingLogRecipeInfo => 'レシピ情報';

  @override
  String get cookingStepAdd => '手順を追加';

  @override
  String cookingStepNumber(String number) {
    return '$number番目の手順';
  }

  @override
  String get cookingStepDescription => '手順説明';

  @override
  String get searchResults => '検索結果';

  @override
  String get searchReset => '検索をリセット';

  @override
  String get searchNoResults => '選択した材料で作れる\nレシピがありません';

  @override
  String searchRecipesFound(String count) {
    return '$count個のレシピが見つかりました';
  }

  @override
  String get settingsManagement => '管理';

  @override
  String get settingsSeasoningUnitManagement => '調味料/単位管理';

  @override
  String get settingsSeasoningUnitDescription => '調味料/単位の追加、編集、削除';

  @override
  String get settingsAppInfo => 'アプリ情報';

  @override
  String get settingsVersion => 'バージョン';

  @override
  String get settingsLicense => 'ライセンス';

  @override
  String get settingsLanguage => '言語設定';

  @override
  String get settingsSelectLanguage => '言語を選択してください';

  @override
  String get settingsLanguageSystem => 'システム言語';

  @override
  String get settingsLanguageKorean => '韓国語';

  @override
  String get settingsLanguageEnglish => '英語';

  @override
  String get settingsLanguageJapanese => '日本語';

  @override
  String get settingsLanguageChanged => '言語が変更されました';

  @override
  String unitTypeSelection(String unitName) {
    return '\"$unitName\"単位がどのような種類かを選択してください。';
  }

  @override
  String get unitFrequentlyUsed => 'よく使う単位';

  @override
  String get unitWeightBasic => '重量 (基本)';

  @override
  String get unitWeightCustom => '重量 (ユーザー追加)';

  @override
  String get unitVolumeBasic => '体積 (基本)';

  @override
  String get unitVolumeCustom => '体積 (ユーザー追加)';

  @override
  String get unitCountBasic => '個数 (基本)';

  @override
  String get unitCountCustom => '個数 (ユーザー追加)';

  @override
  String get unitMiscBasic => 'その他 (基本)';

  @override
  String get unitMiscCustom => 'その他 (ユーザー追加)';

  @override
  String get unitBasic => '基本';

  @override
  String unitNewAdded(String unitName, String category) {
    return '新しい単位\"$unitName\"が$categoryカテゴリに追加されました';
  }

  @override
  String get unitSearch => '単位を検索...';

  @override
  String unitAddNew(String unitName) {
    return '新しい単位を追加: \"$unitName\"';
  }

  @override
  String get unitAddNewSubtitle => '新しい単位を追加します';

  @override
  String unitUsageCount(String count) {
    return '$count回';
  }

  @override
  String get unitErrorLoading => '単位の読み込み中にエラーが発生しました';

  @override
  String unitUsedTimes(String count) {
    return '$count回使用';
  }

  @override
  String get notificationTimerTitle => 'タイマー通知';

  @override
  String get notificationBackgroundRefresh => 'バックグラウンドアプリ更新';

  @override
  String get notificationBackgroundRefreshDescription => 'タイマー通知が正確に動作するように設定';

  @override
  String get notificationActivated => 'タイマー通知が有効になりました';

  @override
  String get notificationDenied => '通知の権限が拒否されました。システム設定で手動で有効にできます';

  @override
  String get notificationSettings => '通知設定';

  @override
  String get notificationEnabled => 'タイマー通知が有効になっています';

  @override
  String get notificationTurnOff => '通知を無効にしたい場合:';

  @override
  String get notificationTurnOffInstructions =>
      '1. iPhone設定アプリを開く\n2. 通知 > Recilabを選択\n3. 通知を許可をオフにする';

  @override
  String get notificationTurnOffWarning => '通知を無効にすると、タイマー完了時に通知を受け取れません';

  @override
  String get notificationActivatedStatus => '有効';

  @override
  String get notificationDeactivatedStatus => '無効';

  @override
  String get notificationOpenSettings => '設定を開く';

  @override
  String get notificationEnableInSettings => '設定で通知を有効にしてください';

  @override
  String get notificationPermissionDenied => '通知の権限が拒否されました';

  @override
  String get notificationTestSent => 'テスト通知が送信されました';

  @override
  String get notificationTest => '通知テスト';

  @override
  String get timerNotificationChannelTitle => '料理タイマー';

  @override
  String get timerNotificationChannelDescription => '料理タイマー完了通知';

  @override
  String timerNotificationCompleteTitle(String timerName) {
    return '🍳 $timerName 完了！';
  }

  @override
  String timerNotificationCompleteBody(String duration) {
    return '$durationタイマーが終了しました。';
  }

  @override
  String get timerNotificationTestChannelTitle => 'テスト通知';

  @override
  String get timerNotificationTestChannelDescription => 'テスト通知チャンネル';

  @override
  String get timerNotificationTestTitle => '🧪 テスト通知';

  @override
  String get timerNotificationTestBody => 'これはテスト通知です。通知が正常に動作しています！';

  @override
  String get generalErrorOccurred => 'エラーが発生しました';

  @override
  String get generalSaveFailed => '保存に失敗しました';

  @override
  String generalSaveFailedWithError(String error) {
    return '保存に失敗しました: $error';
  }

  @override
  String get generalCategoryManagement => 'カテゴリ管理';

  @override
  String get generalAddCategory => 'カテゴリを追加';

  @override
  String get generalName => '名前';

  @override
  String get generalDescription => '説明';

  @override
  String get generalSaveOptions => '保存オプション';

  @override
  String get generalHowToSave => 'どのように保存しますか？';

  @override
  String get ingredientNotFound => '材料が見つかりません';

  @override
  String ingredientSelectedCount(String count) {
    return '選択された材料 ($count個)';
  }

  @override
  String get recipeNoDescription => '説明がありません';

  @override
  String get ingredientClearAll => 'すべて削除';

  @override
  String get timerPresetPastaCooking => 'パスタ茹で';

  @override
  String get timerPresetPastaCookingDesc => 'アルデンテパスタの標準時間';

  @override
  String get timerPresetPastaCookingDescription => 'アルデンテパスタの標準時間';

  @override
  String get timerPresetHardBoiledEgg => '固茹で卵';

  @override
  String get timerPresetHardBoiledEggDesc => '完全に火を通した茹で卵';

  @override
  String get timerPresetHardBoiledEggDescription => '完全に火を通した茹で卵';

  @override
  String get timerPresetSoftBoiledEgg => '半熟卵';

  @override
  String get timerPresetSoftBoiledEggDesc => '黄身が柔らかい半熟卵';

  @override
  String get timerPresetSoftBoiledEggDescription => '黄身が柔らかい半熟卵';

  @override
  String get timerPresetInstantNoodle => 'インスタントラーメン';

  @override
  String get timerPresetInstantNoodleDesc => '標準インスタントラーメン調理時間';

  @override
  String get timerPresetInstantNoodles => 'インスタントラーメン';

  @override
  String get timerPresetInstantNoodlesDescription => '標準インスタントラーメン調理時間';

  @override
  String get timerPresetTeaBrewing => '茶を淹れる';

  @override
  String get timerPresetTeaBrewingDesc => '紅茶や緑茶を淹れる時間';

  @override
  String get timerPresetTeaBrewingDescription => '紅茶や緑茶の抽出時間';

  @override
  String get timerPresetSteakMedium => 'ステーキ（ミディアム）';

  @override
  String get timerPresetSteakMediumDesc => '両面それぞれ焼く時間';

  @override
  String get timerPresetSteakCooking => 'ステーキ調理';

  @override
  String get timerPresetSteakCookingDescription => 'ミディアムレアステーキの時間';

  @override
  String get timerPresetRiceSteaming => 'ご飯の蒸らし';

  @override
  String get timerPresetRiceSteamingDesc => 'ご飯が完成した後の蒸らし時間';

  @override
  String get timerPresetOvenPreheating => 'オーブン予熱';

  @override
  String get timerPresetOvenPreheatingDesc => 'オーブン予熱時間';

  @override
  String get timerPresetCookieBaking => 'クッキー焼き';

  @override
  String get timerPresetCookieBakingDesc => '一般的なクッキー焼き時間';

  @override
  String get timerPresetSteaming => '蒸し料理';

  @override
  String get timerPresetSteamingDesc => '蒸し器での基本蒸し時間';

  @override
  String get dateCreated => '作成日:';

  @override
  String get dateLastUpdated => '最終更新:';

  @override
  String get versionSelect => 'バージョン選択';

  @override
  String get versionNoVersionsAvailable => '利用可能なバージョンがありません';

  @override
  String get versionChanges => '変更点';

  @override
  String get versionDeleted => '削除されたバージョン';

  @override
  String get versionBase => 'ベースバージョン';

  @override
  String get versionBaseDeleted => 'ベースバージョンが削除されました';

  @override
  String get versionIsInitial => 'これは最初のバージョンです';

  @override
  String get ingredientNoIngredientsAvailable => '利用可能な材料がありません';

  @override
  String get cookingStepNoStepsAvailable => '利用可能な調理手順がありません';

  @override
  String get cookingLog => 'クッキングログ';

  @override
  String get cookingLogLoadingError => 'クッキングログの読み込み中にエラーが発生しました:';

  @override
  String get cookingLogNoLogsAvailable => 'まだクッキングログがありません';

  @override
  String get cookingLogAddFirstLog => '最初のクッキングログを追加してみてください！';
}
