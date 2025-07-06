import 'dart:convert';
import 'dart:io';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';

/// 하드코딩된 문자열을 Google Sheets에 업로드하는 스크립트
///
/// 사용법:
/// 1. scripts/service-account-key.json 파일 준비
/// 2. dart scripts/upload_to_sheets.dart
/// 3. 또는 서비스 계정 JSON을 환경변수로: GOOGLE_SERVICE_ACCOUNT_JSON=path/to/key.json dart scripts/upload_to_sheets.dart

class SheetsUploader {
  // 스프레드시트 ID (URL에서 추출)
  static const String spreadsheetId =
      '1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns';

  final SheetsApi sheetsApi;

  SheetsUploader(this.sheetsApi);

  /// 서비스 계정을 사용한 인증
  static Future<SheetsUploader> create() async {
    // .env 파일에서 환경변수 로드 시도
    await _loadEnvFile();

    final serviceAccountFile = File('scripts/service-account-key.json');

    if (!serviceAccountFile.existsSync()) {
      throw Exception('''
서비스 계정 JSON 파일을 찾을 수 없습니다: scripts/service-account-key.json

다음을 수행해주세요:
1. scripts/service-account-key.json 파일 생성

Google Cloud Console에서 서비스 계정 키를 다운로드하는 방법:
1. https://console.cloud.google.com/ 접속
2. API 및 서비스 > 사용자 인증 정보
3. 서비스 계정 선택 > 키 > 새 키 만들기 > JSON
''');
    }

    final serviceAccountJson = await serviceAccountFile.readAsString();

    final credentials = ServiceAccountCredentials.fromJson(
      jsonDecode(serviceAccountJson),
    );

    final client = await clientViaServiceAccount(
      credentials,
      [SheetsApi.spreadsheetsScope], // 읽기/쓰기 권한 필요
    );

    final sheetsApi = SheetsApi(client);
    return SheetsUploader(sheetsApi);
  }

  /// .env 파일에서 환경변수 로드
  static Future<void> _loadEnvFile() async {
    try {
      final envFile = File('.env');
      if (await envFile.exists()) {
        final lines = await envFile.readAsLines();
        for (final line in lines) {
          final trimmed = line.trim();
          if (trimmed.isEmpty || trimmed.startsWith('#')) continue;

          final splitIndex = trimmed.indexOf('=');
          if (splitIndex == -1) continue;

          final key = trimmed.substring(0, splitIndex).trim();
          final value = trimmed.substring(splitIndex + 1).trim();

          // 환경변수가 아직 설정되지 않은 경우에만 설정
          if (Platform.environment[key] == null) {
            Platform.environment[key] = value;
          }
        }
        print('✅ .env 파일에서 환경변수를 로드했습니다.');
      }
    } catch (e) {
      // .env 파일이 없거나 읽기 실패는 무시 (환경변수로 대체 가능)
      print('💡 .env 파일을 찾을 수 없습니다. 시스템 환경변수를 사용합니다.');
    }
  }

  /// 하드코딩된 문자열 데이터 로드
  Map<String, String> loadHardcodedStrings() {
    // 여기에 스캔된 하드코딩 문자열들을 포함합니다
    return {
      // 메인 네비게이션
      'recipes': '레시피',
      'search': '검색',
      'timer': '타이머',
      'settings': '설정',

      // 레시피 관련
      'addRecipe': '레시피 추가',
      'editRecipe': '레시피 편집',
      'recipeDetail': '레시피 상세',
      'noRecipesYet': '아직 레시피가 없습니다',
      'createSpecialRecipe': '나만의 특별한 소스 레시피를\\n만들어보세요!',
      'searchIngredients': '재료 검색',
      'recipeDeleted': '레시피가 삭제되었습니다',
      'confirmDeleteRecipe': '레시피를 삭제하시겠습니까?\\n\\n이 작업은 되돌릴 수 없습니다.',
      'deleteFailed': '삭제 실패',

      // 일반 UI
      'save': '저장',
      'cancel': '취소',
      'delete': '삭제',
      'edit': '편집',
      'confirm': '확인',
      'errorOccurred': '오류가 발생했습니다',
      'selectUnit': '단위 선택',

      // 설정 화면
      'management': '관리',
      'seasoningUnitManagement': '조미료/단위 관리',
      'seasoningUnitDescription': '조미료/단위 추가, 수정, 삭제',
      'appInfo': '앱 정보',
      'version': '버전',
      'license': '라이선스',
      'timerNotification': '타이머 알림',
      'backgroundAppRefresh': '백그라운드 앱 새로고침',
      'backgroundAppRefreshDescription': '타이머 알림이 정확히 작동하도록 설정',

      // 알림 관련
      'notificationActivated': '타이머 알림이 활성화되었습니다',
      'notificationDenied': '알림 권한이 거부되었습니다. 시스템 설정에서 수동으로 활성화할 수 있습니다',
      'notificationSettings': '알림 설정',
      'timerNotificationEnabled': '타이머 알림이 활성화되어 있습니다',
      'toTurnOffNotifications': '알림을 끄고 싶다면:',
      'turnOffInstructions':
          '1. 아이폰 설정 앱 열기\\n2. 알림 > Recipick 선택\\n3. 알림 허용 끄기',
      'turnOffWarning': '알림을 끄면 타이머 완료 시 알림을 받을 수 없습니다',
      'activated': '활성화됨',
      'deactivated': '비활성화됨',
      'openSettings': '설정 열기',

      // 단위 관련
      'unitTypeSelection': '"{unitName}" 단위가 어떤 종류인지 선택해주세요.',
      'frequently_used_units': '자주 사용하는 단위',
      'weight_basic': '무게 (기본)',
      'weight_custom': '무게 (사용자 추가)',
      'volume_basic': '부피 (기본)',
      'volume_custom': '부피 (사용자 추가)',
      'count_basic': '개수 (기본)',
      'count_custom': '개수 (사용자 추가)',
      'misc_basic': '기타 (기본)',
      'misc_custom': '기타 (사용자 추가)',
      'basic': '기본',
      'newUnitAdded': '새 단위 "{unitName}"이(가) {category} 카테고리에 추가되었습니다',
      'unitSearch': '단위 검색...',
      'addNewUnit': '새 단위 추가: "{unitName}"',
      'addNewUnitSubtitle': '새로운 단위를 추가합니다',
      'usageCount': '{count}회',
      'errorLoadingUnits': '단위를 불러오는 중 오류가 발생했습니다',
      'retry': '다시 시도',

      // 타이머 관련
      'timerFinished': '{duration} 타이머가 끝났습니다.',
      'presetSaved': '{name} 프리셋이 저장되었습니다',
      'timersInProgress': '{count}개 진행중',

      // 버전 관련
      'createNewVersion': '새 버전 생성',
      'overwriteExistingVersion': '기존 버전 덮어쓰기',
      'versionName': '버전 이름',
      'changeLog': '변경 사항',
      'createDerivedVersion': '{versionName}에서 파생된 새 버전을 생성합니다',
      'updateVersion': '{versionName}을(를) 업데이트합니다',

      // 요리 관련
      'ingredients': '재료',
      'steps': '조리 과정',
      'unit': '단위',
      'quantity': '수량',
      'name': '이름',
      'description': '설명',
      'cookingLog': '요리 기록',
      'addCookingLog': '요리 기록 추가',
    };
  }

  /// 영어 번역 생성 (임시)
  String generateEnglishTranslation(String key, String korean) {
    final translations = {
      'recipes': 'Recipes',
      'search': 'Search',
      'timer': 'Timer',
      'settings': 'Settings',
      'addRecipe': 'Add Recipe',
      'editRecipe': 'Edit Recipe',
      'recipeDetail': 'Recipe Detail',
      'noRecipesYet': 'No recipes yet',
      'createSpecialRecipe': 'Create your own special\\nsauce recipe!',
      'searchIngredients': 'Search Ingredients',
      'recipeDeleted': 'Recipe has been deleted',
      'confirmDeleteRecipe':
          'Are you sure you want to delete this recipe?\\n\\nThis action cannot be undone.',
      'deleteFailed': 'Delete failed',
      'save': 'Save',
      'cancel': 'Cancel',
      'delete': 'Delete',
      'edit': 'Edit',
      'confirm': 'Confirm',
      'errorOccurred': 'An error occurred',
      'selectUnit': 'Select Unit',
      'management': 'Management',
      'seasoningUnitManagement': 'Seasoning/Unit Management',
      'seasoningUnitDescription': 'Add, edit, delete seasonings/units',
      'appInfo': 'App Info',
      'version': 'Version',
      'license': 'License',
      'timerNotification': 'Timer Notification',
      'backgroundAppRefresh': 'Background App Refresh',
      'backgroundAppRefreshDescription':
          'Set up for accurate timer notifications',
    };

    return translations[key] ?? korean.replaceAll('\\n', ' ');
  }

  /// 일본어 번역 생성 (임시)
  String generateJapaneseTranslation(String key, String korean) {
    final translations = {
      'recipes': 'レシピ',
      'search': '検索',
      'timer': 'タイマー',
      'settings': '設定',
      'addRecipe': 'レシピ追加',
      'editRecipe': 'レシピ編集',
      'recipeDetail': 'レシピ詳細',
      'noRecipesYet': 'まだレシピがありません',
      'createSpecialRecipe': 'あなただけの特別な\\nソースレシピを作ってみましょう！',
      'searchIngredients': '材料検索',
      'recipeDeleted': 'レシピが削除されました',
      'confirmDeleteRecipe': 'このレシピを削除しますか？\\n\\nこの操作は元に戻せません。',
      'deleteFailed': '削除失敗',
      'save': '保存',
      'cancel': 'キャンセル',
      'delete': '削除',
      'edit': '編集',
      'confirm': '確認',
      'errorOccurred': 'エラーが発生しました',
      'selectUnit': '単位選択',
      'management': '管理',
      'seasoningUnitManagement': '調味料/単位管理',
      'seasoningUnitDescription': '調味料/単位の追加、編集、削除',
      'appInfo': 'アプリ情報',
      'version': 'バージョン',
      'license': 'ライセンス',
      'timerNotification': 'タイマー通知',
      'backgroundAppRefresh': 'バックグラウンドアプリ更新',
      'backgroundAppRefreshDescription': 'タイマー通知が正確に作動するよう設定',
    };

    return translations[key] ?? korean.replaceAll('\\n', ' ');
  }

  /// Google Sheets에 데이터 업로드
  Future<void> uploadTranslations() async {
    final hardcodedStrings = loadHardcodedStrings();

    print('하드코딩된 문자열 ${hardcodedStrings.length}개를 Google Sheets에 업로드합니다...');
    print('스프레드시트 ID: $spreadsheetId');

    // 헤더 행 생성
    final values = <List<dynamic>>[
      ['Key', 'Korean', 'English', 'Japanese', 'Description']
    ];

    // 데이터 행 생성
    hardcodedStrings.forEach((key, korean) {
      final english = generateEnglishTranslation(key, korean);
      final japanese = generateJapaneseTranslation(key, korean);

      values.add([
        key,
        korean,
        english,
        japanese,
        'Auto-generated from hardcoded strings'
      ]);
    });

    // 스프레드시트 클리어 후 새 데이터 입력
    try {
      // 기존 데이터 클리어 (한글 시트명 사용)
      await sheetsApi.spreadsheets.values.clear(
        ClearValuesRequest(),
        spreadsheetId,
        'multi_language!A:E',
      );

      print('기존 데이터를 클리어했습니다.');

      // 새 데이터 업로드 (한글 시트명 사용)
      final valueRange = ValueRange(
        range: 'multi_language!A1:E${values.length}',
        values: values,
      );

      await sheetsApi.spreadsheets.values.update(
        valueRange,
        spreadsheetId,
        'multi_language!A1:E${values.length}',
        valueInputOption: 'RAW',
      );

      print('✅ 성공적으로 ${hardcodedStrings.length}개의 번역 키를 업로드했습니다!');
      print(
          '📊 Google Sheets에서 확인: https://docs.google.com/spreadsheets/d/$spreadsheetId');
      print('');
      print('다음 단계:');
      print('1. Google Sheets에서 번역 내용을 확인하고 수정');
      print('2. dart scripts/update_translations.dart 실행하여 ARB 파일 업데이트');
    } catch (e) {
      print('❌ 업로드 실패: $e');
      print('');
      print('문제 해결:');
      print('1. 서비스 계정이 스프레드시트에 편집 권한이 있는지 확인');
      print('2. Google Sheets API가 활성화되어 있는지 확인');
      print('3. 네트워크 연결 상태 확인');
      rethrow;
    }
  }
}

Future<void> main() async {
  try {
    print('🚀 Google Sheets 업로드를 시작합니다...');

    final uploader = await SheetsUploader.create();
    await uploader.uploadTranslations();
  } catch (e) {
    print('💥 오류 발생: $e');
    exit(1);
  }
}
