/// 서비스 계정 정보 확인 스크립트
/// 
/// 사용법: dart scripts/check_service_account.dart

import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  const keyPath = 'scripts/service-account-key.json';
  
  print('🔍 서비스 계정 정보를 확인합니다...');
  print('📁 파일 경로: $keyPath');
  print('');
  
  try {
    final keyFile = File(keyPath);
    
    if (!keyFile.existsSync()) {
      print('❌ 서비스 계정 JSON 파일을 찾을 수 없습니다: $keyPath');
      print('');
      print('해결 방법:');
      print('1. Google Cloud Console에서 서비스 계정 키 다운로드');
      print('2. 파일을 $keyPath에 저장');
      return;
    }
    
    final jsonContent = await keyFile.readAsString();
    final serviceAccount = jsonDecode(jsonContent);
    
    print('✅ 서비스 계정 정보:');
    print('📧 이메일: ${serviceAccount['client_email']}');
    print('🆔 프로젝트 ID: ${serviceAccount['project_id']}');
    print('🔑 키 ID: ${serviceAccount['private_key_id']}');
    print('');
    print('📋 다음 단계:');
    print('1. 위의 이메일 주소를 복사하세요');
    print('2. Google Sheets에서 "공유" 버튼 클릭');
    print('3. 복사한 이메일 주소를 추가');
    print('4. 권한을 "편집자"로 설정');
    print('5. "보내기" 클릭');
    print('');
    print('🌐 스프레드시트 링크: https://docs.google.com/spreadsheets/d/1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns/edit');
    
  } catch (e) {
    print('❌ JSON 파일을 읽는 중 오류 발생: $e');
    print('');
    print('해결 방법:');
    print('1. JSON 파일이 올바른 형식인지 확인');
    print('2. 파일이 손상되지 않았는지 확인');
    print('3. Google Cloud Console에서 키를 다시 다운로드');
  }
}