import 'dart:io';
import 'package:csv/csv.dart';

/// 하드코딩된 문자열을 CSV 파일로 생성하여 Google Sheets에 쉽게 복사-붙여넣기할 수 있도록 하는 스크립트
/// 
/// 사용법: dart scripts/generate_csv_for_sheets.dart

class CsvGenerator {
  /// 하드코딩된 문자열 데이터 로드
  Map<String, Map<String, String>> loadTranslationData() {
    return {
      // 메인 네비게이션
      'recipes': {
        'korean': '레시피',
        'english': 'Recipes',
        'japanese': 'レシピ',
        'description': '레시피 탭 제목'
      },
      'search': {
        'korean': '검색',
        'english': 'Search', 
        'japanese': '検索',
        'description': '검색 탭 제목'
      },
      'timer': {
        'korean': '타이머',
        'english': 'Timer',
        'japanese': 'タイマー',
        'description': '타이머 탭 제목'
      },
      'settings': {
        'korean': '설정',
        'english': 'Settings',
        'japanese': '設定',
        'description': '설정 탭 제목'
      },
      
      // 레시피 관련
      'addRecipe': {
        'korean': '레시피 추가',
        'english': 'Add Recipe',
        'japanese': 'レシピ追加',
        'description': '레시피 추가 버튼'
      },
      'editRecipe': {
        'korean': '레시피 편집',
        'english': 'Edit Recipe',
        'japanese': 'レシピ編集',
        'description': '레시피 편집 화면 제목'
      },
      'recipeDetail': {
        'korean': '레시피 상세',
        'english': 'Recipe Detail',
        'japanese': 'レシピ詳細',
        'description': '레시피 상세 화면 제목'
      },
      'recipeList': {
        'korean': '나의 레시피',
        'english': 'My Recipes',
        'japanese': '私のレシピ',
        'description': '레시피 목록 화면 제목'
      },
      'noRecipesYet': {
        'korean': '아직 레시피가 없습니다',
        'english': 'No recipes yet',
        'japanese': 'まだレシピがありません',
        'description': '레시피가 없을 때 표시되는 메시지'
      },
      'createSpecialRecipe': {
        'korean': '나만의 특별한 소스 레시피를\\n만들어보세요!',
        'english': 'Create your own special\\nsauce recipe!',
        'japanese': 'あなただけの特別な\\nソースレシピを作ってみましょう！',
        'description': '첫 레시피 생성 유도 메시지'
      },
      'searchIngredients': {
        'korean': '재료 검색',
        'english': 'Search Ingredients',
        'japanese': '材料検索',
        'description': '재료로 검색 버튼'
      },
      'recipeDeleted': {
        'korean': '레시피가 삭제되었습니다',
        'english': 'Recipe has been deleted',
        'japanese': 'レシピが削除されました',
        'description': '레시피 삭제 완료 메시지'
      },
      'confirmDeleteRecipe': {
        'korean': '레시피를 삭제하시겠습니까?\\n\\n이 작업은 되돌릴 수 없습니다.',
        'english': 'Are you sure you want to delete this recipe?\\n\\nThis action cannot be undone.',
        'japanese': 'このレシピを削除しますか？\\n\\nこの操作は元に戻せません。',
        'description': '레시피 삭제 확인 다이얼로그'
      },
      'deleteFailed': {
        'korean': '삭제 실패',
        'english': 'Delete failed',
        'japanese': '削除失敗',
        'description': '삭제 실패 오류 메시지'
      },
      
      // 일반 UI
      'save': {
        'korean': '저장',
        'english': 'Save',
        'japanese': '保存',
        'description': '저장 버튼'
      },
      'cancel': {
        'korean': '취소',
        'english': 'Cancel',
        'japanese': 'キャンセル',
        'description': '취소 버튼'
      },
      'delete': {
        'korean': '삭제',
        'english': 'Delete',
        'japanese': '削除',
        'description': '삭제 버튼'
      },
      'edit': {
        'korean': '편집',
        'english': 'Edit',
        'japanese': '編集',
        'description': '편집 버튼'
      },
      'confirm': {
        'korean': '확인',
        'english': 'Confirm',
        'japanese': '確認',
        'description': '확인 버튼'
      },
      'errorOccurred': {
        'korean': '오류가 발생했습니다',
        'english': 'An error occurred',
        'japanese': 'エラーが発生しました',
        'description': '일반적인 오류 메시지'
      },
      'selectUnit': {
        'korean': '단위 선택',
        'english': 'Select Unit',
        'japanese': '単位選択',
        'description': '단위 선택 다이얼로그 제목'
      },
      
      // 설정 화면
      'management': {
        'korean': '관리',
        'english': 'Management',
        'japanese': '管理',
        'description': '관리 섹션 제목'
      },
      'seasoningUnitManagement': {
        'korean': '조미료/단위 관리',
        'english': 'Seasoning/Unit Management',
        'japanese': '調味料/単位管理',
        'description': '조미료/단위 관리 메뉴'
      },
      'seasoningUnitDescription': {
        'korean': '조미료/단위 추가, 수정, 삭제',
        'english': 'Add, edit, delete seasonings/units',
        'japanese': '調味料/単位の追加、編集、削除',
        'description': '조미료/단위 관리 설명'
      },
      'appInfo': {
        'korean': '앱 정보',
        'english': 'App Info',
        'japanese': 'アプリ情報',
        'description': '앱 정보 섹션 제목'
      },
      'version': {
        'korean': '버전',
        'english': 'Version',
        'japanese': 'バージョン',
        'description': '버전 메뉴 항목'
      },
      'license': {
        'korean': '라이선스',
        'english': 'License',
        'japanese': 'ライセンス',
        'description': '라이선스 메뉴 항목'
      },
      
      // 단위 관련
      'unitTypeSelection': {
        'korean': '"{unitName}" 단위가 어떤 종류인지 선택해주세요.',
        'english': 'Please select what type of unit "{unitName}" is.',
        'japanese': '"{unitName}" 単位の種類を選択してください。',
        'description': '단위 타입 선택 다이얼로그 (파라미터: unitName)'
      },
      'frequently_used_units': {
        'korean': '자주 사용하는 단위',
        'english': 'Frequently Used Units',
        'japanese': 'よく使う単位',
        'description': '자주 사용하는 단위 섹션'
      },
      'weight_basic': {
        'korean': '무게 (기본)',
        'english': 'Weight (Basic)',
        'japanese': '重量（基本）',
        'description': '기본 무게 단위 섹션'
      },
      'volume_basic': {
        'korean': '부피 (기본)',
        'english': 'Volume (Basic)',
        'japanese': '容量（基本）',
        'description': '기본 부피 단위 섹션'
      },
      'count_basic': {
        'korean': '개수 (기본)',
        'english': 'Count (Basic)',
        'japanese': '個数（基본）',
        'description': '기본 개수 단위 섹션'
      },
      'misc_basic': {
        'korean': '기타 (기본)',
        'english': 'Misc (Basic)',
        'japanese': 'その他（基本）',
        'description': '기본 기타 단위 섹션'
      },
      
      // 재료 관련
      'ingredients': {
        'korean': '재료',
        'english': 'Ingredients',
        'japanese': '材料',
        'description': '재료 섹션 제목'
      },
      'steps': {
        'korean': '조리 과정',
        'english': 'Steps',
        'japanese': '調理手順',
        'description': '조리 과정 섹션 제목'
      },
      'unit': {
        'korean': '단위',
        'english': 'Unit',
        'japanese': '単位',
        'description': '단위 입력 라벨'
      },
      'quantity': {
        'korean': '수량',
        'english': 'Quantity',
        'japanese': '数量',
        'description': '수량 입력 라벨'
      },
      'name': {
        'korean': '이름',
        'english': 'Name',
        'japanese': '名前',
        'description': '이름 입력 라벨'
      },
      'description': {
        'korean': '설명',
        'english': 'Description',
        'japanese': '説明',
        'description': '설명 입력 라벨'
      },
    };
  }

  /// CSV 파일 생성
  Future<void> generateCsv() async {
    final translations = loadTranslationData();
    
    print('📄 번역 데이터를 CSV 파일로 생성합니다...');
    print('총 ${translations.length}개의 번역 키');
    
    // CSV 데이터 준비
    final csvData = <List<dynamic>>[
      ['Key', 'Korean', 'English', 'Japanese', 'Description'] // 헤더
    ];
    
    // 데이터 추가
    translations.forEach((key, data) {
      csvData.add([
        key,
        data['korean'] ?? '',
        data['english'] ?? '',
        data['japanese'] ?? '',
        data['description'] ?? ''
      ]);
    });
    
    // CSV 문자열 생성
    final csvString = const ListToCsvConverter().convert(csvData);
    
    // 파일 저장
    final outputFile = File('translations_output.csv');
    await outputFile.writeAsString(csvString);
    
    print('✅ CSV 파일이 생성되었습니다: ${outputFile.absolute.path}');
    print('');
    print('🔄 Google Sheets에 업로드하는 방법:');
    print('1. 생성된 translations_output.csv 파일 열기');
    print('2. 모든 내용 복사 (Ctrl+A → Ctrl+C)');
    print('3. Google Sheets 열기: https://docs.google.com/spreadsheets/d/1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns/edit');
    print('4. A1 셀 선택 후 붙여넣기 (Ctrl+V)');
    print('5. 데이터 확인 후 저장');
    print('');
    print('📋 또는 클립보드에 복사된 텍스트를 직접 사용:');
    print('─' * 50);
    
    // 클립보드용 탭 구분 텍스트 생성
    final clipboardText = csvData.map((row) => row.join('\t')).join('\n');
    
    // 클립보드용 파일 생성
    final clipboardFile = File('translations_clipboard.txt');
    await clipboardFile.writeAsString(clipboardText);
    
    print('📋 클립보드용 파일도 생성되었습니다: ${clipboardFile.absolute.path}');
    print('이 파일의 내용을 복사하여 Google Sheets에 직접 붙여넣을 수 있습니다.');
  }
}

Future<void> main() async {
  try {
    final generator = CsvGenerator();
    await generator.generateCsv();
  } catch (e) {
    print('❌ 오류 발생: $e');
    exit(1);
  }
}