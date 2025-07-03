/// 디버깅용 동기화 스크립트 - 자세한 에러 정보 제공
/// 
/// 사용법: dart scripts/debug_sync.dart

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> main() async {
  const apiKey = 'AIzaSyCRjnR8Z7RbrXveNLmUFZO5v-rW02Y8cWs';
  const spreadsheetId = '1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns';
  const sheetRange = 'Sheet1!A2:E'; // 헤더 제외
  
  print('🔍 Google Sheets API 연결 진단을 시작합니다...');
  print('📊 스프레드시트 ID: $spreadsheetId');
  print('🔑 API 키: ${apiKey.substring(0, 20)}...');
  print('📍 범위: $sheetRange');
  print('');
  
  try {
    // 1단계: 기본 스프레드시트 정보 가져오기
    print('1️⃣ 스프레드시트 기본 정보 확인 중...');
    final metadataUrl = 'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId?key=$apiKey';
    print('🌐 URL: $metadataUrl');
    
    final metadataResponse = await http.get(Uri.parse(metadataUrl));
    print('📡 응답 코드: ${metadataResponse.statusCode}');
    
    if (metadataResponse.statusCode == 200) {
      final metadata = jsonDecode(metadataResponse.body);
      final title = metadata['properties']['title'];
      print('✅ 스프레드시트 제목: $title');
      
      // 시트 목록 확인
      final sheets = metadata['sheets'] as List<dynamic>;
      print('📄 시트 목록:');
      for (final sheet in sheets) {
        final sheetTitle = sheet['properties']['title'];
        final sheetId = sheet['properties']['sheetId'];
        print('   - $sheetTitle (ID: $sheetId)');
      }
      print('');
    } else {
      print('❌ 스프레드시트 정보 가져오기 실패');
      print('📝 응답: ${metadataResponse.body}');
      
      if (metadataResponse.statusCode == 400) {
        print('');
        print('🔧 400 에러 해결 방법:');
        print('1. 스프레드시트가 공개되어 있는지 확인');
        print('   - 공유 > 일반 액세스 > "링크가 있는 모든 사용자"');
        print('2. 스프레드시트 ID가 올바른지 확인');
        print('3. API 키가 유효한지 확인');
      }
      return;
    }
    
    // 2단계: 실제 데이터 가져오기
    print('2️⃣ 실제 데이터 가져오기 시도 중...');
    final dataUrl = 'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$sheetRange?key=$apiKey';
    print('🌐 URL: $dataUrl');
    
    final dataResponse = await http.get(Uri.parse(dataUrl));
    print('📡 응답 코드: ${dataResponse.statusCode}');
    
    if (dataResponse.statusCode == 200) {
      final data = jsonDecode(dataResponse.body);
      final values = data['values'] as List<dynamic>?;
      
      if (values == null || values.isEmpty) {
        print('⚠️  데이터가 비어있습니다.');
        print('📝 응답 내용: ${dataResponse.body}');
        print('');
        print('🔧 해결 방법:');
        print('1. 스프레드시트에 데이터가 있는지 확인');
        print('2. A2:E 범위에 데이터가 있는지 확인');
        print('3. 시트 이름이 "Sheet1"인지 확인');
      } else {
        print('✅ ${values.length}개 행의 데이터를 성공적으로 가져왔습니다!');
        print('');
        print('📋 첫 5개 행 미리보기:');
        for (int i = 0; i < values.length && i < 5; i++) {
          final row = values[i];
          print('   ${i + 2}: ${row.join(' | ')}');
        }
        
        // ARB 파일 생성 진행
        await generateArbFiles(values);
      }
    } else {
      print('❌ 데이터 가져오기 실패');
      print('📝 응답: ${dataResponse.body}');
      
      if (dataResponse.statusCode == 400) {
        print('');
        print('🔧 가능한 원인:');
        print('1. 시트 이름이 "Sheet1"이 아님');
        print('2. 지정된 범위에 데이터가 없음');
        print('3. 스프레드시트 권한 문제');
      }
    }
    
  } catch (e) {
    print('💥 예외 발생: $e');
    print('');
    print('🔧 일반적인 해결 방법:');
    print('1. 네트워크 연결 확인');
    print('2. API 키 유효성 확인');
    print('3. 스프레드시트 공개 설정 확인');
  }
}

Future<void> generateArbFiles(List<dynamic> values) async {
  print('');
  print('3️⃣ ARB 파일 생성 중...');
  
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
}