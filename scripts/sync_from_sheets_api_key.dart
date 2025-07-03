import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

/// API 키를 사용하여 Google Sheets에서 번역 데이터를 읽어와 ARB 파일을 생성하는 스크립트
/// 
/// 사용법: dart scripts/sync_from_sheets_api_key.dart
/// 
/// 환경변수: GOOGLE_SHEETS_API_KEY (필수)

class SheetsApiKeySync {
  static const String spreadsheetId = '1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns';
  static const String sheetRange = 'Sheet1!A2:E'; // A2부터 E열까지 (헤더 제외)
  
  final String apiKey;
  
  SheetsApiKeySync(this.apiKey);
  
  /// Google Sheets에서 데이터 읽기 (API 키 사용)
  Future<List<List<dynamic>>> fetchTranslationData() async {
    final url = 'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$sheetRange?key=$apiKey';
    
    print('📡 Google Sheets에서 번역 데이터를 가져오는 중...');
    print('URL: $url');
    
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode != 200) {
      throw Exception('Google Sheets API 호출 실패: ${response.statusCode}\\n${response.body}');
    }
    
    final data = jsonDecode(response.body);
    final values = data['values'] as List<dynamic>?;
    
    if (values == null || values.isEmpty) {
      throw Exception('Google Sheets에서 데이터를 찾을 수 없습니다. 스프레드시트에 데이터가 있는지 확인해주세요.');
    }
    
    print('✅ ${values.length}개 행의 데이터를 가져왔습니다.');
    return values.cast<List<dynamic>>();
  }
  
  /// ARB 파일 생성
  Future<void> generateArbFiles(List<List<dynamic>> translationData) async {
    final arbData = {
      'ko': <String, dynamic>{'@@locale': 'ko'},
      'en': <String, dynamic>{'@@locale': 'en'},
      'ja': <String, dynamic>{'@@locale': 'ja'},
    };
    
    // 데이터 파싱 (Key, Korean, English, Japanese, Description)
    for (final row in translationData) {
      if (row.length < 4) continue; // 최소 4개 컬럼 필요
      
      final key = row[0]?.toString().trim();
      final korean = row[1]?.toString().trim() ?? '';
      final english = row[2]?.toString().trim() ?? '';
      final japanese = row[3]?.toString().trim() ?? '';
      final description = row.length > 4 ? row[4]?.toString().trim() ?? '' : '';
      
      if (key == null || key.isEmpty) continue;
      
      // 각 언어별 ARB 데이터에 추가
      if (korean.isNotEmpty) {
        arbData['ko']![key] = korean.replaceAll('\\\\n', '\\n');
      }
      if (english.isNotEmpty) {
        arbData['en']![key] = english.replaceAll('\\\\n', '\\n');
        // 영어는 템플릿이므로 description도 추가
        if (description.isNotEmpty) {
          arbData['en']!['@$key'] = {'description': description};
        }
      }
      if (japanese.isNotEmpty) {
        arbData['ja']![key] = japanese.replaceAll('\\\\n', '\\n');
      }
    }
    
    // ARB 파일 저장
    for (final locale in ['ko', 'en', 'ja']) {
      final arbFile = File('lib/l10n/app_$locale.arb');
      final jsonString = const JsonEncoder.withIndent('  ').convert(arbData[locale]);
      await arbFile.writeAsString(jsonString);
      
      final keyCount = arbData[locale]!.length - 1; // @@locale 제외
      print('✅ $locale: ${arbFile.path} (${keyCount}개 키)');
    }
  }
  
  /// 전체 동기화 실행
  Future<void> sync() async {
    try {
      final translationData = await fetchTranslationData();
      await generateArbFiles(translationData);
      
      print('');
      print('🎉 번역 동기화가 완료되었습니다!');
      print('');
      print('다음 단계:');
      print('1. flutter gen-l10n (번역 파일 생성)');
      print('2. flutter run (앱 실행하여 번역 확인)');
      
    } catch (e) {
      print('❌ 동기화 실패: $e');
      print('');
      print('문제 해결:');
      print('1. API 키가 올바른지 확인');
      print('2. Google Sheets가 공개되어 있는지 확인');
      print('3. 스프레드시트에 올바른 형식의 데이터가 있는지 확인');
      rethrow;
    }
  }
}

Future<void> main() async {
  // API 키 확인
  final apiKey = Platform.environment['GOOGLE_SHEETS_API_KEY'];
  
  if (apiKey == null || apiKey.isEmpty) {
    print('❌ Google Sheets API 키가 필요합니다.');
    print('');
    print('사용법:');
    print('GOOGLE_SHEETS_API_KEY=your_api_key dart scripts/sync_from_sheets_api_key.dart');
    print('');
    print('환경변수를 설정하거나 .env 파일을 사용하세요.');
    exit(1);
  }
  
  try {
    print('🚀 Google Sheets 동기화를 시작합니다...');
    print('API 키: ${apiKey.substring(0, 10)}...');
    
    final sync = SheetsApiKeySync(apiKey);
    await sync.sync();
    
  } catch (e) {
    print('💥 오류 발생: $e');
    exit(1);
  }
}