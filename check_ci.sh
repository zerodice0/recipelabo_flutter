#!/bin/bash

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔍 로컬 CI 체크 시작${NC}"
echo "======================================"

# 실패 카운터
failed_checks=0

# 1. .env 파일 생성 (테스트용)
echo -e "${YELLOW}📋 .env 파일 생성 중...${NC}"
if [ ! -f .env ]; then
    cat > .env << EOF
# Saucerer Flutter 프로젝트 환경변수
# 로컬 CI 체크용 임시 파일

# AdMob 광고 ID 설정 (테스트용)
SAUCERER_ANDROID_BANNER_AD_ID=ca-app-pub-3940256099942544/6300978111
SAUCERER_IOS_BANNER_AD_ID=ca-app-pub-3940256099942544/2934735716

# 테스트 광고 ID (Google에서 제공하는 공용 테스트 ID)
SAUCERER_TEST_ANDROID_BANNER_AD_ID=ca-app-pub-3940256099942544/6300978111
SAUCERER_TEST_IOS_BANNER_AD_ID=ca-app-pub-3940256099942544/2934735716

# Google Sheets API 설정 (번역 관리용)
SAUCERER_GOOGLE_SHEETS_API_KEY=test_key
EOF
    echo -e "${GREEN}✅ .env 파일 생성 완료${NC}"
else
    echo -e "${GREEN}✅ .env 파일이 이미 존재합니다${NC}"
fi

# 2. Flutter 버전 확인
echo -e "\n${YELLOW}🔧 Flutter 버전 확인 중...${NC}"
flutter_version=$(flutter --version | head -1 | cut -d' ' -f2)
echo "현재 Flutter 버전: $flutter_version"

# 3. 종속성 설치
echo -e "\n${YELLOW}📦 종속성 설치 중...${NC}"
if flutter pub get; then
    echo -e "${GREEN}✅ 종속성 설치 성공${NC}"
else
    echo -e "${RED}❌ 종속성 설치 실패${NC}"
    failed_checks=$((failed_checks + 1))
fi

# 4. 코드 분석
echo -e "\n${YELLOW}🔍 코드 분석 중...${NC}"
if flutter analyze; then
    echo -e "${GREEN}✅ 코드 분석 통과${NC}"
else
    echo -e "${RED}❌ 코드 분석 실패${NC}"
    failed_checks=$((failed_checks + 1))
fi

# 5. 테스트 실행
echo -e "\n${YELLOW}🧪 테스트 실행 중...${NC}"
if flutter test; then
    echo -e "${GREEN}✅ 테스트 통과${NC}"
else
    echo -e "${RED}❌ 테스트 실패${NC}"
    failed_checks=$((failed_checks + 1))
fi

# 결과 출력
echo -e "\n======================================"
if [ $failed_checks -eq 0 ]; then
    echo -e "${GREEN}🎉 모든 CI 체크 통과! 커밋해도 안전합니다.${NC}"
    exit 0
else
    echo -e "${RED}❌ $failed_checks 개의 체크가 실패했습니다. 문제를 해결한 후 다시 시도하세요.${NC}"
    exit 1
fi