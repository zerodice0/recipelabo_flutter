# 번역 관리 스크립트

이 디렉토리에는 Google Sheets를 사용하여 다국어 번역을 관리하는 스크립트가 있습니다.

## 설정 방법

### 1. Google Cloud Console 설정

1. [Google Cloud Console](https://console.cloud.google.com/)에 접속
2. 새 프로젝트 생성 또는 기존 프로젝트 선택
3. **API 및 서비스** > **라이브러리**에서 "Google Sheets API" 검색 후 활성화
4. **API 및 서비스** > **사용자 인증 정보**에서 API 키 생성

### 2. Google Sheets 준비

1. 새 Google Sheets 문서 생성
2. 첫 번째 행에 헤더 추가:
   - A1: `Key` (번역 키)
   - B1: `Korean` (한국어)
   - C1: `English` (영어) 
   - D1: `Japanese` (일본어)
   - E1: `Description` (설명)

3. 예시 데이터:
   ```
   Key            Korean        English       Japanese      Description
   appTitle       소서러        Saucerer      ソーサラー    앱 제목
   recipes        레시피        Recipes       レシピ        레시피 탭
   search         검색          Search        検索          검색 탭
   ```

4. 스프레드시트를 **공개** 또는 **링크가 있는 모든 사용자**로 공유 설정

### 3. 환경변수 설정

```bash
# API 키 방식 (추천)
export GOOGLE_SHEETS_API_KEY="your_api_key_here"

# 또는 서비스 계정 방식
export GOOGLE_SERVICE_ACCOUNT_JSON='{"type":"service_account",...}'
```

### 4. 스프레드시트 ID 확인

Google Sheets URL에서 ID 부분을 복사:
```
https://docs.google.com/spreadsheets/d/1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms/edit
                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                    이 부분이 스프레드시트 ID
```

## 사용법

### 기본 사용법

```bash
# 기본 스프레드시트 사용 (scripts/update_translations.dart에서 defaultSheetId 수정 필요)
dart scripts/update_translations.dart

# 특정 스프레드시트 사용
dart scripts/update_translations.dart 1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms

# 미리보기 모드 (실제 파일 생성 안 함)
dart scripts/update_translations.dart --dry-run

# 도움말
dart scripts/update_translations.dart --help
```

### 개발 워크플로우

1. **번역 데이터 수정**: Google Sheets에서 번역 추가/수정
2. **스크립트 실행**: `dart scripts/update_translations.dart`
3. **코드 생성**: `flutter gen-l10n` (스크립트가 자동 실행)
4. **앱 테스트**: 변경된 번역이 제대로 적용되는지 확인
5. **커밋**: 생성된 ARB 파일들을 Git에 커밋

## 파일 구조

```
lib/l10n/
├── app_ko.arb              # 한국어 번역
├── app_en.arb              # 영어 번역 (템플릿)
├── app_ja.arb              # 일본어 번역
├── app_localizations.dart  # 생성된 다국어 코드
├── app_localizations_ko.dart
├── app_localizations_en.dart
└── app_localizations_ja.dart
```

## 코드에서 사용법

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:saucerer_flutter/l10n/app_localizations.dart';

// MaterialApp 설정
MaterialApp(
  localizationsDelegates: const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('ko'),
    Locale('en'),
    Locale('ja'),
  ],
  // ...
)

// 위젯에서 사용
Text(AppLocalizations.of(context)!.appTitle)
```

## 문제 해결

### API 키 관련 오류
```
API_KEY_INVALID 또는 PERMISSION_DENIED
```
- API 키가 올바른지 확인
- Google Sheets API가 활성화되어 있는지 확인
- 스프레드시트가 공개 또는 공유되어 있는지 확인

### 스프레드시트 접근 오류
```
SPREADSHEET_NOT_FOUND
```
- 스프레드시트 ID가 올바른지 확인
- 스프레드시트가 삭제되지 않았는지 확인
- 공유 설정이 올바른지 확인

### 권한 오류
```
Insufficient permissions
```
- API 키 제한 사항 확인
- 서비스 계정 권한 확인
- 스프레드시트 공유 설정 확인

## 고급 사용법

### 자동화
GitHub Actions나 CI/CD 파이프라인에서 사용할 수 있습니다:

```yaml
- name: Update translations
  env:
    GOOGLE_SHEETS_API_KEY: ${{ secrets.GOOGLE_SHEETS_API_KEY }}
  run: |
    dart scripts/update_translations.dart
    flutter gen-l10n
```

### 커스텀 설정
`scripts/update_translations.dart` 파일에서 다음을 수정할 수 있습니다:
- `defaultSheetId`: 기본 스프레드시트 ID
- `sheetRange`: 데이터 범위
- 언어 추가/제거
- ARB 파일 포맷 변경