import 'dart:io';

/// .env 파일 로딩 테스트 스크립트
Future<void> main() async {
  print('🔍 .env 파일 로딩 테스트 시작');
  print('=' * 50);

  // 1. .env 파일 존재 여부 확인
  final envFile = File('.env');
  print('📁 .env 파일 존재: ${await envFile.exists()}');

  if (!await envFile.exists()) {
    print('❌ .env 파일이 존재하지 않습니다.');
    exit(1);
  }

  // 2. .env 파일 내용 확인
  print('\n📋 .env 파일 내용:');
  final content = await envFile.readAsString();
  print('파일 크기: ${content.length} bytes');
  
  // 첫 500자만 표시
  final preview = content.length > 500 ? content.substring(0, 500) + '...' : content;
  print('내용 미리보기:\n$preview\n');

  // 3. 라인별 파싱 테스트
  print('🔄 라인별 파싱 테스트:');
  final lines = await envFile.readAsLines();
  print('총 라인 수: ${lines.length}');

  int processedCount = 0;
  for (int i = 0; i < lines.length; i++) {
    final line = lines[i];
    final trimmed = line.trim();
    
    if (trimmed.isEmpty || trimmed.startsWith('#')) {
      continue;
    }

    final splitIndex = trimmed.indexOf('=');
    if (splitIndex == -1) {
      continue;
    }

    final key = trimmed.substring(0, splitIndex).trim();
    final value = trimmed.substring(splitIndex + 1).trim();
    
    print('라인 ${i + 1}: $key = ${value.length > 50 ? value.substring(0, 50) + "..." : value}');
    processedCount++;
  }

  print('\n✅ 처리된 환경변수: $processedCount개');

  // 4. 개선된 .env 로딩 함수 테스트
  print('\n🚀 개선된 .env 로딩 테스트:');
  await loadEnvFile();

  // 5. 로드된 환경변수 확인
  print('\n📊 로드된 SAUCERER_ 환경변수들:');
  final saucererVars = Platform.environment.entries
      .where((entry) => entry.key.startsWith('SAUCERER_'))
      .toList();

  if (saucererVars.isEmpty) {
    print('❌ SAUCERER_ 환경변수가 없습니다.');
  } else {
    for (final entry in saucererVars) {
      final value = entry.value.length > 100 
          ? '${entry.value.substring(0, 100)}...'
          : entry.value;
      print('${entry.key} = $value');
    }
  }

  print('\n' + '=' * 50);
  print('🎉 테스트 완료!');
}

/// 개선된 .env 파일 로딩 함수
Future<void> loadEnvFile() async {
  try {
    final envFile = File('.env');
    if (!await envFile.exists()) {
      print('💡 .env 파일을 찾을 수 없습니다.');
      return;
    }

    final content = await envFile.readAsString();
    final lines = content.split('\n');
    
    String? currentKey;
    String currentValue = '';
    bool inMultilineValue = false;

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      final trimmed = line.trim();
      
      // 빈 줄이나 주석은 건너뛰기
      if (!inMultilineValue && (trimmed.isEmpty || trimmed.startsWith('#'))) {
        continue;
      }

      if (!inMultilineValue) {
        // 새로운 키=값 찾기
        final splitIndex = trimmed.indexOf('=');
        if (splitIndex == -1) continue;

        currentKey = trimmed.substring(0, splitIndex).trim();
        final valueStart = trimmed.substring(splitIndex + 1).trim();

        if (valueStart.startsWith('{')) {
          // JSON 시작
          inMultilineValue = true;
          currentValue = valueStart;
        } else {
          // 단일 라인 값
          Platform.environment[currentKey] = valueStart;
          print('✅ 설정됨: $currentKey');
        }
      } else {
        // 멀티라인 값 계속
        currentValue += '\n$line';
        
        if (trimmed.endsWith('}')) {
          // JSON 끝
          inMultilineValue = false;
          if (currentKey != null) {
            Platform.environment[currentKey] = currentValue;
            print('✅ 설정됨: $currentKey (JSON)');
          }
          currentKey = null;
          currentValue = '';
        }
      }
    }

    print('✅ .env 파일에서 환경변수를 로드했습니다.');
  } catch (e) {
    print('❌ .env 파일 로딩 실패: $e');
  }
}