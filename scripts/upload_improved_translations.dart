import 'dart:convert';
import 'dart:io';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';

// improved_translations.dart의 데이터를 임포트
import 'improved_translations.dart';

/// 개선된 번역 테이블을 Google Sheets에 업로드하는 스크립트
///
/// 사용법:
/// 1. scripts/service-account-key.json 파일 준비
/// 2. dart scripts/upload_improved_translations.dart
/// 3. 또는 서비스 계정 JSON을 환경변수로: GOOGLE_SERVICE_ACCOUNT_JSON=path/to/key.json dart scripts/upload_improved_translations.dart

class ImprovedSheetsUploader {
  // 스프레드시트 ID (URL에서 추출)
  static const String spreadsheetId =
      '1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns';

  // 시트 이름 
  static const String sheetName = '시트1';

  final SheetsApi sheetsApi;

  ImprovedSheetsUploader(this.sheetsApi);

  /// 서비스 계정을 사용한 인증
  static Future<ImprovedSheetsUploader> create() async {
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
    return ImprovedSheetsUploader(sheetsApi);
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

  /// Google Sheets에 개선된 번역 데이터 업로드
  Future<void> uploadImprovedTranslations() async {
    final translations = ImprovedTranslations.translations;

    print('개선된 번역 테이블 ${translations.length}개 항목을 Google Sheets에 업로드합니다...');
    print('스프레드시트 ID: $spreadsheetId');
    print('시트 이름: $sheetName');

    // 헤더 행 생성
    final values = <List<dynamic>>[
      ['Key', 'Korean', 'English', 'Japanese', 'Description']
    ];

    // 데이터 행 생성
    for (final entry in translations.entries) {
      final key = entry.key;
      final translationData = entry.value;
      
      values.add([
        key,
        translationData['ko'] ?? '',
        translationData['en'] ?? '',
        translationData['ja'] ?? '',
        translationData['description'] ?? '',
      ]);
    }

    print('총 ${values.length - 1}개의 번역 항목을 업로드합니다...');

    // 스프레드시트 업데이트
    try {
      // 기존 데이터 클리어
      await sheetsApi.spreadsheets.values.clear(
        ClearValuesRequest(),
        spreadsheetId,
        '$sheetName!A:E',
      );

      print('✅ 기존 데이터를 클리어했습니다.');

      // 새 데이터 업로드
      final valueRange = ValueRange(
        range: '$sheetName!A1:E${values.length}',
        values: values,
      );

      await sheetsApi.spreadsheets.values.update(
        valueRange,
        spreadsheetId,
        '$sheetName!A1:E${values.length}',
        valueInputOption: 'RAW',
      );

      print('✅ 성공적으로 ${translations.length}개의 번역 키를 업로드했습니다!');
      print('📊 Google Sheets에서 확인: https://docs.google.com/spreadsheets/d/$spreadsheetId');
      print('');
      print('업로드된 번역 요약:');
      print('- 총 키 개수: ${translations.length}');
      print('- 완전한 한국어 번역: ${translations.values.where((t) => t['ko']?.isNotEmpty == true).length}');
      print('- 완전한 영어 번역: ${translations.values.where((t) => t['en']?.isNotEmpty == true).length}');
      print('- 완전한 일본어 번역: ${translations.values.where((t) => t['ja']?.isNotEmpty == true).length}');
      print('');
      print('다음 단계:');
      print('1. Google Sheets에서 번역 내용을 확인하고 필요시 수정');
      print('2. dart scripts/update_translations.dart 실행하여 ARB 파일 업데이트');
    } catch (e) {
      print('❌ 업로드 실패: $e');
      print('');
      print('문제 해결:');
      print('1. 서비스 계정이 스프레드시트에 편집 권한이 있는지 확인');
      print('2. Google Sheets API가 활성화되어 있는지 확인');
      print('3. 네트워크 연결 상태 확인');
      print('4. 시트 이름이 "$sheetName"인지 확인');
      rethrow;
    }
  }

  /// 현재 Google Sheets의 데이터와 비교
  Future<void> compareWithCurrentData() async {
    try {
      final response = await sheetsApi.spreadsheets.values.get(
        spreadsheetId,
        '$sheetName!A:E',
      );

      final currentData = response.values ?? [];
      final currentCount = currentData.isEmpty ? 0 : currentData.length - 1; // 헤더 제외

      print('📊 현재 Google Sheets 상태:');
      print('- 현재 시트에 있는 행 수: $currentCount');
      print('- 새로 업로드할 번역 수: ${ImprovedTranslations.translations.length}');
      
      if (currentCount != ImprovedTranslations.translations.length) {
        print('⚠️  데이터 수가 다릅니다. 업로드가 필요합니다.');
      } else {
        print('✅ 데이터 수가 일치합니다.');
      }
    } catch (e) {
      print('💡 현재 데이터를 가져올 수 없습니다: $e');
    }
  }
}

Future<void> main() async {
  try {
    print('🚀 개선된 번역 테이블을 Google Sheets에 업로드합니다...');
    print('=' * 60);

    final uploader = await ImprovedSheetsUploader.create();
    
    // 현재 데이터와 비교
    await uploader.compareWithCurrentData();
    
    print('');
    print('업로드를 시작합니다...');
    
    // 개선된 번역 데이터 업로드
    await uploader.uploadImprovedTranslations();
    
    print('');
    print('=' * 60);
    print('🎉 업로드 완료!');
  } catch (e) {
    print('💥 오류 발생: $e');
    exit(1);
  }
}