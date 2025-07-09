# GEMINI.md

이 파일은 Gemini AI 시스템이 이 프로젝트에서 작업할 때 참고할 수 있는 가이드라인을 제공합니다.

## 🌐 언어 정책

- **기본 응답 언어**: 한국어 (모든 설명, 오류 메시지, 텍스트 응답)
- **코드 주석**: 새로 추가되는 주석은 한국어로 작성
- **문서화**: 프로젝트 문서는 한국어 우선, 필요시 영어 병기

## 🌍 다국어 업데이트 가이드라인

UI 텍스트 추가/수정 시:
1. **번역 파일 우선 업데이트**: UI 변경 전 번역 파일부터 수정
2. **모든 지원 언어 번역**: 한국어(ko), 영어(en), 일본어(ja)
3. **로컬라이제이션 키 사용**: 하드코딩된 문자열 대신 번역 키 활용
4. **기존 번역 패턴 준수**: .arb 파일의 기존 패턴을 따르기
5. **다국어 UI 테스트**: 모든 언어에서 UI 레이아웃 확인

### 번역 워크플로우:
- `lib/l10n/app_ko.arb`, `lib/l10n/app_en.arb`, `lib/l10n/app_ja.arb` 업데이트
- `flutter gen-l10n` 실행하여 로컬라이제이션 클래스 생성
- 코드에서 `AppLocalizations.of(context).keyName` 사용
- 인터랙티브 i18n 도구: `./i18n.sh` 활용

## 📱 프로젝트 개요

**Recipick (레시픽)**는 개인화된 레시피 생성, 진화, 관리를 위한 Flutter 크로스플랫폼 모바일 애플리케이션입니다.

### 핵심 기능
- 📝 **레시피 버전 관리**: 기존 레시피를 덮어쓰지 않고 새 버전으로 진화
- 🔍 **재료 기반 검색**: 보유 재료로 만들 수 있는 레시피 실시간 검색
- ⏰ **요리 타이머**: 백그라운드 알림 지원하는 다중 타이머
- 📸 **요리 로그**: 사진과 메모로 요리 결과 기록
- 🌍 **다국어 지원**: 한국어, 영어, 일본어 (187개 번역 키)
- 📱 **AdMob 광고**: 환경 변수 기반 배너 광고 통합

## 🏗️ 아키텍처 원칙

### Clean Architecture 구조
```
lib/
├── core/          # 공통 설정, 서비스, DI
├── data/          # 모델, 데이터소스, 리포지토리 구현
├── domain/        # 엔티티, 리포지토리 인터페이스, 유스케이스
└── presentation/  # UI, ViewModels, 위젯
```

### 주요 기술 스택
- **Flutter**: 3.32.5 (Dart 3.8.1)
- **상태 관리**: Riverpod 2.5.1 + Riverpod Generator
- **데이터베이스**: SQLite (sqflite)
- **코드 생성**: Freezed + JSON Serializable
- **다국어**: Flutter Intl + Google Sheets API
- **광고**: Google Mobile Ads

## 🛠️ 개발 가이드라인

### 1. 코딩 규칙

#### 파일 명명 규칙
- **화면**: `*_screen.dart` (예: `recipe_list_screen.dart`)
- **위젯**: `*_widget.dart` (예: `recipe_card_widget.dart`)
- **ViewModel**: `*_viewmodel.dart` (예: `recipe_list_viewmodel.dart`)
- **엔티티**: `*_entity.dart` (예: `recipe_entity.dart`)
- **모델**: `*_model.dart` (예: `recipe_model.dart`)
- **유스케이스**: `*_usecase.dart` (예: `get_recipes_usecase.dart`)

#### 코드 스타일
- **Dart 3.8.1** 문법 활용
- **Freezed** 사용: 모든 데이터 클래스와 상태 객체
- **Riverpod Generator** 사용: 타입 안전성 확보
- **null safety** 엄격 적용
- **린트 규칙**: flutter_lints 6.0.0 준수

#### 상태 관리 패턴
```dart
// ✅ 올바른 ViewModell 패턴
@riverpod
class RecipeListViewmodel extends _$RecipeListViewmodel {
  @override
  RecipeListState build() => const RecipeListState();
  
  Future<void> loadRecipes() async {
    state = state.copyWith(isLoading: true);
    try {
      final recipes = await ref.read(getRecipesUsecaseProvider)();
      state = state.copyWith(
        recipes: recipes,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        error: error.toString(),
        isLoading: false,
      );
    }
  }
}
```

### 2. 프로젝트 구조 패턴

#### MVVM 패턴 적용
- **View**: UI만 담당, 비즈니스 로직 금지
- **ViewModel**: UI 상태 관리, Use Case 호출
- **Model**: 데이터 구조 정의 (Freezed 사용)

#### Repository 패턴
- **Domain**: 추상 인터페이스 정의
- **Data**: 구체적 구현체 제공
- **Dependency Injection**: Riverpod으로 의존성 주입

### 3. 데이터베이스 작업

#### SQLite 스키마 관리
- **현재 버전**: 14
- **마이그레이션**: `database_helper.dart`에서 관리
- **테이블 추가/수정**: 버전 증가 후 마이그레이션 로직 구현

#### 데이터 액세스 패턴
```dart
// ✅ 올바른 데이터 소스 패턴
abstract class RecipeLocalDataSource {
  Future<List<RecipeModel>> getAllRecipes();
  Future<RecipeModel?> getRecipeById(String id);
  Future<void> insertRecipe(RecipeModel recipe);
  Future<void> updateRecipe(RecipeModel recipe);
  Future<void> deleteRecipe(String id);
}
```

## 🌐 다국어 개발 워크플로우

### 대화형 CLI 도구 사용
```bash
# 대화형 메뉴 실행 (권장)
./i18n.sh

# 개별 명령어
./i18n.sh scan              # 하드코딩 문자열 스캔
./i18n.sh upload            # Google Sheets에 번역 업로드
./i18n.sh update            # ARB 파일 업데이트
./i18n.sh generate          # Flutter 코드 생성
./i18n.sh workflow          # 전체 프로세스 실행
```

### 번역 키 네이밍 규칙
- **기능별 접두사**: `navigation*`, `action*`, `recipe*`, `timer*` 등
- **의미 기반**: `navigationRecipes` (❌ `recipes`)
- **camelCase** 사용
- **설명 포함**: Google Sheets에 컨텍스트 설명 추가

### 새 번역 키 추가 절차
1. 코드에서 하드코딩 문자열 사용 (개발 단계)
2. `./i18n.sh scan`으로 하드코딩 문자열 발견
3. `scripts/improved_translations.dart`에 의미있는 키 추가
4. `./i18n.sh upload`로 Google Sheets 업로드
5. Google Sheets에서 번역 완료
6. `./i18n.sh update`로 ARB 파일 동기화
7. 코드에서 `AppLocalizations.of(context).newKey` 사용

## 🧪 테스트 가이드라인

### 테스트 실행
```bash
flutter test                    # 전체 테스트
flutter test test/unit/         # 단위 테스트만
flutter test test/widget/       # 위젯 테스트만
```

### 테스트 작성 권장사항
- **단위 테스트**: Use Case, Repository 우선
- **위젯 테스트**: 주요 화면 및 위젯
- **통합 테스트**: 핵심 사용자 플로우
- **Mock 사용**: `mockito` 패키지 활용

## 🚀 빌드 및 배포

### 개발 명령어
```bash
# 의존성 설치
flutter pub get

# 코드 생성
flutter packages pub run build_runner build --delete-conflicting-outputs

# 분석 및 포맷팅
flutter analyze
dart format .

# 실행
flutter run
```

### 빌드 명령어
```bash
# Android APK
flutter build apk

# iOS 빌드
flutter build ios

# 번들 사이즈 분석
flutter build apk --analyze-size
```

## 📁 주요 파일 및 폴더

### 필수 파일
- `pubspec.yaml`: 의존성 관리
- `l10n.yaml`: 다국어 설정
- `analysis_options.yaml`: 린트 규칙
- `.env`: 환경변수 (Git에 포함하지 않음)
- `i18n.sh`: 다국어 관리 CLI 도구

### 핵심 폴더
- `lib/core/di/`: Riverpod 프로바이더 정의
- `lib/data/datasources/local/`: SQLite 데이터 액세스
- `lib/domain/usecases/`: 비즈니스 로직 캡슐화
- `lib/presentation/*/viewmodel/`: 화면별 상태 관리
- `scripts/`: 번역 관리 및 유틸리티 스크립트

## ⚠️ 주의사항

### 금지 사항
- **절대 경로 하드코딩**: 상대 경로 사용
- **비즈니스 로직을 Widget에**: ViewModel에 위임
- **직접 데이터베이스 액세스**: Repository 패턴 준수
- **하드코딩된 문자열**: AppLocalizations 사용
- **Secret 정보 커밋**: .env 파일 활용

### 권장 사항
- **작은 단위 커밋**: 기능별로 나누어 커밋
- **Conventional Commits**: feat:, fix:, docs: 등 사용
- **코드 리뷰**: Pull Request 활용
- **테스트 작성**: 새 기능 개발 시 테스트 함께 작성

### 자동 생성 파일 관리 규칙

**🚨 중요: 자동 생성 파일은 절대 수동으로 수정하지 마세요**

- **수정 금지 파일**: `.freezed.dart`, `.g.dart`, `.gr.dart` 확장자
- **수정 금지 파일**: `lib/l10n/` 폴더 내 `.arb` 파일 제외 모든 파일
- **수정 금지 파일**: `// GENERATED CODE` 헤더가 있는 모든 파일
- **문제 발생 시**: 소스 파일(`.dart`)을 수정하고 다시 생성
  - `flutter packages pub run build_runner build --delete-conflicting-outputs`
  - `flutter gen-l10n`
- **Freezed 컴파일 오류**: 생성된 `.freezed.dart` 파일이 아닌 원본 `.dart` 파일의 문법 오류 확인

## 🔧 문제 해결

### 자주 발생하는 문제

#### 1. Freezed 코드 생성 문제
```bash
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```

#### 2. 다국어 키 누락
```bash
./i18n.sh scan          # 하드코딩 문자열 확인
./i18n.sh update        # Google Sheets에서 최신 번역 가져오기
```

#### 3. 의존성 충돌
```bash
flutter pub deps        # 의존성 트리 확인
flutter pub upgrade     # 안전한 업그레이드
```

#### 4. 빌드 오류
```bash
flutter clean           # 빌드 캐시 정리
flutter pub get         # 의존성 재설치
flutter analyze         # 린트 오류 확인
```

### 디버깅 도구
- **Flutter Inspector**: 위젯 트리 분석
- **Riverpod Inspector**: 상태 관리 디버깅
- **SQLite Browser**: 데이터베이스 검사
- **Flutter DevTools**: 성능 및 메모리 분석

## 🎯 현재 구현 상태

### ✅ 완료된 기능
- **Core App Structure**: 4-tab 네비게이션, Clean Architecture, SQLite DB v14
- **Recipe Management**: 레시피 CRUD, 버전 관리, 상세 정보
- **Search & Discovery**: 재료 기반 실시간 검색, 칩 시스템
- **Cooking Features**: 요리 로그, 다중 타이머, 백그라운드 알림
- **Data Management**: 양념 관리, 이미지 저장, 단위 시스템
- **Internationalization**: 187개 번역 키, Google Sheets 통합, 대화형 CLI
- **AdMob Integration**: 환경 변수 기반 배너 광고

### 🚧 부분 구현
- **Authentication**: 기본 구조 존재, 실제 인증 시스템 미구현
- **Profile/Settings**: 양념 관리만 구현, 사용자 프로필 기능 미완성

### ❌ 미구현
- **Splash Screen**: 런치 스크린 미구현
- **User Authentication**: 로그인/회원가입 기능 미구현
- **Remote Sync**: 서버 동기화 미구현 (Local-First 상태)
- **Sharing Features**: 레시피 공유 기능 미구현

## 📚 추가 자료

- [Flutter 공식 문서](https://flutter.dev/docs)
- [Riverpod 공식 문서](https://riverpod.dev)
- [Freezed 패키지](https://pub.dev/packages/freezed)
- [Clean Architecture 가이드](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Google Sheets API](https://developers.google.com/sheets/api)

---

이 가이드라인을 준수하여 일관성 있고 유지보수 가능한 코드를 작성해주세요. 추가 질문이나 명확하지 않은 부분이 있다면 프로젝트 문서 또는 기존 코드를 참고하시기 바랍니다.