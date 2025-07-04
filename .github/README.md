# GitHub Actions 설정 가이드

이 프로젝트는 GitHub Actions를 통해 CI/CD 파이프라인을 구성하고 있습니다. .env 파일을 사용하여 환경변수를 관리하며, GitHub Secrets를 통해 민감한 정보를 안전하게 저장합니다.

## 필요한 GitHub Secrets 설정

GitHub 저장소의 Settings > Secrets and variables > Actions에서 다음 환경변수들을 설정해야 합니다:

### 필수 Secrets

#### AdMob 광고 관련
```
SAUCERER_ANDROID_BANNER_AD_ID
값: 실제 Android 배너 광고 단위 ID (예: ca-app-pub-1234567890123456/1234567890)

SAUCERER_IOS_BANNER_AD_ID  
값: 실제 iOS 배너 광고 단위 ID (예: ca-app-pub-1234567890123456/0987654321)
```

#### Google Sheets 번역 관리 관련
```
SAUCERER_GOOGLE_SHEETS_API_KEY
값: Google Sheets API 키
```

### Secrets 설정 방법

1. **GitHub 저장소 페이지**에서 `Settings` 탭 클릭
2. 왼쪽 사이드바에서 `Secrets and variables` > `Actions` 클릭
3. `New repository secret` 버튼 클릭
4. 위의 Secret 이름과 값을 각각 추가

### Google Service Account JSON 설정 팁

Service Account JSON은 다음과 같은 형태입니다:
```json
{
  "type": "service_account",
  "project_id": "your-project-id",
  "private_key_id": "key-id",
  "private_key": "-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----\n",
  "client_email": "service-account@project.iam.gserviceaccount.com",
  "client_id": "123456789",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/service-account%40project.iam.gserviceaccount.com"
}
```

**중요**: JSON 전체를 하나의 문자열로 복사해서 붙여넣어야 합니다.

## 로컬 개발 환경 설정

로컬에서 개발할 때는 프로젝트 루트에 `.env` 파일을 생성하고 다음과 같이 설정하세요:

```bash
# .env 파일 생성
cp .env.example .env

# .env 파일을 편집하여 실제 값으로 변경
vi .env
```

`.env` 파일 예시:
```env
# Saucerer Flutter 프로젝트 환경변수
SAUCERER_ANDROID_BANNER_AD_ID=ca-app-pub-1234567890123456/1234567890
SAUCERER_IOS_BANNER_AD_ID=ca-app-pub-1234567890123456/0987654321
SAUCERER_TEST_ANDROID_BANNER_AD_ID=ca-app-pub-3940256099942544/6300978111
SAUCERER_TEST_IOS_BANNER_AD_ID=ca-app-pub-3940256099942544/2934735716
SAUCERER_GOOGLE_SHEETS_API_KEY=your_api_key_here
SAUCERER_GOOGLE_SERVICE_ACCOUNT_JSON={"type":"service_account",...}
```

## CI/CD 파이프라인

### 자동 실행 트리거

- **Pull Request**: `main` 브랜치로의 PR 생성 시 테스트 실행
- **Push**: `main`, `develop` 브랜치에 푸시 시 테스트 실행
- **번역 업데이트**: `main` 브랜치에 푸시 시 Google Sheets에서 번역 자동 업데이트

### 실행되는 작업

1. **테스트 작업** (모든 트리거에서 실행)
   - Flutter 환경 설정
   - .env 파일 생성 (GitHub Secrets 사용)
   - 의존성 설치
   - 코드 분석 (flutter analyze)
   - 테스트 실행 (flutter test)

2. **번역 업데이트 작업** (main 브랜치 푸시 시에만 실행)
   - Google Sheets에서 최신 번역 데이터 가져오기
   - ARB 파일 업데이트
   - 변경사항 자동 커밋

## 보안 고려사항

- `.env` 파일은 `.gitignore`에 포함되어 있어 Git에 커밋되지 않습니다
- GitHub Secrets는 암호화되어 저장되며 로그에 노출되지 않습니다
- 프로젝트별 접두사(`SAUCERER_`)를 사용하여 다른 프로젝트와의 환경변수 충돌을 방지합니다

## 문제해결

### GitHub Actions 실행 실패 시

1. **Secrets 확인**: 모든 필수 Secrets가 올바르게 설정되었는지 확인
2. **JSON 형식 확인**: Service Account JSON이 올바른 형식인지 확인
3. **권한 확인**: Service Account가 Google Sheets에 접근할 수 있는 권한이 있는지 확인
4. **API 활성화**: Google Cloud Console에서 Sheets API가 활성화되어 있는지 확인

### 로컬 개발 시 문제

1. **.env 파일 확인**: .env 파일이 프로젝트 루트에 있고 올바른 형식인지 확인
2. **권한 확인**: 로컬에서 Google Sheets API에 접근할 수 있는지 확인
3. **의존성 업데이트**: `flutter pub get` 실행

더 자세한 정보는 프로젝트의 메인 README.md 파일을 참조하세요.