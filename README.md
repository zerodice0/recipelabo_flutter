# 🍳 소서러 (Saucerer) - Flutter

**나만의 소스 레시피를 만들고, 공유하고, 발견하세요!**

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/github/license/zerodice0/saucerer_flutter?style=for-the-badge" alt="License" />
</p>

---

`소서러(Saucerer)`는 '소스(Sauce)'와 '-rer(~하는 사람)'의 합성어로, 자신만의 특별한 소스 레시피를 만들고 관리하는 사람들을 위한 앱입니다. 이 프로젝트는 Flutter를 사용하여 iOS와 Android 모두에서 동작하는 크로스플랫폼 애플리케이션으로 개발됩니다.

## 🌍 지원 언어

소서러는 다음 언어를 지원합니다:
- 한국어 (기본)
- 영어
- 일본어

앱은 자동으로 시스템 언어를 감지하거나 사용자가 수동으로 언어를 선택할 수 있습니다.

## 🏛️ 아키텍처

프로젝트의 전체적인 아키텍처와 데이터 흐름, 상태 관리 전략 등은 아래 문서에서 자세히 확인할 수 있습니다.

[➡️ 소서러 플러터 아키텍처 자세히 보기](./ARCHITECTURE.md)

## 🛠️ 기술 스택

- **프레임워크**: Flutter
- **언어**: Dart
- **국제화**: Flutter 공식 국제화 패키지 (flutter_localizations)
- **상태 관리**: Riverpod
- **데이터베이스**: SQLite
- **알림**: Flutter Local Notifications

## 🌐 국제화 (i18n) 개발 가이드

소서러는 한국어, 영어, 일본어를 지원하는 다국어 앱입니다. 번역 관리를 위해 Google Sheets를 사용합니다.

### 번역 관리 워크플로우

1. **Google Sheets에서 번역 편집**
   - 번역 데이터는 Google Sheets에서 관리됩니다
   - 각 언어별로 열이 구분되어 있습니다

2. **번역 동기화**
   ```bash
   # Google Sheets에서 ARB 파일로 동기화
   dart run scripts/update_translations.dart
   ```

3. **코드 생성**
   ```bash
   # 번역 파일 기반으로 코드 생성
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

### 새로운 번역 키 추가

1. Google Sheets에 새로운 키와 번역 추가
2. 동기화 스크립트 실행
3. 코드에서 사용:
   ```dart
   Text(AppLocalizations.of(context)!.yourNewKey)
   ```

### 하드코딩된 문자열 스캔

기존 코드에서 하드코딩된 문자열을 찾아 번역 키로 변환:

```bash
# 하드코딩된 문자열 스캔
dart run scripts/scan_hardcoded_strings.dart
```

## 📄 라이선스

이 프로젝트는 [MIT 라이선스](./LICENSE)를 따릅니다.