# 🍳 레시피라보 (RecipeLabo) - Flutter

**나만의 레시피를 쉽게 선택하고, 만들고, 관리하세요!**

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/github/license/zerodice0/recipick_flutter?style=for-the-badge" alt="License" />
</p>

---

`레시피라보(RecipeLabo)`는 '레시피(Recipe)'와 '실험실(Laboratory)'의 합성어로, 자신만의 특별한 레시피를 실험하고 발전시키며 관리하는 사람들을 위한 앱입니다. 이 프로젝트는 Flutter를 사용하여 iOS와 Android 모두에서 동작하는 크로스플랫폼 애플리케이션으로 개발됩니다.

## 🌍 지원 언어

레시피라보는 다음 언어를 지원합니다:
- 한국어 (기본)
- 영어
- 일본어

앱은 자동으로 시스템 언어를 감지하거나 사용자가 수동으로 언어를 선택할 수 있습니다. 완전한 다국어 지원으로 187개의 번역 키를 통해 UI의 모든 텍스트가 현지화됩니다.

## 🏛️ 아키텍처

프로젝트의 전체적인 아키텍처와 데이터 흐름, 상태 관리 전략 등은 아래 문서에서 자세히 확인할 수 있습니다.

[➡️ 레시피라보 플러터 아키텍처 자세히 보기](./ARCHITECTURE.md)

## 🛠️ 기술 스택

- **프레임워크**: Flutter 3.32.5
- **언어**: Dart 3.8.1
- **국제화**: Flutter 공식 국제화 패키지 (flutter_localizations)
- **상태 관리**: Riverpod 2.5.1 + Riverpod Generator
- **데이터베이스**: SQLite (sqflite)
- **알림**: Flutter Local Notifications
- **광고**: Google Mobile Ads (AdMob)
- **코드 생성**: Freezed + JSON Serializable
- **번역 관리**: Google Sheets API + 대화형 CLI 도구

## 🌐 국제화 (i18n) 개발 가이드

레시피라보는 한국어, 영어, 일본어를 지원하는 다국어 앱입니다. 번역 관리를 위해 Google Sheets를 사용하며, 편리한 쉘 스크립트를 제공합니다.

### 🚀 새로운 기능 추가 시 다국어 우선 원칙

새로운 UI 요소나 기능을 추가할 때는 다음 순서를 따라주세요:

1. **번역 키 먼저 추가**: Google Sheets에 새로운 번역 키와 3개 언어 번역 추가
2. **ARB 파일 업데이트**: `./i18n.sh update` 실행하여 번역 파일 동기화
3. **Flutter 코드 생성**: `./i18n.sh generate` 실행하여 다국어 코드 생성
4. **UI 구현**: `AppLocalizations.of(context)!.yourNewKey` 사용하여 UI 구현

이 순서를 따르면 하드코딩된 문자열을 방지하고 일관된 다국어 지원을 보장할 수 있습니다.

### 🚀 빠른 시작

프로젝트 루트에서 다국어 관리 스크립트를 사용하세요:

```bash
# 🎯 대화형 메뉴 실행 (추천)
./i18n.sh

# 📋 명령줄에서 직접 실행
./i18n.sh help              # 도움말 보기
./i18n.sh workflow          # 전체 워크플로우 실행
./i18n.sh scan              # 하드코딩 문자열 스캔
./i18n.sh upload            # 번역 테이블 업로드
./i18n.sh update            # ARB 파일 업데이트
./i18n.sh generate          # Flutter 코드 생성
```

대화형 메뉴에서는 다음과 같은 옵션들을 선택할 수 있습니다:

```
🎯 원하는 작업을 선택하세요:

  1) 📊 하드코딩된 문자열 스캔
  2) 📤 개선된 번역 테이블을 Google Sheets에 업로드
  3) 📤 기존 하드코딩 문자열을 Google Sheets에 업로드 (레거시)
  4) 📥 Google Sheets에서 번역을 가져와 ARB 파일 업데이트
  5) 👀 번역 업데이트 미리보기 (실제 변경 X)
  6) ⚡ Flutter 다국어 코드 생성
  7) 🔍 Google Sheets 구조 확인
  8) 🚀 전체 워크플로우 실행
  9) ❓ 도움말 보기
  0) 🚪 종료
```

### 📋 사용 가능한 명령어

| 명령어 | 설명 |
|-------|------|
| `scan` | 코드에서 하드코딩된 문자열 스캔 |
| `upload` | 개선된 번역 테이블을 Google Sheets에 업로드 |
| `upload-legacy` | 기존 하드코딩 문자열을 Google Sheets에 업로드 |
| `update` | Google Sheets에서 번역을 가져와 ARB 파일 업데이트 |
| `update --dry-run` | 번역 업데이트 미리보기 |
| `generate` | Flutter 다국어 코드 생성 |
| `check-sheets` | Google Sheets 구조 확인 |
| `workflow` | 전체 워크플로우 실행 |

### 🔧 필수 설정

1. **Google Cloud Console 설정**
   - Google Sheets API 활성화
   - 서비스 계정 생성 및 키 다운로드

2. **서비스 계정 키 배치**
   ```bash
   # 다운로드한 서비스 계정 키를 다음 위치에 저장
   scripts/service-account-key.json
   ```

3. **Google Sheets 권한 설정**
   - 서비스 계정 이메일에 스프레드시트 편집 권한 부여

### 📚 번역 관리 워크플로우

1. **번역 테이블 업로드**
   ```bash
   ./i18n.sh upload
   ```

2. **Google Sheets에서 번역 편집**
   - [RecipeLabo Translations](https://docs.google.com/spreadsheets/d/1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns) 에서 번역 수정

3. **ARB 파일 업데이트**
   ```bash
   ./i18n.sh update
   ```

4. **Flutter 코드 생성**
   ```bash
   ./i18n.sh generate
   ```

### 🆕 새로운 번역 키 추가

1. Google Sheets에 새로운 키와 번역 추가
2. ARB 파일 업데이트: `./i18n.sh update`
3. Flutter 코드 생성: `./i18n.sh generate`
4. 코드에서 사용:
   ```dart
   Text(AppLocalizations.of(context)!.yourNewKey)
   ```

### 🔍 하드코딩된 문자열 관리

```bash
# 하드코딩된 문자열 스캔
./i18n.sh scan

# 스캔 결과를 Google Sheets에 업로드
./i18n.sh upload
```

### ⚠️ 주의사항

- 모든 스크립트는 프로젝트 루트에서 실행해야 합니다
- 중요한 변경 전에는 git commit을 권장합니다
- `--dry-run` 옵션으로 변경사항을 미리 확인할 수 있습니다

## 📄 라이선스

이 프로젝트는 [MIT 라이선스](./LICENSE)를 따릅니다.