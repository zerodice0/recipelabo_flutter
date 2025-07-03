/// 서비스 계정 권한 테스트 스크립트
///
/// 사용법: dart scripts/test_permissions.dart

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';

Future<void> main() async {
  const keyPath = 'scripts/service-account-key.json';
  const spreadsheetId = '1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns';

  print('🧪 서비스 계정 권한을 테스트합니다...');
  print('📊 스프레드시트 ID: $spreadsheetId');
  print('');

  try {
    // 서비스 계정 키 로드
    final keyFile = File(keyPath);
    if (!keyFile.existsSync()) {
      print('❌ 서비스 계정 JSON 파일을 찾을 수 없습니다: $keyPath');
      return;
    }

    final serviceAccountJson = await keyFile.readAsString();
    final credentials = ServiceAccountCredentials.fromJson(
      jsonDecode(serviceAccountJson),
    );

    print('✅ 서비스 계정 로드 성공');
    print('📧 계정: ${credentials.email}');
    print('');

    // 클라이언트 생성
    final client = await clientViaServiceAccount(
      credentials,
      [SheetsApi.spreadsheetsScope], // 읽기/쓰기 권한
    );

    final sheetsApi = SheetsApi(client);
    print('✅ API 클라이언트 생성 성공');
    print('');

    // 1단계: 스프레드시트 메타데이터 읽기 테스트
    print('1️⃣ 스프레드시트 메타데이터 읽기 테스트...');
    final spreadsheet = await sheetsApi.spreadsheets.get(spreadsheetId);
    print('✅ 읽기 권한 확인: ${spreadsheet.properties?.title}');
    print('');

    // 2단계: 현재 데이터 읽기 테스트
    print('2️⃣ 현재 데이터 읽기 테스트...');
    try {
      final response = await sheetsApi.spreadsheets.values.get(
        spreadsheetId,
        '시트1!A1:E1', // 헤더만 읽기
      );

      if (response.values != null && response.values!.isNotEmpty) {
        print('✅ 데이터 읽기 성공: ${response.values!.first}');
      } else {
        print('⚠️  데이터가 비어있거나 헤더가 없습니다');
      }
    } catch (e) {
      print('❌ 데이터 읽기 실패: $e');
    }
    print('');

    // 3단계: 쓰기 권한 테스트 (임시 셀에 테스트 데이터 쓰기)
    print('3️⃣ 쓰기 권한 테스트...');
    try {
      final testData = ValueRange(
          range: '시트1!Z1:Z1', // 임시 위치에 테스트
          values: [
            ['권한테스트-${DateTime.now().millisecondsSinceEpoch}']
          ]);

      await sheetsApi.spreadsheets.values.update(
        testData,
        spreadsheetId,
        '시트1!Z1:Z1',
        valueInputOption: 'RAW',
      );

      print('✅ 쓰기 권한 확인 성공!');

      // 테스트 데이터 삭제
      await sheetsApi.spreadsheets.values.clear(
        ClearValuesRequest(),
        spreadsheetId,
        '시트1!Z1:Z1',
      );
      print('✅ 테스트 데이터 정리 완료');
    } catch (e) {
      print('❌ 쓰기 권한 실패: $e');
      print('');
      print('🔧 해결 방법:');
      print('1. Google Sheets에서 서비스 계정에 "편집자" 권한이 설정되었는지 확인');
      print('2. 이메일: ${credentials.email}');
      print('3. 스프레드시트 공유 설정을 다시 확인');
      client.close();
      return;
    }

    print('');
    print('🎉 모든 권한 테스트 통과!');
    print('✅ 이제 upload_to_sheets.dart를 실행할 수 있습니다.');

    client.close();
  } catch (e) {
    print('❌ 테스트 중 오류 발생: $e');
    print('');
    print('일반적인 문제:');
    print('1. 서비스 계정이 스프레드시트에 공유되지 않음');
    print('2. 권한이 "편집자"가 아님');
    print('3. Google Sheets API가 활성화되지 않음');
    print('4. 네트워크 연결 문제');
  }
}
