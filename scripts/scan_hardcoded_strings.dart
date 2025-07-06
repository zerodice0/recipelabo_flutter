import 'dart:convert';
import 'dart:io';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';

/// 하드코딩된 한국어 문자열을 스캔하고 Google Sheets에 업로드하는 스크립트
///
/// 사용법:
/// dart scripts/scan_hardcoded_strings.dart [--upload] [--dry-run]
///
/// 환경변수:
/// - GOOGLE_SERVICE_ACCOUNT_JSON: 서비스 계정 JSON (필수, 쓰기 권한 필요)

class StringScanner {
  static const String spreadsheetId =
      '1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns';
  static const String sheetRange = 'multi_language!A:E';

  final SheetsApi? sheetsApi;
  final bool shouldUpload;
  final bool isDryRun;

  StringScanner({
    this.sheetsApi,
    this.shouldUpload = false,
    this.isDryRun = false,
  });

  /// Google Sheets API 클라이언트 생성
  static Future<StringScanner> create({
    bool shouldUpload = false,
    bool isDryRun = false,
  }) async {
    // .env 파일에서 환경변수 로드 시도
    await _loadEnvFile();

    SheetsApi? sheetsApi;

    if (shouldUpload && !isDryRun) {
      final serviceAccountFile = File('scripts/service-account-key.json');

      if (!await serviceAccountFile.exists()) {
        throw Exception(
          'Google Sheets 업로드를 위해서는 scripts/service-account-key.json 파일이 필요합니다.',
        );
      }

      final serviceAccountJson = await serviceAccountFile.readAsString();

      final credentials = ServiceAccountCredentials.fromJson(
        jsonDecode(serviceAccountJson),
      );
      final client = await clientViaServiceAccount(
        credentials,
        [SheetsApi.spreadsheetsScope], // 읽기/쓰기 권한
      );
      sheetsApi = SheetsApi(client);
    }

    return StringScanner(
      sheetsApi: sheetsApi,
      shouldUpload: shouldUpload,
      isDryRun: isDryRun,
    );
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

  /// Dart 파일에서 하드코딩된 한국어 문자열 스캔
  Future<List<HardcodedString>> scanHardcodedStrings() async {
    print('🔍 하드코딩된 한국어 문자열 스캔 시작...');

    final libDir = Directory('lib');
    if (!libDir.existsSync()) {
      throw Exception('lib 디렉토리를 찾을 수 없습니다.');
    }

    final dartFiles = await _findDartFiles(libDir);
    print('📁 스캔할 Dart 파일: ${dartFiles.length}개');

    final hardcodedStrings = <HardcodedString>[];

    for (final file in dartFiles) {
      final strings = await _scanFile(file);
      hardcodedStrings.addAll(strings);
    }

    // 중복 제거 (동일한 텍스트)
    final uniqueStrings = <String, HardcodedString>{};
    for (final str in hardcodedStrings) {
      if (!uniqueStrings.containsKey(str.text)) {
        uniqueStrings[str.text] = str;
      } else {
        // 같은 텍스트의 다른 위치들 추가
        uniqueStrings[str.text]!.locations.addAll(str.locations);
      }
    }

    final result = uniqueStrings.values.toList();
    result.sort((a, b) => a.text.compareTo(b.text));

    print('✅ 스캔 완료: ${result.length}개의 고유한 한국어 문자열 발견');
    return result;
  }

  /// 디렉토리에서 Dart 파일 찾기
  Future<List<File>> _findDartFiles(Directory dir) async {
    final files = <File>[];

    await for (final entity in dir.list(recursive: true)) {
      if (entity is File && entity.path.endsWith('.dart')) {
        // 생성된 파일들 제외
        if (entity.path.contains('.g.dart') ||
            entity.path.contains('.freezed.dart') ||
            entity.path.contains('app_localizations')) {
          continue;
        }
        files.add(entity);
      }
    }

    return files;
  }

  /// 파일에서 하드코딩된 한국어 문자열 스캔
  Future<List<HardcodedString>> _scanFile(File file) async {
    final content = await file.readAsString();
    final lines = content.split('\n');
    final hardcodedStrings = <HardcodedString>[];

    for (int lineIndex = 0; lineIndex < lines.length; lineIndex++) {
      final line = lines[lineIndex];
      final lineNumber = lineIndex + 1;

      // 문자열 리터럴 패턴들
      final patterns = [
        RegExp(r"'([^']*[가-힣]+[^']*)'"), // 작은따옴표
        RegExp(r'"([^"]*[가-힣]+[^"]*)"'), // 큰따옴표
      ];

      for (final pattern in patterns) {
        final matches = pattern.allMatches(line);

        for (final match in matches) {
          final text = match.group(1)!;

          // 제외할 패턴들
          if (_shouldExclude(text, file.path)) {
            continue;
          }

          // 한국어가 포함된 문자열만
          if (_containsKorean(text)) {
            final location = StringLocation(
              file: file.path.replaceFirst('lib/', ''),
              line: lineNumber,
              column: match.start,
            );

            hardcodedStrings.add(HardcodedString(
              text: text,
              locations: [location],
            ));
          }
        }
      }
    }

    return hardcodedStrings;
  }

  /// 제외할 문자열인지 확인
  bool _shouldExclude(String text, String filePath) {
    // 테스트 파일 제외
    if (filePath.contains('test/')) {
      return true;
    }

    // 주석이나 로그 메시지일 가능성이 높은 것들
    if (text.startsWith('//') ||
        text.startsWith('/*') ||
        text.startsWith('*') ||
        text.contains('print(') ||
        text.contains('debugPrint(')) {
      return true;
    }

    // 너무 짧거나 긴 문자열
    if (text.length < 2 || text.length > 100) {
      return true;
    }

    // 특수 문자만 있는 것들
    if (text.trim().isEmpty) {
      return true;
    }

    return false;
  }

  /// 한국어 문자가 포함되어 있는지 확인
  bool _containsKorean(String text) {
    return RegExp(r'[가-힣]').hasMatch(text);
  }

  /// 번역 키 생성
  String _generateKey(String text) {
    // 변수 치환 패턴 제거 (${variable} 등)
    String cleanText = text
        .replaceAll(RegExp(r'\$\{[^}]+\}'), 'VAR')
        .replaceAll(RegExp(r'\$[a-zA-Z_][a-zA-Z0-9_]*'), 'VAR');

    // 한국어 텍스트를 영어 키로 변환
    final keyMap = {
      '레시피': 'recipe',
      '목록': 'list',
      '검색': 'search',
      '타이머': 'timer',
      '설정': 'settings',
      '추가': 'add',
      '편집': 'edit',
      '삭제': 'delete',
      '저장': 'save',
      '취소': 'cancel',
      '재료': 'ingredients',
      '단위': 'unit',
      '수량': 'quantity',
      '이름': 'name',
      '설명': 'description',
      '버전': 'version',
      '변경': 'change',
      '기록': 'log',
      '선택': 'select',
      '기본': 'basic',
      '사용자': 'user',
      '무게': 'weight',
      '부피': 'volume',
      '개수': 'count',
      '기타': 'misc',
      '자주': 'frequent',
      '사용': 'used',
      '오류': 'error',
      '다시': 'retry',
      '시도': 'try',
      '시작': 'start',
      '끝': 'end',
      '완료': 'complete',
      '진행': 'progress',
      '프리셋': 'preset',
      '파생': 'derived',
      '업데이트': 'update',
      '복구': 'restore',
      '생성': 'create',
      '발견': 'found',
      '존재': 'exists',
      '작업': 'operation',
      '되돌릴': 'undo',
      '수': 'cannot',
      '없습니다': 'none',
      '개': 'count',
      '번': 'times',
      '회': 'times',
    };

    String key = cleanText.toLowerCase();

    // 한국어 단어들을 영어로 변환
    keyMap.forEach((korean, english) {
      key = key.replaceAll(korean, english);
    });

    // 특수 문자 제거 및 정리
    key = key
        .replaceAll(RegExp(r'[^\w\s]'), '') // 특수문자 제거
        .replaceAll(RegExp(r'\s+'), '_') // 공백을 언더스코어로
        .replaceAll(RegExp(r'[가-힣]'), '') // 남은 한국어 제거
        .replaceAll(RegExp(r'_+'), '_') // 연속 언더스코어 정리
        .replaceAll(RegExp(r'^_|_$'), ''); // 시작/끝 언더스코어 제거

    // 빈 키인 경우 해시 기반 기본값
    if (key.isEmpty || key == 'var') {
      final hash = text.hashCode.abs().toString();
      key = 'text_$hash';
    }

    // camelCase로 변환
    final parts = key.split('_');
    if (parts.length > 1) {
      key = parts.first +
          parts
              .skip(1)
              .map((p) => p.isEmpty ? '' : p[0].toUpperCase() + p.substring(1))
              .join('');
    }

    // 너무 긴 키는 줄이기
    if (key.length > 50) {
      key = key.substring(0, 47) + '_${text.hashCode.abs() % 1000}';
    }

    return key;
  }

  /// 영어 번역 생성 (간단한 매핑)
  String _generateEnglishTranslation(String koreanText) {
    final translationMap = {
      '레시피': 'Recipe',
      '레시피 목록': 'Recipe List',
      '레시피 추가': 'Add Recipe',
      '레시피 편집': 'Edit Recipe',
      '레시피 상세': 'Recipe Detail',
      '레시피가 삭제되었습니다': 'Recipe has been deleted',
      '레시피를 삭제하시겠습니까?': 'Are you sure you want to delete this recipe?',
      '검색': 'Search',
      '타이머': 'Timer',
      '타이머가 끝났습니다': 'Timer finished',
      '타이머가 시작되었습니다': 'Timer started',
      '설정': 'Settings',
      '설정 앱 열기': 'Open Settings App',
      '재료': 'Ingredients',
      '조리 과정': 'Steps',
      '단위': 'Unit',
      '단위 선택': 'Select Unit',
      '단위가 어떤 종류인지 선택해주세요': 'Please select what type of unit this is',
      '수량': 'Quantity',
      '이름': 'Name',
      '설명': 'Description',
      '저장': 'Save',
      '취소': 'Cancel',
      '삭제': 'Delete',
      '편집': 'Edit',
      '새 버전 생성': 'Create New Version',
      '기존 버전 덮어쓰기': 'Overwrite Existing Version',
      '버전 이름': 'Version Name',
      '버전명이 이미 존재합니다': 'Version name already exists',
      '변경 사항': 'Change Log',
      '요리 기록': 'Cooking Log',
      '요리 기록 추가': 'Add Cooking Log',
      '자주 사용하는 단위': 'Frequently Used Units',
      '무게 (기본)': 'Weight (Basic)',
      '무게 (사용자 추가)': 'Weight (Custom)',
      '부피 (기본)': 'Volume (Basic)',
      '부피 (사용자 추가)': 'Volume (Custom)',
      '개수 (기본)': 'Count (Basic)',
      '개수 (사용자 추가)': 'Count (Custom)',
      '기타 (기본)': 'Misc (Basic)',
      '기타 (사용자 추가)': 'Misc (Custom)',
      '기본': 'Basic',
      '단위 검색...': 'Search units...',
      '오류가 발생했습니다': 'An error occurred',
      '다시 시도': 'Retry',
      '프리셋': 'Preset',
      '프리셋이 저장되었습니다': 'Preset has been saved',
      '프리셋을 삭제하시겠습니까?': 'Are you sure you want to delete this preset?',
      '프리셋이 삭제되었습니다': 'Preset has been deleted',
      '진행중': 'In progress',
      '개의 레시피를 찾았습니다': 'recipes found',
      '에서 파생된 새 버전을 생성합니다': 'Create new version derived from',
      '을(를) 업데이트합니다': 'Update',
      '이 작업은 되돌릴 수 없습니다': 'This action cannot be undone',
      '삭제된 프리셋은 복구할 수 없습니다': 'Deleted presets cannot be restored',
      '번 사용': 'times used',
      '회': 'times',
    };

    // 정확한 매치 우선
    if (translationMap.containsKey(koreanText.trim())) {
      return translationMap[koreanText.trim()]!;
    }

    // 변수 치환이 있는 문자열 처리
    String result = koreanText;
    translationMap.forEach((korean, english) {
      if (result.contains(korean)) {
        result = result.replaceAll(korean, english);
      }
    });

    // 변경되지 않았으면 원본 반환 (번역 필요)
    return result == koreanText ? '[NEEDS_TRANSLATION] $koreanText' : result;
  }

  /// 일본어 번역 생성 (간단한 매핑)
  String _generateJapaneseTranslation(String koreanText) {
    final translationMap = {
      '레시피': 'レシピ',
      '레시피 목록': 'レシピ一覧',
      '레시피 추가': 'レシピ追加',
      '레시피 편집': 'レシピ編集',
      '레시피 상세': 'レシピ詳細',
      '검색': '検索',
      '타이머': 'タイマー',
      '설정': '設定',
      '재료': '材料',
      '조리 과정': '調理手順',
      '단위': '単位',
      '단위 선택': '単位選択',
      '수량': '数量',
      '이름': '名前',
      '설명': '説明',
      '저장': '保存',
      '취소': 'キャンセル',
      '삭제': '削除',
      '편집': '編集',
      '새 버전 생성': '新しいバージョンを作成',
      '기존 버전 덮어쓰기': '既存のバージョンを上書き',
      '버전 이름': 'バージョン名',
      '변경 사항': '変更履歴',
      '요리 기록': '調理記録',
      '요리 기록 추가': '調理記録を追加',
      '자주 사용하는 단위': 'よく使う単位',
      '무게 (기본)': '重量（基本）',
      '무게 (사용자 추가)': '重量（ユーザー追加）',
      '부피 (기본)': '容量（基本）',
      '부피 (사용자 추가)': '容量（ユーザー追加）',
      '개수 (기본)': '個数（基本）',
      '개수 (사용자 추가)': '個数（ユーザー追가）',
      '기타 (기본)': 'その他（基本）',
      '기타 (사용자 추가)': 'その他（ユーザー追加）',
      '기본': '基本',
      '단위 검색...': '単位を検索...',
      '오류가 발생했습니다': 'エラーが発生しました',
      '다시 시도': '再試行',
      '레시피가 삭제되었습니다': 'レシピが削除されました',
      '레시피를 삭제하시겠습니까?': 'このレシピを削除しますか？',
      '타이머가 끝났습니다': 'タイマーが終了しました',
      '타이머가 시작되었습니다': 'タイマーが開始されました',
      '설정 앱 열기': '設定アプリを開く',
      '단위가 어떤 종류인지 선택해주세요': 'この単位の種類を選択してください',
      '버전명이 이미 존재합니다': 'バージョン名が既に存在します',
      '프리셋': 'プリセット',
      '프리셋이 저장되었습니다': 'プリセットが保存されました',
      '프리셋을 삭제하시겠습니까?': 'このプリセットを削除しますか？',
      '프리셋이 삭제되었습니다': 'プリセットが削除されました',
      '진행중': '進行中',
      '개의 레시피를 찾았습니다': 'つのレシピが見つかりました',
      '에서 파생된 새 버전을 생성합니다': 'から派生した新しいバージョンを作成',
      '을(를) 업데이트합니다': 'を更新',
      '이 작업은 되돌릴 수 없습니다': 'この操作は元に戻せません',
      '삭제된 프리셋은 복구할 수 없습니다': '削除されたプリセットは復元できません',
      '번 사용': '回使用',
      '회': '回',
    };

    // 정확한 매치 우선
    if (translationMap.containsKey(koreanText.trim())) {
      return translationMap[koreanText.trim()]!;
    }

    // 변수 치환이 있는 문자열 처리
    String result = koreanText;
    translationMap.forEach((korean, japanese) {
      if (result.contains(korean)) {
        result = result.replaceAll(korean, japanese);
      }
    });

    // 변경되지 않았으면 원본 반환 (번역 필요)
    return result == koreanText ? '[NEEDS_TRANSLATION] $koreanText' : result;
  }

  /// Google Sheets에 번역 데이터 업로드
  Future<void> uploadToSheets(List<HardcodedString> strings) async {
    if (!isDryRun && sheetsApi == null) {
      throw Exception('Google Sheets API가 초기화되지 않았습니다.');
    }

    print('📤 Google Sheets에 번역 데이터 업로드 중...');

    // 기존 데이터 가져오기 (dry-run에서는 빈 데이터로 가정)
    final existingData = isDryRun ? <List<String>>[] : await _getExistingData();
    final existingKeys =
        existingData.map((row) => row.isNotEmpty ? row[0] : '').toSet();

    // 새로운 데이터 준비
    final newRows = <List<String>>[];
    int newCount = 0;

    for (final hardcodedString in strings) {
      final key = _generateKey(hardcodedString.text);

      // 이미 존재하는 키는 건너뛰기
      if (existingKeys.contains(key)) {
        continue;
      }

      final english = _generateEnglishTranslation(hardcodedString.text);
      final japanese = _generateJapaneseTranslation(hardcodedString.text);
      final description =
          '${hardcodedString.locations.map((l) => '${l.file}:${l.line}').join(', ')}에서 발견';

      newRows.add([key, hardcodedString.text, english, japanese, description]);
      newCount++;
    }

    if (newRows.isEmpty) {
      print('ℹ️ 새로 추가할 번역 데이터가 없습니다.');
      return;
    }

    if (isDryRun) {
      print('🔍 [DRY RUN] 업로드할 새로운 번역 데이터:');
      for (final row in newRows.take(10)) {
        print('  ${row[0]}: ${row[1]} -> ${row[2]}');
      }
      if (newRows.length > 10) {
        print('  ... 그리고 ${newRows.length - 10}개 더');
      }
      return;
    }

    // 기존 데이터 다음 행부터 추가
    final startRow = existingData.length + 2; // 헤더 행 고려
    final endRow = startRow + newRows.length - 1;
    final range = 'multi_language!A$startRow:E$endRow';

    final valueRange = ValueRange()
      ..values = newRows.map((row) => row.cast<Object>()).toList();

    try {
      await sheetsApi!.spreadsheets.values.update(
        valueRange,
        spreadsheetId,
        range,
        valueInputOption: 'RAW',
      );

      print('✅ Google Sheets 업로드 완료: $newCount개의 새로운 번역 항목 추가');
      print('📋 스프레드시트: https://docs.google.com/spreadsheets/d/$spreadsheetId');
    } catch (e) {
      print('❌ Google Sheets 업로드 실패: $e');
      rethrow;
    }
  }

  /// 기존 시트 데이터 가져오기
  Future<List<List<String>>> _getExistingData() async {
    try {
      final response = await sheetsApi!.spreadsheets.values.get(
        spreadsheetId,
        'multi_language!A:E',
      );

      return response.values
              ?.map((row) =>
                  List<String>.from(row.map((cell) => cell?.toString() ?? '')))
              .toList() ??
          [];
    } catch (e) {
      print('⚠️ 기존 데이터를 가져올 수 없습니다: $e');
      return [];
    }
  }

  /// 결과를 콘솔에 출력
  void printResults(List<HardcodedString> strings) {
    print('\n📊 스캔 결과:');
    print('=' * 50);

    if (strings.isEmpty) {
      print('🎉 하드코딩된 한국어 문자열을 찾지 못했습니다!');
      return;
    }

    print('📝 발견된 하드코딩 문자열 (${strings.length}개):');
    print('-' * 50);

    for (int i = 0; i < strings.length && i < 20; i++) {
      final str = strings[i];
      final key = _generateKey(str.text);
      print('${i + 1}. "$key": "${str.text}"');
      print(
          '   위치: ${str.locations.map((l) => '${l.file}:${l.line}').join(', ')}');
      print('');
    }

    if (strings.length > 20) {
      print('... 그리고 ${strings.length - 20}개 더');
    }

    print('\n💡 다음 단계:');
    print('1. --upload 옵션으로 Google Sheets에 업로드');
    print('2. 스프레드시트에서 번역 검토 및 수정');
    print('3. dart scripts/update_translations.dart로 ARB 파일 업데이트');
  }

  /// 메인 실행 함수
  Future<void> run() async {
    try {
      print('🔍 하드코딩된 문자열 스캔 시작${isDryRun ? ' (DRY RUN)' : ''}');
      print('=' * 50);

      // 1. 하드코딩된 문자열 스캔
      final strings = await scanHardcodedStrings();

      // 2. 결과 출력
      printResults(strings);

      // 3. Google Sheets에 업로드
      if (shouldUpload && strings.isNotEmpty) {
        print('\n📤 Google Sheets 업로드 시작...');
        await uploadToSheets(strings);
      }

      print('\n' + '=' * 50);
      print('🎉 스캔 완료!');
    } catch (e, stackTrace) {
      print('❌ 스캔 실패: $e');
      print('\nStackTrace:\n$stackTrace');
      exit(1);
    }
  }
}

/// 하드코딩된 문자열 정보
class HardcodedString {
  final String text;
  final List<StringLocation> locations;

  HardcodedString({
    required this.text,
    required this.locations,
  });

  @override
  String toString() =>
      'HardcodedString(text: $text, locations: ${locations.length})';
}

/// 문자열 위치 정보
class StringLocation {
  final String file;
  final int line;
  final int column;

  StringLocation({
    required this.file,
    required this.line,
    required this.column,
  });

  @override
  String toString() => '$file:$line:$column';
}

/// 메인 함수
Future<void> main(List<String> args) async {
  bool shouldUpload = false;
  bool isDryRun = false;

  // 명령행 인수 파싱
  for (final arg in args) {
    if (arg == '--upload') {
      shouldUpload = true;
    } else if (arg == '--dry-run') {
      isDryRun = true;
    } else if (arg == '--help' || arg == '-h') {
      _printUsage();
      return;
    }
  }

  try {
    final scanner = await StringScanner.create(
      shouldUpload: shouldUpload,
      isDryRun: isDryRun,
    );
    await scanner.run();
  } catch (e) {
    print('❌ 실행 실패: $e');
    print('\n사용법을 확인하려면 --help 옵션을 사용하세요.');
    exit(1);
  }
}

void _printUsage() {
  print('''
🔍 Recipick 하드코딩 문자열 스캔 도구

사용법:
  dart scripts/scan_hardcoded_strings.dart [options]

옵션:
  --upload     Google Sheets에 발견된 문자열들을 업로드
  --dry-run    실제 업로드하지 않고 미리보기만 출력
  --help, -h   도움말 출력

파일:
  scripts/service-account-key.json    서비스 계정 JSON (--upload 사용 시 필수)

예시:
  # 스캔만 실행
  dart scripts/scan_hardcoded_strings.dart
  
  # 스캔 후 Google Sheets에 업로드
  dart scripts/scan_hardcoded_strings.dart --upload
  
  # 미리보기 모드
  dart scripts/scan_hardcoded_strings.dart --upload --dry-run

참고:
- lib/ 디렉토리의 모든 .dart 파일을 스캔합니다
- 생성된 파일(.g.dart, .freezed.dart)은 제외됩니다
- 테스트 파일은 제외됩니다
- 한국어가 포함된 문자열만 추출됩니다
''');
}
