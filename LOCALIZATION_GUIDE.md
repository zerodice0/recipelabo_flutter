# 🌍 Saucerer 다국어 구현 가이드

이 가이드는 Saucerer 앱의 다국어 시스템 사용법을 설명합니다.

## 📋 개요

- **지원 언어**: 한국어(기본), 영어, 일본어
- **번역 관리**: Google Sheets 기반
- **프레임워크**: Flutter 공식 국제화 (`flutter_localizations`)
- **자동화**: 스크립트 기반 번역 동기화

## 🎯 주요 기능

### ✅ 완료된 기능

1. **Flutter 국제화 설정**
   - `pubspec.yaml`에 `flutter_localizations`, `intl` 패키지 추가
   - `l10n.yaml` 설정으로 ARB 파일 관리
   - 한국어, 영어, 일본어 지원

2. **Google Sheets 연동**
   - 스프레드시트: https://docs.google.com/spreadsheets/d/1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns
   - 자동 번역 데이터 동기화
   - 변역자 친화적 인터페이스

3. **하드코딩 문자열 스캔**
   - 347개의 하드코딩된 한국어 문자열 발견
   - 자동 키 생성 및 번역 제안
   - Google Sheets 업로드 지원

4. **샘플 적용**
   - `UnitSelectorWidget`에 다국어 적용
   - 런타임 언어 변경 지원

## 🛠️ 사용법

### 1. 환경 설정

**필수 환경변수:**
```bash
# Google Sheets 업로드를 위한 서비스 계정 JSON
export GOOGLE_SERVICE_ACCOUNT_JSON='{"type":"service_account",...}'
```

**서비스 계정 생성 방법:**
1. [Google Cloud Console](https://console.cloud.google.com/) 접속
2. 프로젝트 생성 또는 선택
3. Google Sheets API 활성화
4. 서비스 계정 생성 및 JSON 키 다운로드
5. 스프레드시트에 서비스 계정 이메일을 편집자로 공유

### 2. 스크립트 사용법

#### 하드코딩된 문자열 스캔
```bash
# 스캔만 실행
dart scripts/scan_hardcoded_strings.dart

# 스캔 후 Google Sheets에 업로드
dart scripts/scan_hardcoded_strings.dart --upload

# 미리보기 모드 (실제 업로드 안 함)
dart scripts/scan_hardcoded_strings.dart --upload --dry-run
```

#### 번역 데이터 동기화
```bash
# Google Sheets에서 ARB 파일로 동기화
dart scripts/update_translations.dart

# 특정 스프레드시트 사용
dart scripts/update_translations.dart 1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns

# 미리보기 모드
dart scripts/update_translations.dart --dry-run
```

#### Flutter 코드 생성
```bash
# ARB 파일에서 Dart 코드 생성
flutter gen-l10n
```

### 3. 개발 워크플로우

#### 새로운 번역 추가
1. **Google Sheets에서 번역 추가**
   - 스프레드시트 열기: https://docs.google.com/spreadsheets/d/1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns
   - 새 행에 Key, Korean, English, Japanese, Description 입력

2. **ARB 파일 업데이트**
   ```bash
   dart scripts/update_translations.dart
   ```

3. **코드에서 사용**
   ```dart
   Text(AppLocalizations.of(context)!.yourNewKey)
   ```

#### 기존 하드코딩 문자열 마이그레이션
1. **하드코딩 문자열 발견 및 업로드**
   ```bash
   dart scripts/scan_hardcoded_strings.dart --upload
   ```

2. **Google Sheets에서 번역 검토**
   - 자동 생성된 영어/일본어 번역 확인
   - 필요시 수정

3. **ARB 파일 업데이트**
   ```bash
   dart scripts/update_translations.dart
   ```

4. **코드 수정**
   ```dart
   // 기존
   Text('레시피 목록')
   
   // 변경
   Text(AppLocalizations.of(context)!.recipeList)
   ```

## 📁 파일 구조

```
lib/l10n/
├── app_ko.arb              # 한국어 번역
├── app_en.arb              # 영어 번역 (템플릿)
├── app_ja.arb              # 일본어 번역
├── app_localizations.dart  # 생성된 다국어 코드
├── app_localizations_ko.dart
├── app_localizations_en.dart
└── app_localizations_ja.dart

scripts/
├── scan_hardcoded_strings.dart  # 하드코딩 문자열 스캔
├── update_translations.dart     # 번역 동기화
└── README.md                    # 스크립트 사용법

l10n.yaml                        # 국제화 설정
```

## 🔧 코드 사용 예시

### MaterialApp 설정
```dart
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
```

### 위젯에서 사용
```dart
// 기본 텍스트
Text(AppLocalizations.of(context)!.appTitle)

// 변수가 있는 텍스트
Text(AppLocalizations.of(context)!.newUnitAdded(unitName, category))

// 복수형 처리
Text(AppLocalizations.of(context)!.usageCount(count))
```

### 현재 언어 확인
```dart
final locale = Localizations.localeOf(context);
final isKorean = locale.languageCode == 'ko';
```

## 📊 현재 상태

### 스캔 결과
- **총 Dart 파일**: 97개
- **발견된 하드코딩 문자열**: 347개
- **지원 언어**: 3개 (한국어, 영어, 일본어)

### 적용된 화면
- [x] UnitSelectorWidget (부분 적용)
- [ ] MainNavigationScreen
- [ ] RecipeListScreen  
- [ ] RecipeDetailScreen
- [ ] RecipeEditScreen
- [ ] TimerScreen
- [ ] 기타 화면들

## 🎯 다음 단계

### 우선순위 1: 핵심 화면 다국어 적용
1. **MainNavigationScreen** - 탭 제목들
2. **RecipeListScreen** - 목록 화면 텍스트
3. **RecipeEditScreen** - 편집 화면 텍스트

### 우선순위 2: 전체 마이그레이션
1. 모든 하드코딩 문자열 스캔 결과 검토
2. Google Sheets에서 번역 완성
3. 코드 자동 변환 스크립트 개발

### 우선순위 3: 고급 기능
1. 컨텍스트별 번역 (복수형, 성별 등)
2. 다국어 이미지 지원
3. RTL 언어 지원 (아랍어 등)

## 🔍 문제 해결

### Google Sheets 업로드 오류
```bash
❌ Google Sheets API가 초기화되지 않았습니다.
```
**해결**: `GOOGLE_SERVICE_ACCOUNT_JSON` 환경변수 설정 확인

### ARB 파일 생성 오류
```bash
❌ flutter gen-l10n 실패
```
**해결**: `l10n.yaml` 설정 및 ARB 파일 문법 확인

### 번역 키 중복 오류
```bash
❌ 키 'duplicateKey'가 이미 존재합니다
```
**해결**: Google Sheets에서 중복 키 제거

## 🌟 베스트 프랙티스

1. **번역 키 네이밍**
   - camelCase 사용
   - 기능/화면 기반 그룹화
   - 예: `recipeListTitle`, `recipeEditSave`

2. **번역 문구 작성**
   - 간결하고 명확하게
   - 컨텍스트 설명 추가
   - 변수 위치 고려

3. **코드 작성**
   - 하드코딩 금지
   - 일관된 패턴 사용
   - null 안전성 고려

## 📚 참고 자료

- [Flutter 국제화 공식 문서](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)
- [Google Sheets API 문서](https://developers.google.com/sheets/api)
- [ARB 파일 포맷](https://github.com/google/app-resource-bundle)

---

**🎉 구현 완료!** 

이제 Google Sheets 기반의 완전한 다국어 시스템이 구축되었습니다. 번역자는 친숙한 스프레드시트 환경에서 작업할 수 있고, 개발자는 자동화된 스크립트로 효율적으로 다국어를 관리할 수 있습니다.