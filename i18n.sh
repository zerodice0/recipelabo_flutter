#!/bin/bash

# Saucerer 다국어 관리 스크립트
# 프로젝트 루트에서 실행해야 합니다.

set -e  # 오류 발생 시 스크립트 중단

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 헬퍼 함수들
print_header() {
    echo -e "${CYAN}================================================${NC}"
    echo -e "${CYAN}🌍 Saucerer 다국어 관리 도구${NC}"
    echo -e "${CYAN}================================================${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_step() {
    echo -e "${PURPLE}🔄 $1${NC}"
}

# 현재 디렉토리가 프로젝트 루트인지 확인
check_project_root() {
    if [[ ! -f "pubspec.yaml" || ! -d "scripts" ]]; then
        print_error "이 스크립트는 프로젝트 루트 디렉토리에서 실행해야 합니다."
        print_info "현재 위치: $(pwd)"
        print_info "pubspec.yaml 파일과 scripts 디렉토리가 있는 곳에서 실행하세요."
        exit 1
    fi
}

# 필수 파일 존재 확인
check_required_files() {
    local missing_files=()
    
    if [[ ! -f "scripts/service-account-key.json" ]]; then
        missing_files+=("scripts/service-account-key.json")
    fi
    
    if [[ ${#missing_files[@]} -gt 0 ]]; then
        print_warning "다음 파일들이 누락되었습니다:"
        for file in "${missing_files[@]}"; do
            echo -e "  ${RED}- $file${NC}"
        done
        echo ""
        print_info "Google Cloud Console에서 서비스 계정 키를 다운로드하여"
        print_info "scripts/service-account-key.json으로 저장하세요."
        echo ""
        print_info "일부 기능이 제한될 수 있습니다."
        echo ""
    fi
}

# Dart dependencies 확인
check_dart_dependencies() {
    print_step "Dart dependencies 확인 중..."
    if ! flutter pub get > /dev/null 2>&1; then
        print_error "Flutter pub get 실패. dependencies를 확인하세요."
        exit 1
    fi
    print_success "Dependencies 확인 완료"
}

# 하드코딩된 문자열 스캔
scan_hardcoded_strings() {
    print_step "하드코딩된 문자열을 스캔합니다..."
    dart scripts/scan_hardcoded_strings.dart
}

# 개선된 번역 테이블을 Google Sheets에 업로드
upload_improved_translations() {
    print_step "개선된 번역 테이블을 Google Sheets에 업로드합니다..."
    dart scripts/upload_improved_translations.dart
}

# 기존 하드코딩 문자열을 Google Sheets에 업로드 (레거시)
upload_legacy_translations() {
    print_step "기존 하드코딩 문자열을 Google Sheets에 업로드합니다..."
    dart scripts/upload_to_sheets.dart
}

# Google Sheets에서 번역 데이터를 가져와 ARB 파일 업데이트
update_translations() {
    local dry_run=""
    if [[ "$1" == "--dry-run" ]]; then
        dry_run="--dry-run"
        print_step "번역 업데이트 미리보기를 실행합니다..."
    else
        print_step "Google Sheets에서 번역을 가져와 ARB 파일을 업데이트합니다..."
    fi
    
    dart scripts/update_translations.dart $dry_run
}

# Flutter 다국어 코드 생성
generate_l10n() {
    print_step "Flutter 다국어 코드를 생성합니다..."
    flutter gen-l10n
    if [[ $? -eq 0 ]]; then
        print_success "Flutter 다국어 코드 생성 완료"
    else
        print_error "Flutter 다국어 코드 생성 실패"
        exit 1
    fi
}

# Google Sheets 구조 확인
check_sheets_structure() {
    print_step "Google Sheets 구조를 확인합니다..."
    dart scripts/check_sheets_structure.dart
}

# 전체 워크플로우 실행
run_full_workflow() {
    print_header
    print_info "전체 다국어 워크플로우를 실행합니다."
    echo ""
    
    # 1. 하드코딩 문자열 스캔
    echo -e "${YELLOW}1/4: 하드코딩 문자열 스캔${NC}"
    scan_hardcoded_strings
    echo ""
    
    # 2. 개선된 번역 업로드
    echo -e "${YELLOW}2/4: 개선된 번역 테이블 업로드${NC}"
    upload_improved_translations
    echo ""
    
    # 3. 번역 업데이트
    echo -e "${YELLOW}3/4: ARB 파일 업데이트${NC}"
    update_translations
    echo ""
    
    # 4. Flutter 코드 생성
    echo -e "${YELLOW}4/4: Flutter 다국어 코드 생성${NC}"
    generate_l10n
    echo ""
    
    print_success "전체 워크플로우 완료!"
    print_info "이제 앱에서 새로운 번역을 사용할 수 있습니다."
}

# 대화형 메뉴 표시
show_interactive_menu() {
    while true; do
        print_header
        echo ""
        echo -e "${YELLOW}🎯 원하는 작업을 선택하세요:${NC}"
        echo ""
        echo -e "  ${GREEN}1)${NC} 📊 하드코딩된 문자열 스캔"
        echo -e "  ${GREEN}2)${NC} 📤 개선된 번역 테이블을 Google Sheets에 업로드"
        echo -e "  ${GREEN}3)${NC} 📤 기존 하드코딩 문자열을 Google Sheets에 업로드 (레거시)"
        echo -e "  ${GREEN}4)${NC} 📥 Google Sheets에서 번역을 가져와 ARB 파일 업데이트"
        echo -e "  ${GREEN}5)${NC} 👀 번역 업데이트 미리보기 (실제 변경 X)"
        echo -e "  ${GREEN}6)${NC} ⚡ Flutter 다국어 코드 생성"
        echo -e "  ${GREEN}7)${NC} 🔍 Google Sheets 구조 확인"
        echo -e "  ${GREEN}8)${NC} 🚀 전체 워크플로우 실행 (scan → upload → update → generate)"
        echo ""
        echo -e "  ${GREEN}9)${NC} ❓ 도움말 보기"
        echo -e "  ${GREEN}0)${NC} 🚪 종료"
        echo ""
        echo -ne "${CYAN}선택 (0-9): ${NC}"
        
        read -r choice
        echo ""
        
        case "$choice" in
            1)
                print_step "하드코딩된 문자열 스캔을 시작합니다..."
                scan_hardcoded_strings
                press_enter_to_continue
                ;;
            2)
                print_step "개선된 번역 테이블을 Google Sheets에 업로드합니다..."
                upload_improved_translations
                press_enter_to_continue
                ;;
            3)
                print_step "기존 하드코딩 문자열을 Google Sheets에 업로드합니다..."
                upload_legacy_translations
                press_enter_to_continue
                ;;
            4)
                print_step "Google Sheets에서 번역을 가져와 ARB 파일을 업데이트합니다..."
                update_translations
                press_enter_to_continue
                ;;
            5)
                print_step "번역 업데이트 미리보기를 실행합니다..."
                update_translations "--dry-run"
                press_enter_to_continue
                ;;
            6)
                print_step "Flutter 다국어 코드를 생성합니다..."
                generate_l10n
                press_enter_to_continue
                ;;
            7)
                print_step "Google Sheets 구조를 확인합니다..."
                check_sheets_structure
                press_enter_to_continue
                ;;
            8)
                print_step "전체 워크플로우를 실행합니다..."
                echo ""
                confirm_workflow_execution
                ;;
            9)
                show_help
                press_enter_to_continue
                ;;
            0)
                print_success "다국어 관리 도구를 종료합니다. 안녕히 가세요! 👋"
                exit 0
                ;;
            *)
                print_error "잘못된 선택입니다. 0-9 사이의 숫자를 입력하세요."
                sleep 2
                ;;
        esac
    done
}

# 워크플로우 실행 확인
confirm_workflow_execution() {
    print_warning "전체 워크플로우는 다음 작업들을 순차적으로 실행합니다:"
    echo ""
    echo -e "  ${BLUE}1. 하드코딩된 문자열 스캔${NC}"
    echo -e "  ${BLUE}2. 개선된 번역 테이블을 Google Sheets에 업로드${NC}"
    echo -e "  ${BLUE}3. Google Sheets에서 ARB 파일 업데이트${NC}"
    echo -e "  ${BLUE}4. Flutter 다국어 코드 생성${NC}"
    echo ""
    echo -ne "${YELLOW}계속 진행하시겠습니까? (y/N): ${NC}"
    
    read -r confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        echo ""
        run_full_workflow
        press_enter_to_continue
    else
        print_info "워크플로우 실행이 취소되었습니다."
        sleep 1
    fi
}

# 계속하려면 엔터 키 입력 대기
press_enter_to_continue() {
    echo ""
    echo -ne "${CYAN}계속하려면 엔터 키를 누르세요...${NC}"
    read -r
}

# 도움말 출력
show_help() {
    clear
    print_header
    echo ""
    echo -e "${YELLOW}📖 Saucerer 다국어 관리 도구 도움말${NC}"
    echo ""
    echo -e "${YELLOW}명령줄 사용법:${NC}"
    echo "  ./i18n.sh [명령어] [옵션]"
    echo ""
    echo -e "${YELLOW}사용 가능한 명령어:${NC}"
    echo -e "  ${GREEN}scan${NC}                    하드코딩된 문자열 스캔"
    echo -e "  ${GREEN}upload${NC}                  개선된 번역 테이블을 Google Sheets에 업로드"
    echo -e "  ${GREEN}upload-legacy${NC}           기존 하드코딩 문자열을 Google Sheets에 업로드"
    echo -e "  ${GREEN}update${NC}                  Google Sheets에서 번역을 가져와 ARB 파일 업데이트"
    echo -e "  ${GREEN}update --dry-run${NC}        번역 업데이트 미리보기"
    echo -e "  ${GREEN}generate${NC}                Flutter 다국어 코드 생성"
    echo -e "  ${GREEN}check-sheets${NC}            Google Sheets 구조 확인"
    echo -e "  ${GREEN}workflow${NC}                전체 워크플로우 실행"
    echo -e "  ${GREEN}interactive${NC}             대화형 메뉴 모드 (기본값)"
    echo -e "  ${GREEN}help${NC}                    도움말 출력"
    echo ""
    echo -e "${YELLOW}예시:${NC}"
    echo "  ./i18n.sh                   # 대화형 메뉴 실행"
    echo "  ./i18n.sh interactive       # 대화형 메뉴 실행"
    echo "  ./i18n.sh scan              # 하드코딩 문자열 스캔"
    echo "  ./i18n.sh upload            # 번역 테이블 업로드"
    echo "  ./i18n.sh update            # ARB 파일 업데이트"
    echo "  ./i18n.sh update --dry-run  # 업데이트 미리보기"
    echo "  ./i18n.sh workflow          # 전체 프로세스 실행"
    echo ""
    echo -e "${YELLOW}📋 워크플로우 설명:${NC}"
    echo ""
    echo -e "${BLUE}1. 스캔 (scan)${NC}"
    echo "   - 코드에서 하드코딩된 한국어 문자열을 찾아 리포트 생성"
    echo "   - 번역이 필요한 문자열들을 식별"
    echo ""
    echo -e "${BLUE}2. 업로드 (upload)${NC}"
    echo "   - 개선된 187개 번역 항목을 Google Sheets에 업로드"
    echo "   - 의미있는 키명과 완전한 3개국어 번역 포함"
    echo ""
    echo -e "${BLUE}3. 업데이트 (update)${NC}"
    echo "   - Google Sheets의 번역 데이터를 ARB 파일로 동기화"
    echo "   - lib/l10n/app_*.arb 파일들 자동 생성"
    echo ""
    echo -e "${BLUE}4. 생성 (generate)${NC}"
    echo "   - ARB 파일을 기반으로 Flutter 다국어 코드 생성"
    echo "   - AppLocalizations 클래스 업데이트"
    echo ""
    echo -e "${YELLOW}🔧 필수 설정:${NC}"
    echo "  - scripts/service-account-key.json 파일 필요"
    echo "  - Google Sheets API 권한 설정 필요"
    echo "  - 서비스 계정에 스프레드시트 편집 권한 부여"
    echo ""
    echo -e "${YELLOW}⚠️  주의사항:${NC}"
    echo "  - 이 스크립트는 프로젝트 루트에서 실행해야 합니다"
    echo "  - 실행 전에 git commit을 권장합니다"
    echo "  - --dry-run 옵션으로 변경사항을 미리 확인하세요"
    echo ""
    echo -e "${YELLOW}🔗 관련 링크:${NC}"
    echo "  - Google Sheets: https://docs.google.com/spreadsheets/d/1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns"
    echo "  - 프로젝트 문서: README.md"
    echo ""
}

# 메인 스크립트 로직
main() {
    # 프로젝트 루트 확인
    check_project_root
    
    # 필수 파일 확인
    check_required_files
    
    # Dart dependencies 확인
    check_dart_dependencies
    
    # 명령어가 없으면 대화형 메뉴 실행
    if [[ $# -eq 0 ]]; then
        show_interactive_menu
        exit 0
    fi
    
    # 명령어 처리
    case "$1" in
        "scan")
            print_header
            scan_hardcoded_strings
            ;;
        "upload")
            print_header
            upload_improved_translations
            ;;
        "upload-legacy")
            print_header
            upload_legacy_translations
            ;;
        "update")
            print_header
            update_translations "$2"
            ;;
        "generate")
            print_header
            generate_l10n
            ;;
        "check-sheets")
            print_header
            check_sheets_structure
            ;;
        "workflow")
            run_full_workflow
            ;;
        "interactive"|"menu")
            show_interactive_menu
            ;;
        "help"|"-h"|"--help")
            show_help
            ;;
        *)
            print_error "알 수 없는 명령어: $1"
            echo ""
            echo -e "${YELLOW}💡 대화형 메뉴를 사용하려면:${NC} ./i18n.sh"
            echo -e "${YELLOW}💡 도움말을 보려면:${NC} ./i18n.sh help"
            echo ""
            exit 1
            ;;
    esac
}

# 스크립트 실행
main "$@"