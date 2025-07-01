# Saucerer Flutter 개발자 온보딩 가이드

## 📖 목차
- [프로젝트 개요](#-프로젝트-개요)
- [기술 스택](#-기술-스택)
- [아키텍처 패턴](#-아키텍처-패턴)
- [핵심 패키지 및 라이브러리](#-핵심-패키지-및-라이브러리)
- [개발 환경 설정](#-개발-환경-설정)
- [프로젝트 구조](#-프로젝트-구조)
- [코딩 컨벤션](#-코딩-컨벤션)
- [주요 패턴과 사용법](#-주요-패턴과-사용법)
- [새로운 기능 추가 가이드](#-새로운-기능-추가-가이드)
- [디버깅 및 테스팅](#-디버깅-및-테스팅)
- [추가 학습 자료](#-추가-학습-자료)

## 🎯 프로젝트 개요

**Saucerer**는 개인화된 소스 레시피 생성, 진화, 관리를 위한 Flutter 크로스플랫폼 모바일 애플리케이션입니다.

### 핵심 목표
- **개인화된 레시피 자산 관리**: 정확한 재료와 분량을 체계적으로 기록
- **진화적 레시피 개발**: 버전 관리와 요리 로그를 통한 점진적 레시피 개선
- **원활한 사용자 경험**: 컨텍스트 내 재료 생성, 태그 기반 입력 시스템
- **데이터 기반 발견**: 보유 재료 기반 레시피 검색
- **견고하고 확장 가능한 아키텍처**: Local-First 접근법과 Clean Architecture

### 주요 기능
- ✅ 레시피 관리 (생성, 수정, 삭제, 버전 관리)
- ✅ 재료 기반 검색
- ✅ 요리 로그 및 타이머
- ✅ 조미료/양념 마스터 데이터 관리
- ✅ 오프라인 우선 아키텍처
- 🚧 사용자 인증 (구조만 구현)
- ❌ 원격 동기화 및 공유 기능 (미구현)

## 🛠 기술 스택

### 핵심 프레임워크
- **Flutter 3.7.2+**: 크로스플랫폼 UI 프레임워크
  - [Flutter 공식 문서](https://docs.flutter.dev/)
  - [Flutter 튜토리얼](https://flutter.dev/learn)

### 상태 관리
- **Riverpod 2.5.1**: 함수형 상태 관리 및 의존성 주입
  - [Riverpod 공식 문서](https://riverpod.dev/)
  - [Riverpod Generator](https://docs-v2.riverpod.dev/docs/concepts/about_code_generation)

### 코드 생성
- **Freezed 2.5.3**: 불변 클래스 및 Union 타입 생성
  - [Freezed 패키지 문서](https://pub.dev/packages/freezed)
  - [Freezed 가이드](https://blog.codemagic.io/freezed-code-generation-in-dart/)
- **JSON Annotation/Serializable**: JSON 직렬화
  - [JSON 직렬화 가이드](https://docs.flutter.dev/data-and-backend/serialization/json)

### 데이터베이스
- **SQLite (sqflite 2.3.3+)**: 로컬 데이터베이스
  - [SQLite Flutter 가이드](https://docs.flutter.dev/cookbook/persistence/sqlite)
  - [sqflite 패키지](https://pub.dev/packages/sqflite)

### 네비게이션
- **GoRouter 14.2.7**: 선언적 라우팅
  - [GoRouter 공식 문서](https://docs.flutter.dev/ui/navigation/url-routing)
  - [GoRouter 가이드](https://blog.codemagic.io/flutter-go-router/)

### 로컬 기능
- **Flutter Local Notifications**: 백그라운드 알림
  - [로컬 알림 가이드](https://pub.dev/packages/flutter_local_notifications)
- **Image Picker**: 이미지 선택
  - [Image Picker 사용법](https://pub.dev/packages/image_picker)
- **Path Provider**: 파일 시스템 접근
  - [Path Provider 가이드](https://pub.dev/packages/path_provider)

### 국제화
- **Flutter Localizations**: 다국어 지원 (한국어, 영어, 일본어)
  - [국제화 가이드](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization)

## 🏗 아키텍처 패턴

### Clean Architecture
프로젝트는 Clean Architecture 원칙을 따라 다음과 같이 계층을 분리합니다:

```
┌─────────────────────────────────────┐
│         Presentation Layer          │ ← UI, ViewModels, Screens
├─────────────────────────────────────┤
│           Domain Layer              │ ← Entities, Use Cases, Repository Interfaces
├─────────────────────────────────────┤
│            Data Layer               │ ← Repository Implementations, Data Sources, Models
├─────────────────────────────────────┤
│            Core Layer               │ ← DI, Routing, Theme, Services
└─────────────────────────────────────┘
```

**학습 자료:**
- [Clean Architecture 소개](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Clean Architecture 가이드](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)

### MVVM 패턴
UI는 Model-View-ViewModel 패턴을 사용합니다:
- **View**: Flutter 위젯 (Stateless/Stateful Widget)
- **ViewModel**: Riverpod NotifierProvider로 구현
- **Model**: Domain Entities

## 📦 핵심 패키지 및 라이브러리

### 필수 패키지 분석

#### 1. 상태 관리 & 의존성 주입
```yaml
flutter_riverpod: ^2.5.1
riverpod_annotation: ^2.3.5
riverpod_generator: ^2.4.0
```
- **Riverpod**: 함수형 상태 관리, 자동 의존성 해결
- **학습 링크**: [Riverpod 마스터하기](https://riverpod.dev/ko/docs/getting_started)

#### 2. 코드 생성
```yaml
freezed: ^2.5.3
freezed_annotation: ^2.4.4
json_annotation: ^4.9.0
json_serializable: ^6.8.0
build_runner: ^2.4.11
```
- **Freezed**: 불변 클래스, copyWith, Union 타입 생성
- **JSON Serializable**: 자동 JSON 변환
- **학습 링크**: [Dart 코드 생성 가이드](https://dart.dev/tools/build_runner)

#### 3. 데이터베이스
```yaml
sqflite: ^2.3.3+1
path: ^1.9.0
```
- **SQLite**: 로컬 관계형 데이터베이스
- **학습 링크**: [SQLite 기초](https://www.sqlitetutorial.net/)

#### 4. 라우팅
```yaml
go_router: ^14.2.7
```
- **GoRouter**: 선언적 라우팅, 딥링크 지원
- **학습 링크**: [GoRouter 마스터하기](https://docs.flutter.dev/ui/navigation/url-routing)

#### 5. 로컬 기능
```yaml
flutter_local_notifications: ^17.2.3
timezone: ^0.9.4
image_picker: ^1.1.2
path_provider: ^2.1.3
uuid: ^4.4.0
```
- **로컬 알림**: 백그라운드 타이머 알림
- **이미지 처리**: 카메라/갤러리에서 이미지 선택
- **학습 링크**: [Flutter 로컬 기능](https://docs.flutter.dev/platform-integration)

#### 6. 국제화
```yaml
flutter_localizations:
  sdk: flutter
intl: ^0.19.0
```
- **다국어 지원**: ARB 파일 기반 국제화
- **학습 링크**: [Flutter 국제화](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization)

#### 7. 테스팅
```yaml
flutter_test:
  sdk: flutter
sqflite_common_ffi: ^2.3.3
```
- **단위 테스트**: 비즈니스 로직 테스트
- **SQLite 테스트**: 메모리 내 데이터베이스 테스트

## ⚙️ 개발 환경 설정

### 1. 저장소 클론
```bash
git clone <repository-url>
cd saucerer_flutter
```

### 2. 의존성 설치
```bash
flutter pub get
```

### 3. 코드 생성
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. 앱 실행
```bash
flutter run
```

### 5. 테스트 실행
```bash
flutter test
```

## 📁 프로젝트 구조

```
lib/
├── main.dart                          # 앱 진입점
├── core/                             # 핵심 공통 모듈
│   ├── config/                       # 앱 설정 (테마, 색상)
│   ├── di/                          # 의존성 주입 (Riverpod)
│   ├── routes/                      # 라우팅 (GoRouter)
│   └── services/                    # 핵심 서비스 (이미지, 타이머)
├── data/                            # 데이터 계층
│   ├── datasources/local/           # 로컬 데이터 소스 (SQLite)
│   ├── models/                      # 데이터 모델 (JSON 직렬화)
│   └── repositories/                # 리포지토리 구현체
├── domain/                          # 도메인 계층
│   ├── entities/                    # 비즈니스 엔티티 (Freezed)
│   ├── repositories/                # 리포지토리 인터페이스
│   └── usecases/                    # 비즈니스 로직 (40+ Use Cases)
└── presentation/                    # UI 계층
    ├── main/                        # 메인 네비게이션
    ├── recipe/                      # 레시피 관련 화면
    ├── search/                      # 검색 기능
    ├── cooking_log/                 # 요리 로그
    ├── seasoning/                   # 조미료 관리
    └── timer/                       # 타이머 기능
```

### 폴더별 역할

#### `core/`
- **config/**: 앱 전역 설정 (테마, 색상, 공통 위젯)
- **di/**: Riverpod을 사용한 의존성 주입 설정
- **routes/**: GoRouter 기반 라우팅 설정
- **services/**: 이미지 저장, 타이머 등 핵심 서비스

#### `data/`
- **datasources/**: SQLite 등 실제 데이터 접근 레이어
- **models/**: JSON 직렬화가 가능한 데이터 모델
- **repositories/**: 도메인 리포지토리 인터페이스의 구현체

#### `domain/`
- **entities/**: 순수한 비즈니스 객체 (Freezed 사용)
- **repositories/**: 데이터 접근을 위한 추상 인터페이스
- **usecases/**: 구체적인 비즈니스 로직을 캡슐화

#### `presentation/`
- **각 기능별 폴더**: view와 viewmodel로 구분
- **widgets/**: 재사용 가능한 UI 컴포넌트

## 📋 코딩 컨벤션

### 1. 파일 명명 규칙
- **스네이크 케이스**: `recipe_list_screen.dart`
- **접미사 사용**:
  - 화면: `_screen.dart`
  - 뷰모델: `_viewmodel.dart`
  - 엔티티: `_entity.dart`
  - 모델: `_model.dart`
  - 유스케이스: `_usecase.dart`

### 2. 클래스 명명 규칙
- **파스칼 케이스**: `RecipeListScreen`
- **의미있는 접미사**: `Screen`, `ViewModel`, `Entity`, `Model`, `UseCase`

### 3. 코드 스타일
- **라인 길이**: 80자 이하
- **트레일링 콤마**: 항상 사용
- **const 위젯**: 가능한 모든 곳에서 사용
- **화살표 함수**: 단순한 한 줄 함수에 사용

### 4. 주석 규칙
- **한국어 주석**: 복잡한 로직 설명
- **문서 주석**: 공개 API에 `///` 사용

## 🔧 주요 패턴과 사용법

### 1. Riverpod Provider 패턴

```dart
// @riverpod 어노테이션 사용 (권장)
@riverpod
class RecipeListViewModel extends _$RecipeListViewModel {
  @override
  Future<List<RecipeEntity>> build() async {
    return _fetchRecipes();
  }
  
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchRecipes());
  }
}

// 의존성 주입
@riverpod
GetRecipesUseCase getRecipesUseCase(Ref ref) {
  final repository = ref.watch(recipeRepositoryProvider);
  return GetRecipesUseCase(repository);
}
```

**학습 자료**: [Riverpod Code Generation](https://docs-v2.riverpod.dev/docs/concepts/about_code_generation)

### 2. Freezed 엔티티/모델 패턴

```dart
// 엔티티 (domain layer)
@freezed
class RecipeEntity with _$RecipeEntity {
  const factory RecipeEntity({
    required String id,
    required String name,
    String? description,
    required DateTime createdAt,
  }) = _RecipeEntity;
}

// 모델 (data layer)
@freezed
class RecipeModel with _$RecipeModel {
  const factory RecipeModel({
    required String id,
    required String name,
    String? description,
    required DateTime createdAt,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
}
```

**학습 자료**: [Freezed 완전 가이드](https://pub.dev/packages/freezed)

### 3. UseCase 패턴

```dart
class GetRecipesUseCase {
  final RecipeRepository _repository;

  GetRecipesUseCase(this._repository);

  Future<List<RecipeEntity>> call() {
    return _repository.getRecipes();
  }
}

// Riverpod 제공자
@riverpod
GetRecipesUseCase getRecipesUseCase(Ref ref) {
  final repository = ref.watch(recipeRepositoryProvider);
  return GetRecipesUseCase(repository);
}
```

### 4. Repository 패턴

```dart
// 인터페이스 (domain layer)
abstract class RecipeRepository {
  Future<List<RecipeEntity>> getRecipes();
  Future<RecipeEntity?> getRecipe(String id);
  Future<void> saveRecipe(RecipeEntity recipe);
}

// 구현체 (data layer)
class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeLocalDataSource localDataSource;

  RecipeRepositoryImpl({required this.localDataSource});

  @override
  Future<List<RecipeEntity>> getRecipes() async {
    final models = await localDataSource.getRecipes();
    return models.map((m) => m.toEntity()).toList();
  }
}
```

### 5. UI와 ViewModel 연결

```dart
class RecipeListScreen extends ConsumerWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecipes = ref.watch(recipeListViewModelProvider);
    
    return Scaffold(
      body: asyncRecipes.when(
        data: (recipes) => ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) => RecipeCard(recipes[index]),
        ),
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => SelectableText.rich(
          TextSpan(
            text: '오류: $error',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
      ),
    );
  }
}
```

## 🚀 새로운 기능 추가 가이드

### 1. 새로운 엔티티 추가

1. **도메인 엔티티 생성** (`domain/entities/`)
2. **데이터 모델 생성** (`data/models/`)
3. **데이터베이스 테이블 추가** (`database_helper.dart`)
4. **코드 생성 실행**: `flutter pub run build_runner build`

### 2. 새로운 화면 추가

1. **라우트 추가** (`core/routes/app_router.dart`)
2. **ViewModel 생성** (`presentation/feature/viewmodel/`)
3. **View 생성** (`presentation/feature/view/`)
4. **필요한 UseCase 생성** (`domain/usecases/`)

### 3. 새로운 UseCase 추가

1. **UseCase 클래스 생성** (`domain/usecases/`)
2. **Riverpod Provider 추가** (파일 하단)
3. **의존성 주입 설정** (`core/di/provider.dart`)

## 🔍 디버깅 및 테스팅

### 1. 로깅
```dart
import 'dart:developer';

// print 대신 log 사용
log('디버그 메시지: $data');
```

### 2. 데이터베이스 디버깅
```dart
// SQLite 쿼리 로깅
await db.rawQuery('SELECT * FROM recipes').then((result) {
  log('Query result: $result');
});
```

### 3. 단위 테스트 작성
```dart
void main() {
  group('RecipeRepository Tests', () {
    late RecipeRepository repository;
    
    setUp(() {
      // 테스트 설정
    });
    
    test('should return recipes when call getRecipes', () async {
      // Given
      // When  
      // Then
    });
  });
}
```

### 4. 주요 명령어
```bash
# 코드 분석
flutter analyze

# 포맷팅
dart format .

# 코드 생성
flutter pub run build_runner build --delete-conflicting-outputs

# 테스트 실행
flutter test

# 커버리지 확인
flutter test --coverage
```

## 🎨 UI/UX 가이드라인

### 1. Material Design 3
- **Seed Color**: 따뜻한 오렌지 (#FF8C42)
- **테마**: 라이트/다크 모드 지원
- **색상 시스템**: `AppColors` 클래스 사용

### 2. 컴포넌트 사용법
```dart
// 에러 표시 (SnackBar 금지)
SelectableText.rich(
  TextSpan(
    text: '오류 메시지',
    style: TextStyle(color: Theme.of(context).colorScheme.error),
  ),
)

// 카드 위젯
Card(
  child: ListTile(
    title: Text('제목'),
    subtitle: Text('부제목'),
  ),
)
```

### 3. 반응형 디자인
- **화면 크기 대응**: MediaQuery 사용
- **적응형 레이아웃**: LayoutBuilder 활용

## 📚 추가 학습 자료

### Flutter 기초
- [Flutter 공식 쿡북](https://docs.flutter.dev/cookbook)
- [Dart 언어 투어](https://dart.dev/language)
- [Flutter 위젯 카탈로그](https://docs.flutter.dev/ui/widgets)

### 상태 관리
- [Riverpod 공식 문서](https://riverpod.dev/ko/)
- [Riverpod vs Provider](https://blog.codemagic.io/riverpod-flutter-guide/)

### 아키텍처
- [Clean Architecture in Flutter](https://resocoder.com/flutter-clean-architecture-tdd/)
- [MVVM Pattern in Flutter](https://medium.com/flutter-community/mvvm-in-flutter-using-dart-f04affebcb49)

### 코드 생성
- [Freezed Documentation](https://pub.dev/packages/freezed)
- [Build Runner Guide](https://dart.dev/tools/build_runner)

### 데이터베이스
- [SQLite Tutorial](https://www.sqlitetutorial.net/)
- [Flutter SQLite Guide](https://docs.flutter.dev/cookbook/persistence/sqlite)

### 테스팅
- [Flutter Testing Guide](https://docs.flutter.dev/testing)
- [Widget Testing](https://docs.flutter.dev/cookbook/testing/widget)

## 🆘 문제 해결

### 자주 발생하는 문제

1. **코드 생성 오류**
   ```bash
   flutter pub run build_runner clean
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

2. **의존성 충돌**
   ```bash
   flutter clean
   flutter pub get
   ```

3. **iOS 빌드 오류**
   ```bash
   cd ios && pod install
   ```

4. **Android 빌드 오류**
   - Gradle 캐시 정리: `cd android && ./gradlew clean`

### 도움 받기
- **공식 문서**: 각 패키지의 공식 문서 우선 참조
- **GitHub Issues**: 패키지별 이슈 트래커 확인
- **Flutter 커뮤니티**: [Flutter 한국 커뮤니티](https://flutter-ko.dev/)

---

이 문서를 통해 Saucerer Flutter 프로젝트에 빠르게 적응하고 효과적으로 개발할 수 있기를 바랍니다! 🚀 