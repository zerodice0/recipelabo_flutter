import 'dart:convert';
import 'dart:io';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:csv/csv.dart';

/// Google Sheets에서 번역 데이터를 가져와서 ARB 파일을 생성하는 스크립트
///
/// 사용법:
/// dart scripts/update_translations.dart [sheet_id] [--dry-run]
///
/// 환경변수:
/// - GOOGLE_SHEETS_API_KEY: Google Sheets API 키
/// - GOOGLE_SERVICE_ACCOUNT_JSON: 서비스 계정 JSON (선택적)

class TranslationUpdater {
  // 기본 스프레드시트 ID
  static const String defaultSheetId =
      '1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns';

  // 시트 범위 - A:E는 Key, Korean, English, Japanese, Description 컬럼
  static const String sheetRange = 'multi_language!A2:E';

  final SheetsApi sheetsApi;
  final String spreadsheetId;
  final bool isDryRun;

  TranslationUpdater({
    required this.sheetsApi,
    required this.spreadsheetId,
    this.isDryRun = false,
  });

  /// Google Sheets API 클라이언트 생성
  static Future<TranslationUpdater> create({
    String? sheetId,
    bool isDryRun = false,
  }) async {
    // .env 파일에서 환경변수 로드 시도
    await _loadEnvFile();

    final apiKey = Platform.environment['SAUCERER_GOOGLE_SHEETS_API_KEY'];
    final serviceAccountFile = File('scripts/service-account-key.json');

    AuthClient client;

    if (await serviceAccountFile.exists()) {
      // 서비스 계정을 사용한 인증
      final serviceAccountJson = await serviceAccountFile.readAsString();
      final credentials = ServiceAccountCredentials.fromJson(
        jsonDecode(serviceAccountJson),
      );
      client = await clientViaServiceAccount(
        credentials,
        [SheetsApi.spreadsheetsReadonlyScope],
      );
    } else if (apiKey != null) {
      // API 키를 사용한 인증 (읽기 전용)
      // API 키는 URL 파라미터로 직접 전달
      throw Exception(
        'API 키 방식은 현재 구현되지 않았습니다. '
        'scripts/service-account-key.json 파일을 사용하여 서비스 계정으로 인증하세요.',
      );
    } else {
      throw Exception(
        'Google Sheets API 인증이 필요합니다. '
        'SAUCERER_GOOGLE_SHEETS_API_KEY 또는 scripts/service-account-key.json 파일을 설정하세요.',
      );
    }

    final sheetsApi = SheetsApi(client);
    final finalSheetId = sheetId ?? defaultSheetId;

    return TranslationUpdater(
      sheetsApi: sheetsApi,
      spreadsheetId: finalSheetId,
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

  /// Google Sheets에서 번역 데이터 가져오기
  Future<List<TranslationRow>> fetchTranslations() async {
    print('📊 Google Sheets에서 번역 데이터를 가져오는 중...');
    print('📋 Spreadsheet ID: $spreadsheetId');
    print('📍 범위: $sheetRange');

    try {
      final response = await sheetsApi.spreadsheets.values.get(
        spreadsheetId,
        sheetRange,
      );

      final values = response.values;
      if (values == null || values.isEmpty) {
        print('⚠️ 시트에 데이터가 없습니다.');
        return [];
      }

      print('✅ ${values.length}개의 행을 가져왔습니다.');

      final translations = <TranslationRow>[];
      for (int i = 0; i < values.length; i++) {
        final row = values[i];
        if (row.isEmpty) continue;

        // 최소한 key가 있어야 함
        final key = row.isNotEmpty ? row[0]?.toString().trim() : null;
        if (key == null || key.isEmpty) {
          print('⚠️ ${i + 2}번째 행: Key가 비어있습니다. 건너뜁니다.');
          continue;
        }

        final korean = row.length > 1 ? row[1]?.toString() : '';
        final english = row.length > 2 ? row[2]?.toString() : '';
        final japanese = row.length > 3 ? row[3]?.toString() : '';
        final description = row.length > 4 ? row[4]?.toString() : '';

        translations.add(TranslationRow(
          key: key,
          korean: korean ?? '',
          english: english ?? '',
          japanese: japanese ?? '',
          description: description ?? '',
        ));
      }

      print('📝 처리된 번역 항목: ${translations.length}개');
      return translations;
    } catch (e) {
      print('❌ Google Sheets 데이터 가져오기 실패: $e');
      rethrow;
    }
  }

  /// ARB 파일 생성
  Future<void> generateArbFiles(List<TranslationRow> translations) async {
    final l10nDir = Directory('lib/l10n');
    if (!l10nDir.existsSync()) {
      await l10nDir.create(recursive: true);
    }

    // 각 언어별 ARB 파일 생성
    final languages = {
      'ko': (TranslationRow row) => row.korean,
      'en': (TranslationRow row) => row.english,
      'ja': (TranslationRow row) => row.japanese,
    };

    for (final entry in languages.entries) {
      final locale = entry.key;
      final textGetter = entry.value;

      await _generateArbFile(locale, translations, textGetter);
    }
  }

  /// 특정 언어의 ARB 파일 생성
  Future<void> _generateArbFile(
    String locale,
    List<TranslationRow> translations,
    String Function(TranslationRow) textGetter,
  ) async {
    final arbData = <String, dynamic>{
      '@@locale': locale,
    };

    // 번역 데이터 추가
    for (final translation in translations) {
      final text = textGetter(translation);
      if (text.isNotEmpty) {
        arbData[translation.key] = text;

        // 영어 ARB에만 메타데이터 추가 (템플릿 파일)
        if (locale == 'en' && translation.description.isNotEmpty) {
          arbData['@${translation.key}'] = {
            'description': translation.description,
          };
        }
      }
    }

    final file = File('lib/l10n/app_$locale.arb');
    final jsonString = JsonEncoder.withIndent('  ').convert(arbData);

    if (isDryRun) {
      print('🔍 [DRY RUN] $locale ARB 파일 생성 미리보기:');
      print('📁 파일: ${file.path}');
      print('📊 번역 항목 수: ${translations.length}');
      final preview = jsonString.length > 500
          ? '${jsonString.substring(0, 500)}...'
          : jsonString;
      print('📋 내용 미리보기:\n$preview\n');
    } else {
      await file.writeAsString(jsonString);
      print('✅ $locale ARB 파일 생성 완료: ${file.path}');
    }
  }

  /// CSV 파일로 내보내기 (참고용)
  Future<void> exportToCsv(List<TranslationRow> translations) async {
    final csvData = [
      ['Key', 'Korean', 'English', 'Japanese', 'Description'],
      ...translations
          .map((t) => [t.key, t.korean, t.english, t.japanese, t.description]),
    ];

    final csvString = const ListToCsvConverter().convert(csvData);
    final file = File('translations_backup.csv');

    if (isDryRun) {
      print('🔍 [DRY RUN] CSV 백업 파일 생성 미리보기:');
      print('📁 파일: ${file.path}');
      print('📊 행 수: ${csvData.length}');
    } else {
      await file.writeAsString(csvString);
      print('💾 CSV 백업 파일 생성 완료: ${file.path}');
    }
  }

  /// 번역 업데이트 실행
  Future<void> run() async {
    try {
      print('🌍 번역 업데이트 시작${isDryRun ? ' (DRY RUN)' : ''}');
      print('=' * 50);

      // 1. Google Sheets에서 데이터 가져오기
      final translations = await fetchTranslations();

      if (translations.isEmpty) {
        print('⚠️ 번역 데이터가 없습니다. 작업을 중단합니다.');
        return;
      }

      // 2. ARB 파일 생성
      print('\n📝 ARB 파일 생성 중...');
      await generateArbFiles(translations);

      // 3. CSV 백업 생성
      print('\n💾 CSV 백업 생성 중...');
      await exportToCsv(translations);

      // 4. Flutter 다국어 코드 생성
      if (!isDryRun) {
        print('\n🏗️ Flutter 다국어 코드 생성 중...');
        final result = await Process.run('flutter', ['gen-l10n']);
        if (result.exitCode == 0) {
          print('✅ Flutter 다국어 코드 생성 완료');
        } else {
          print('❌ Flutter 다국어 코드 생성 실패:');
          print(result.stderr);
        }
      }

      print('\n' + '=' * 50);
      print('🎉 번역 업데이트 완료${isDryRun ? ' (DRY RUN)' : ''}!');

      if (!isDryRun) {
        print('\n📋 다음 단계:');
        print('1. 생성된 ARB 파일들을 확인하세요');
        print('2. 코드에서 AppLocalizations.of(context)를 사용하세요');
        print('3. 변경사항을 커밋하세요');
      }
    } catch (e, stackTrace) {
      print('❌ 번역 업데이트 실패: $e');
      if (e.toString().contains('API_KEY_INVALID') ||
          e.toString().contains('PERMISSION_DENIED')) {
        print('\n💡 해결 방법:');
        print('1. Google Cloud Console에서 Sheets API 활성화');
        print('2. API 키 생성 또는 서비스 계정 설정');
        print('3. 환경변수 GOOGLE_SHEETS_API_KEY 설정');
        print('4. 스프레드시트를 공개로 설정하거나 권한 부여');
      }
      print('\nStackTrace:\n$stackTrace');
      exit(1);
    }
  }
}

/// 번역 데이터 행 모델
class TranslationRow {
  final String key;
  final String korean;
  final String english;
  final String japanese;
  final String description;

  const TranslationRow({
    required this.key,
    required this.korean,
    required this.english,
    required this.japanese,
    required this.description,
  });

  @override
  String toString() {
    return 'TranslationRow(key: $key, ko: $korean, en: $english, ja: $japanese)';
  }
}

/// 메인 함수
Future<void> main(List<String> args) async {
  String? sheetId;
  bool isDryRun = false;

  // 명령행 인수 파싱
  for (int i = 0; i < args.length; i++) {
    final arg = args[i];
    if (arg == '--dry-run') {
      isDryRun = true;
    } else if (arg == '--help' || arg == '-h') {
      _printUsage();
      return;
    } else if (!arg.startsWith('--')) {
      sheetId = arg;
    }
  }

  try {
    final updater = await TranslationUpdater.create(
      sheetId: sheetId,
      isDryRun: isDryRun,
    );
    await updater.run();
  } catch (e) {
    print('❌ 실행 실패: $e');
    print('\n사용법을 확인하려면 --help 옵션을 사용하세요.');
    exit(1);
  }
}

void _printUsage() {
  print('''
🌍 Recipick 번역 업데이트 도구

사용법:
  dart scripts/update_translations.dart [options] [sheet_id]

옵션:
  --dry-run    실제 파일을 생성하지 않고 미리보기만 출력
  --help, -h   도움말 출력

인수:
  sheet_id     Google Sheets 스프레드시트 ID (선택적)
               지정하지 않으면 기본값 사용

환경변수:
  SAUCERER_GOOGLE_SHEETS_API_KEY          Google Sheets API 키 (필수)
  
파일:
  scripts/service-account-key.json        서비스 계정 JSON (선택적, API 키 대신 사용)

예시:
  # 기본 시트 사용
  dart scripts/update_translations.dart
  
  # 특정 시트 사용
  dart scripts/update_translations.dart 1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms
  
  # 미리보기 모드
  dart scripts/update_translations.dart --dry-run

설정 방법:
1. Google Cloud Console에서 프로젝트 생성
2. Google Sheets API 활성화
3. API 키 또는 서비스 계정 생성
4. 환경변수 설정:
   export SAUCERER_GOOGLE_SHEETS_API_KEY="your_api_key_here"
5. Google Sheets 템플릿 생성 (A: Key, B: Korean, C: English, D: Japanese, E: Description)

더 자세한 정보는 README.md를 참조하세요.
''');
}
