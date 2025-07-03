/// 수정된 동기화 스크립트 - 한글 시트명 "시트1" 사용
/// 
/// 사용법: dart scripts/fixed_sync.dart

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> main() async {
  const apiKey = 'AIzaSyCRjnR8Z7RbrXveNLmUFZO5v-rW02Y8cWs';
  const spreadsheetId = '1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns';
  const sheetRange = '시트1!A2:E'; // 한글 시트명 사용
  
  print('🔄 Google Sheets에서 최신 번역 데이터를 가져옵니다...');
  print('📊 시트명: "시트1" (한글)');
  
  try {
    // Google Sheets에서 데이터 가져오기
    final url = 'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$sheetRange?key=$apiKey';
    print('🌐 URL: $url');
    
    final response = await http.get(Uri.parse(url));
    print('📡 응답 코드: ${response.statusCode}');
    
    if (response.statusCode != 200) {
      print('❌ API 호출 실패');
      print('📝 응답: ${response.body}');
      return;
    }
    
    final data = jsonDecode(response.body);
    final values = data['values'] as List<dynamic>?;
    
    if (values == null || values.isEmpty) {
      print('❌ 스프레드시트에서 데이터를 찾을 수 없습니다.');
      print('📝 응답 데이터: ${response.body}');
      return;
    }
    
    print('✅ ${values.length}개 행의 데이터를 가져왔습니다.');
    
    // 첫 몇 행 미리보기
    print('');
    print('📋 첫 5개 행 미리보기:');
    for (int i = 0; i < values.length && i < 5; i++) {
      final row = values[i];
      print('   ${i + 2}: ${row.join(' | ')}');
    }
    print('');
    
    // ARB 데이터 구성
    final arbData = {
      'ko': <String, dynamic>{'@@locale': 'ko'},
      'en': <String, dynamic>{'@@locale': 'en'},
      'ja': <String, dynamic>{'@@locale': 'ja'},
    };
    
    int processedCount = 0;
    
    // 데이터 파싱 (Key, Korean, English, Japanese, Description)
    for (final row in values) {
      if (row.length < 4) continue;
      
      final key = row[0]?.toString().trim();
      final korean = row[1]?.toString().trim() ?? '';
      final english = row[2]?.toString().trim() ?? '';
      final japanese = row[3]?.toString().trim() ?? '';
      final description = row.length > 4 ? row[4]?.toString().trim() ?? '' : '';
      
      if (key == null || key.isEmpty) continue;
      
      // 각 언어별 ARB 데이터에 추가
      if (korean.isNotEmpty) {
        arbData['ko']![key] = korean.replaceAll('\\n', '\n');
      }
      if (english.isNotEmpty) {
        arbData['en']![key] = english.replaceAll('\\n', '\n');
        // 영어는 템플릿이므로 description도 추가
        if (description.isNotEmpty) {
          arbData['en']!['@$key'] = {'description': description};
        }
      }
      if (japanese.isNotEmpty) {
        arbData['ja']![key] = japanese.replaceAll('\\n', '\n');
      }
      
      processedCount++;
    }
    
    print('📊 처리된 번역 키: $processedCount개');
    
    // ARB 파일 저장
    for (final locale in ['ko', 'en', 'ja']) {
      final arbFile = File('lib/l10n/app_$locale.arb');
      final jsonString = const JsonEncoder.withIndent('  ').convert(arbData[locale]);
      await arbFile.writeAsString(jsonString);
      
      final keyCount = arbData[locale]!.length - 1; // @@locale 제외
      print('✅ $locale: ${arbFile.path} (${keyCount}개 키)');
    }
    
    print('');
    print('🎉 동기화 완료!');
    print('');
    print('다음 명령어를 실행하세요:');
    print('1. flutter gen-l10n');
    print('2. flutter run');
    
  } catch (e) {
    print('❌ 오류 발생: $e');
    print('');
    print('해결 방법:');
    print('1. 스프레드시트가 공개되어 있는지 확인');
    print('2. 올바른 형식으로 데이터가 입력되었는지 확인');
    print('3. 네트워크 연결 상태 확인');
  }
}