import 'dart:convert';
import 'dart:io';

/// 개선된 다국어 번역 테이블
/// 
/// 기존의 의미 없는 키들을 영어 기반의 시맨틱한 키로 재작성하고
/// 모든 번역을 완성했습니다.
class ImprovedTranslations {
  static const Map<String, Map<String, String>> translations = {
    // === 네비게이션 관련 ===
    'navigationRecipes': {
      'ko': '레시피',
      'en': 'Recipes',
      'ja': 'レシピ',
      'description': '메인 네비게이션: 레시피 탭'
    },
    'navigationSearch': {
      'ko': '검색',
      'en': 'Search',
      'ja': '検索',
      'description': '메인 네비게이션: 검색 탭'
    },
    'navigationTimer': {
      'ko': '타이머',
      'en': 'Timer',
      'ja': 'タイマー',
      'description': '메인 네비게이션: 타이머 탭'
    },
    'navigationSettings': {
      'ko': '설정',
      'en': 'Settings',
      'ja': '設定',
      'description': '메인 네비게이션: 설정 탭'
    },

    // === 공통 버튼/액션 ===
    'actionSave': {
      'ko': '저장',
      'en': 'Save',
      'ja': '保存',
      'description': '저장 버튼'
    },
    'actionCancel': {
      'ko': '취소',
      'en': 'Cancel',
      'ja': 'キャンセル',
      'description': '취소 버튼'
    },
    'actionDelete': {
      'ko': '삭제',
      'en': 'Delete',
      'ja': '削除',
      'description': '삭제 버튼'
    },
    'actionEdit': {
      'ko': '편집',
      'en': 'Edit',
      'ja': '編集',
      'description': '편집 버튼'
    },
    'actionConfirm': {
      'ko': '확인',
      'en': 'Confirm',
      'ja': '確認',
      'description': '확인 버튼'
    },
    'actionStart': {
      'ko': '시작',
      'en': 'Start',
      'ja': '開始',
      'description': '시작 버튼'
    },
    'actionRetry': {
      'ko': '다시 시도',
      'en': 'Retry',
      'ja': '再試行',
      'description': '다시 시도 버튼'
    },
    'actionGoBack': {
      'ko': '돌아가기',
      'en': 'Go Back',
      'ja': '戻る',
      'description': '뒤로가기 버튼'
    },
    'actionRefresh': {
      'ko': '새로고침',
      'en': 'Refresh',
      'ja': '更新',
      'description': '새로고침 버튼'
    },

    // === 레시피 관련 ===
    'recipeAdd': {
      'ko': '레시피 추가',
      'en': 'Add Recipe',
      'ja': 'レシピ追加',
      'description': '레시피 추가 버튼/화면 제목'
    },
    'recipeEdit': {
      'ko': '레시피 편집',
      'en': 'Edit Recipe',
      'ja': 'レシピ編集',
      'description': '레시피 편집 화면 제목'
    },
    'recipeDetail': {
      'ko': '레시피 상세',
      'en': 'Recipe Detail',
      'ja': 'レシピ詳細',
      'description': '레시피 상세 화면 제목'
    },
    'recipeName': {
      'ko': '레시피 이름',
      'en': 'Recipe Name',
      'ja': 'レシピ名',
      'description': '레시피 이름 입력 라벨'
    },
    'recipeIngredients': {
      'ko': '재료',
      'en': 'Ingredients',
      'ja': '材料',
      'description': '재료 섹션 제목'
    },
    'recipeCookingSteps': {
      'ko': '조리 과정',
      'en': 'Cooking Steps',
      'ja': '調理手順',
      'description': '조리 단계 섹션 제목'
    },
    'recipeEmptyState': {
      'ko': '아직 레시피가 없습니다',
      'en': 'No recipes yet',
      'ja': 'まだレシピがありません',
      'description': '레시피 목록 비어있을 때 메시지'
    },
    'recipeEmptyStateDescription': {
      'ko': '나만의 특별한 소스 레시피를\n만들어보세요!',
      'en': 'Create your own special\nsauce recipe!',
      'ja': 'あなただけの特別な\nソースレシピを作ってみましょう！',
      'description': '레시피 목록 비어있을 때 안내 메시지'
    },
    'recipeDeleteConfirm': {
      'ko': '레시피를 삭제하시겠습니까?\n\n이 작업은 되돌릴 수 없습니다.',
      'en': 'Are you sure you want to delete this recipe?\n\nThis action cannot be undone.',
      'ja': 'このレシピを削除しますか？\n\nこの操作は元に戻せません。',
      'description': '레시피 삭제 확인 메시지'
    },
    'recipeDeleteSuccess': {
      'ko': '레시피가 삭제되었습니다',
      'en': 'Recipe has been deleted',
      'ja': 'レシピが削除されました',
      'description': '레시피 삭제 성공 메시지'
    },
    'recipeDeleteFailed': {
      'ko': '삭제 실패',
      'en': 'Delete failed',
      'ja': '削除失敗',
      'description': '레시피 삭제 실패 메시지'
    },
    'recipeLoadingError': {
      'ko': '레시피를 불러올 수 없습니다',
      'en': 'Cannot load recipe',
      'ja': 'レシピを読み込めません',
      'description': '레시피 로딩 실패 메시지'
    },
    'recipeLoading': {
      'ko': '레시피를 불러오는 중...',
      'en': 'Loading recipe...',
      'ja': 'レシピを読み込み中...',
      'description': '레시피 로딩 중 메시지'
    },
    'recipeNewTitle': {
      'ko': '새 레시피',
      'en': 'New Recipe',
      'ja': '新しいレシピ',
      'description': '새 레시피 화면 제목'
    },
    'recipeVersionsRequired': {
      'ko': '레시피에는 최소 하나의 버전이 있어야 합니다.',
      'en': 'Recipe must have at least one version.',
      'ja': 'レシピには少なくとも1つのバージョンが必要です。',
      'description': '레시피 버전 필수 요구사항 메시지'
    },
    'recipeList': {
      'ko': '레시피 목록',
      'en': 'Recipe List',
      'ja': 'レシピ一覧',
      'description': '레시피 목록 화면'
    },

    // === 버전 관리 ===
    'versionCreate': {
      'ko': '새 버전 생성',
      'en': 'Create New Version',
      'ja': '新しいバージョンを作成',
      'description': '새 버전 생성 옵션'
    },
    'versionOverwrite': {
      'ko': '기존 버전 덮어쓰기',
      'en': 'Overwrite Existing Version',
      'ja': '既存のバージョンを上書き',
      'description': '기존 버전 덮어쓰기 옵션'
    },
    'versionName': {
      'ko': '버전 이름',
      'en': 'Version Name',
      'ja': 'バージョン名',
      'description': '버전명 입력 라벨'
    },
    'versionNameOptional': {
      'ko': '버전명 (선택사항)',
      'en': 'Version Name (Optional)',
      'ja': 'バージョン名 (任意)',
      'description': '버전명 입력 라벨 (선택사항)'
    },
    'versionNameHint': {
      'ko': '예: 매운맛, 설탕 덜 넣은, 비건',
      'en': 'e.g., Spicy, Less Sugar, Vegan',
      'ja': '例: 辛口、砂糖控えめ、ビーガン',
      'description': '버전명 입력 힌트'
    },
    'versionChangeLog': {
      'ko': '변경 사항',
      'en': 'Change Log',
      'ja': '変更履歴',
      'description': '변경사항 섹션 제목'
    },
    'versionChangeLogOptional': {
      'ko': '변경사항 (선택사항)',
      'en': 'Change Log (Optional)',
      'ja': '変更履歴 (任意)',
      'description': '변경사항 입력 라벨 (선택사항)'
    },
    'versionChangeLogHint': {
      'ko': '예: 설탕량 줄임, 야채 추가',
      'en': 'e.g., Reduced sugar, Added vegetables',
      'ja': '例: 砂糖の量を減らした、野菜を追加した',
      'description': '변경사항 입력 힌트'
    },
    'versionDelete': {
      'ko': '버전 삭제',
      'en': 'Delete Version',
      'ja': 'バージョンを削除',
      'description': '버전 삭제 버튼'
    },
    'versionDeleteConfirm': {
      'ko': '정말로 이 버전을 삭제하시겠습니까?',
      'en': 'Are you sure you want to delete this version?',
      'ja': '本当にこのバージョンを削除しますか？',
      'description': '버전 삭제 확인 메시지'
    },
    'versionDeleteError': {
      'ko': '버전 삭제 중 오류가 발생했습니다: {error}',
      'en': 'Error occurred while deleting version: {error}',
      'ja': 'バージョン削除中にエラーが発生しました: {error}',
      'description': '버전 삭제 오류 메시지'
    },
    'versionSaveAsDerived': {
      'ko': '새 버전으로 저장',
      'en': 'Save as New Version',
      'ja': '新しいバージョンとして保存',
      'description': '새 버전으로 저장 옵션'
    },
    'versionDerivedDescription': {
      'ko': '{versionName}에서 파생된 새 버전을 생성합니다',
      'en': 'Create a new version derived from {versionName}',
      'ja': '{versionName}から派生した新しいバージョンを作成します',
      'description': '파생 버전 생성 설명'
    },
    'versionKeepExisting': {
      'ko': '기존 버전은 유지하고 새 버전을 생성합니다',
      'en': 'Keep the existing version and create a new version',
      'ja': '既存のバージョンを保持し、新しいバージョンを作成します',
      'description': '기존 버전 유지 설명'
    },
    'versionUpdateDescription': {
      'ko': '{versionName}을(를) 업데이트합니다',
      'en': 'Update {versionName}',
      'ja': '{versionName}を更新します',
      'description': '버전 업데이트 설명'
    },
    'versionUpdateCurrent': {
      'ko': '현재 버전을 업데이트합니다',
      'en': 'Update the current version',
      'ja': '現在のバージョンを更新します',
      'description': '현재 버전 업데이트 설명'
    },
    'versionBaseVersion': {
      'ko': '기반 버전: {versionName}',
      'en': 'Base version: {versionName}',
      'ja': 'ベースバージョン: {versionName}',
      'description': '기반 버전 표시'
    },
    'versionEditingCurrent': {
      'ko': '편집 중: {versionName}',
      'en': 'Editing: {versionName}',
      'ja': '編集中: {versionName}',
      'description': '현재 편집 중인 버전 표시'
    },

    // === 재료 관리 ===
    'ingredientAdd': {
      'ko': '재료 추가',
      'en': 'Add Ingredient',
      'ja': '材料を追加',
      'description': '재료 추가 버튼'
    },
    'ingredientName': {
      'ko': '재료명',
      'en': 'Ingredient Name',
      'ja': '材料名',
      'description': '재료 이름 입력 라벨'
    },
    'ingredientQuantity': {
      'ko': '수량',
      'en': 'Quantity',
      'ja': '数量',
      'description': '수량 입력 라벨'
    },
    'ingredientUnit': {
      'ko': '단위',
      'en': 'Unit',
      'ja': '単位',
      'description': '단위 선택 라벨'
    },
    'ingredientSelectUnit': {
      'ko': '단위 선택',
      'en': 'Select Unit',
      'ja': '単位を選択',
      'description': '단위 선택 버튼'
    },
    'ingredientSearch': {
      'ko': '재료 검색',
      'en': 'Search Ingredients',
      'ja': '材料を検索',
      'description': '재료 검색 화면 제목'
    },
    'ingredientSearchHint': {
      'ko': '재료 이름을 검색하세요...',
      'en': 'Search ingredient names...',
      'ja': '材料名を検索してください...',
      'description': '재료 검색 입력 힌트'
    },
    'ingredientSearchByIngredients': {
      'ko': '재료로 검색',
      'en': 'Search by Ingredients',
      'ja': '材料で検索',
      'description': '재료 기반 검색 기능'
    },
    'ingredientPopular': {
      'ko': '자주 사용된 재료',
      'en': 'Popular Ingredients',
      'ja': 'よく使われる材料',
      'description': '인기 재료 섹션'
    },
    'ingredientShowPopular': {
      'ko': '자주 사용된 재료 보기',
      'en': 'Show Popular Ingredients',
      'ja': 'よく使われる材料を表示',
      'description': '인기 재료 보기 버튼'
    },
    'ingredientShowAll': {
      'ko': '모든 재료 보기',
      'en': 'Show All Ingredients',
      'ja': 'すべての材料を表示',
      'description': '모든 재료 보기 버튼'
    },
    'ingredientSearchResults': {
      'ko': '재료 검색 결과',
      'en': 'Ingredient Search Results',
      'ja': '材料検索結果',
      'description': '재료 검색 결과 섹션'
    },

    // === 타이머 관련 ===
    'timerStart': {
      'ko': '시작',
      'en': 'Start',
      'ja': '開始',
      'description': '타이머 시작 버튼'
    },
    'timerStop': {
      'ko': '정지',
      'en': 'Stop',
      'ja': '停止',
      'description': '타이머 정지 버튼'
    },
    'timerReset': {
      'ko': '재설정',
      'en': 'Reset',
      'ja': 'リセット',
      'description': '타이머 재설정 버튼'
    },
    'timerFinished': {
      'ko': '{duration} 타이머가 끝났습니다.',
      'en': '{duration} timer finished.',
      'ja': '{duration}タイマーが終了しました。',
      'description': '타이머 완료 메시지'
    },
    'timerRunning': {
      'ko': '{count}개 타이머 진행 중',
      'en': '{count} timers running',
      'ja': '{count}個のタイマーが動作中',
      'description': '실행 중인 타이머 수'
    },
    'timerInProgress': {
      'ko': '{count}개 진행중',
      'en': '{count} in progress',
      'ja': '{count}個進行中',
      'description': '진행 중인 타이머 수'
    },
    'timerRunningList': {
      'ko': '진행 중인 타이머',
      'en': 'Running Timers',
      'ja': '実行中のタイマー',
      'description': '실행 중인 타이머 목록'
    },
    'timerCooking': {
      'ko': '요리 타이머',
      'en': 'Cooking Timer',
      'ja': '料理タイマー',
      'description': '요리 타이머 섹션'
    },
    'timerFrequentlyUsed': {
      'ko': '자주 사용하는 타이머',
      'en': 'Frequently Used Timers',
      'ja': 'よく使うタイマー',
      'description': '자주 사용하는 타이머 섹션'
    },
    'timerCustom': {
      'ko': '커스텀 타이머',
      'en': 'Custom Timer',
      'ja': 'カスタムタイマー',
      'description': '커스텀 타이머 제목'
    },
    'timerCreateCustom': {
      'ko': '커스텀 타이머 만들기',
      'en': 'Create Custom Timer',
      'ja': 'カスタムタイマーを作成',
      'description': '커스텀 타이머 생성 버튼'
    },
    'timerName': {
      'ko': '타이머 이름',
      'en': 'Timer Name',
      'ja': 'タイマー名',
      'description': '타이머 이름 입력 라벨'
    },
    'timerNameHint': {
      'ko': '예: 계란 삶기, 차 우리기',
      'en': 'e.g., Egg boiling, Tea brewing',
      'ja': '例: 卵茹で、お茶を淹れる',
      'description': '타이머 이름 입력 힌트'
    },
    'timerNameRequired': {
      'ko': '타이머 이름을 입력해주세요',
      'en': 'Please enter timer name',
      'ja': 'タイマー名を入力してください',
      'description': '타이머 이름 필수 입력 메시지'
    },
    'timerTimeRequired': {
      'ko': '시간을 설정해주세요',
      'en': 'Please set time',
      'ja': '時間を設定してください',
      'description': '타이머 시간 필수 설정 메시지'
    },
    'timerTimeSetting': {
      'ko': '시간 설정',
      'en': 'Time Setting',
      'ja': '時間設定',
      'description': '시간 설정 섹션'
    },
    'timerMinutes': {
      'ko': '분',
      'en': 'Minutes',
      'ja': '分',
      'description': '분 단위 라벨'
    },
    'timerSeconds': {
      'ko': '초',
      'en': 'Seconds',
      'ja': '秒',
      'description': '초 단위 라벨'
    },
    'timerDescriptionOptional': {
      'ko': '설명 (선택사항)',
      'en': 'Description (Optional)',
      'ja': '説明 (任意)',
      'description': '타이머 설명 입력 라벨'
    },
    'timerDescriptionHint': {
      'ko': '예: 모닝 티에 완벽한 시간',
      'en': 'e.g., Perfect for morning tea',
      'ja': '例: 朝のお茶に最適な時間',
      'description': '타이머 설명 입력 힌트'
    },

    // === 타이머 프리셋 ===
    'timerPresetSave': {
      'ko': '프리셋으로 저장',
      'en': 'Save as Preset',
      'ja': 'プリセットとして保存',
      'description': '프리셋 저장 버튼'
    },
    'timerPresetSaveDescription': {
      'ko': '다음에 쉽게 재사용할 수 있도록 저장',
      'en': 'Save for easy reuse next time',
      'ja': '次回簡単に再利用できるよう保存',
      'description': '프리셋 저장 설명'
    },
    'timerPresetSaved': {
      'ko': '{name} 프리셋이 저장되었습니다',
      'en': '{name} preset saved',
      'ja': '{name}プリセットが保存されました',
      'description': '프리셋 저장 완료 메시지'
    },
    'timerPresetDelete': {
      'ko': '프리셋 삭제',
      'en': 'Delete Preset',
      'ja': 'プリセットを削除',
      'description': '프리셋 삭제 버튼'
    },
    'timerPresetDeleteConfirm': {
      'ko': '{presetName} 프리셋을 삭제하시겠습니까?\n삭제된 프리셋은 복구할 수 없습니다.',
      'en': 'Are you sure you want to delete the {presetName} preset?\nDeleted presets cannot be recovered.',
      'ja': '{presetName}プリセットを削除しますか？\n削除されたプリセットは復元できません。',
      'description': '프리셋 삭제 확인 메시지'
    },
    'timerPresetDeleted': {
      'ko': '{name} 프리셋이 삭제되었습니다',
      'en': '{name} preset deleted',
      'ja': '{name}プリセットが削除されました',
      'description': '프리셋 삭제 완료 메시지'
    },
    'timerPresetCannotDeleteDefault': {
      'ko': '기본 프리셋은 삭제할 수 없습니다',
      'en': 'Cannot delete default preset',
      'ja': 'デフォルトプリセットは削除できません',
      'description': '기본 프리셋 삭제 불가 메시지'
    },
    'timerPresetAlreadyExists': {
      'ko': '같은 이름의 프리셋이 이미 존재합니다',
      'en': 'Preset with same name already exists',
      'ja': '同じ名前のプリセットが既に存在します',
      'description': '프리셋 이름 중복 오류 메시지'
    },
    'timerPresetSaveFailed': {
      'ko': '프리셋 저장에 실패했습니다',
      'en': 'Failed to save preset',
      'ja': 'プリセットの保存に失敗しました',
      'description': '프리셋 저장 실패 메시지'
    },

    // === 타이머 프리셋 종류 ===
    'timerPresetPastaCooking': {
      'ko': '파스타 삶기',
      'en': 'Pasta Cooking',
      'ja': 'パスタを茹でる',
      'description': '파스타 조리 프리셋'
    },
    'timerPresetPastaCookingDescription': {
      'ko': '표준 파스타 조리 시간',
      'en': 'Standard pasta cooking time',
      'ja': '標準パスタ調理時間',
      'description': '파스타 조리 프리셋 설명'
    },
    'timerPresetHardBoiledEgg': {
      'ko': '완숙 계란',
      'en': 'Hard-boiled Egg',
      'ja': '固茹で卵',
      'description': '완숙 계란 프리셋'
    },
    'timerPresetHardBoiledEggDescription': {
      'ko': '완벽한 완숙 계란',
      'en': 'Perfect hard-boiled egg',
      'ja': '完璧な固茹で卵',
      'description': '완숙 계란 프리셋 설명'
    },
    'timerPresetSoftBoiledEgg': {
      'ko': '반숙 계란',
      'en': 'Soft-boiled Egg',
      'ja': '半熟卵',
      'description': '반숙 계란 프리셋'
    },
    'timerPresetSoftBoiledEggDescription': {
      'ko': '부드럽고 흐르는 노른자',
      'en': 'Soft and runny egg yolk',
      'ja': '柔らかくとろける黄身',
      'description': '반숙 계란 프리셋 설명'
    },
    'timerPresetInstantNoodles': {
      'ko': '라면',
      'en': 'Instant Noodles',
      'ja': 'インスタントラーメン',
      'description': '라면 프리셋'
    },
    'timerPresetInstantNoodlesDescription': {
      'ko': '빠른 라면 조리',
      'en': 'Quick instant noodles',
      'ja': '手軽なインスタントラーメン',
      'description': '라면 프리셋 설명'
    },
    'timerPresetTeaBrewing': {
      'ko': '차 우리기',
      'en': 'Tea Brewing',
      'ja': 'お茶を淹れる',
      'description': '차 우리기 프리셋'
    },
    'timerPresetTeaBrewingDescription': {
      'ko': '완벽한 차 우리는 시간',
      'en': 'Perfect tea steeping time',
      'ja': '完璧なお茶の抽出時間',
      'description': '차 우리기 프리셋 설명'
    },
    'timerPresetSteakCooking': {
      'ko': '스테이크 굽기',
      'en': 'Steak Cooking',
      'ja': 'ステーキを焼く',
      'description': '스테이크 굽기 프리셋'
    },
    'timerPresetSteakCookingDescription': {
      'ko': '미디움 레어 스테이크',
      'en': 'Medium-rare steak',
      'ja': 'ミディアムレアステーキ',
      'description': '스테이크 굽기 프리셋 설명'
    },

    // === 요리 로그 관련 ===
    'cookingLogAdd': {
      'ko': '요리 기록 추가',
      'en': 'Add Cooking Log',
      'ja': '料理記録を追加',
      'description': '요리 기록 추가 버튼'
    },
    'cookingLogWrite': {
      'ko': '요리 기록 작성',
      'en': 'Write Cooking Log',
      'ja': '料理記録を書く',
      'description': '요리 기록 작성 화면 제목'
    },
    'cookingLogTitle': {
      'ko': '제목',
      'en': 'Title',
      'ja': 'タイトル',
      'description': '요리 기록 제목'
    },
    'cookingLogTitleRequired': {
      'ko': '제목 *',
      'en': 'Title *',
      'ja': 'タイトル *',
      'description': '요리 기록 제목 필수 입력'
    },
    'cookingLogTitleHint': {
      'ko': '요리 기록 제목을 입력하세요',
      'en': 'Enter cooking log title',
      'ja': '料理記録のタイトルを入力してください',
      'description': '요리 기록 제목 입력 힌트'
    },
    'cookingLogEnterTitle': {
      'ko': '제목을 입력해주세요',
      'en': 'Please enter a title',
      'ja': 'タイトルを入力してください',
      'description': '제목 필수 입력 메시지'
    },
    'cookingLogDateTime': {
      'ko': '요리한 날짜 및 시간 *',
      'en': 'Cooking Date & Time *',
      'ja': '料理した日時 *',
      'description': '요리 날짜/시간 선택 라벨'
    },
    'cookingLogSelectDateTime': {
      'ko': '날짜와 시간을 선택하세요',
      'en': 'Select date and time',
      'ja': '日付と時刻を選択してください',
      'description': '날짜/시간 선택 힌트'
    },
    'cookingLogPhoto': {
      'ko': '사진',
      'en': 'Photo',
      'ja': '写真',
      'description': '요리 사진 섹션'
    },
    'cookingLogAddPhoto': {
      'ko': '사진 추가',
      'en': 'Add Photo',
      'ja': '写真を追加',
      'description': '사진 추가 버튼'
    },
    'cookingLogTakePhoto': {
      'ko': '카메라로 촬영',
      'en': 'Take with Camera',
      'ja': 'カメラで撮影',
      'description': '카메라로 사진 촬영 옵션'
    },
    'cookingLogSelectFromGallery': {
      'ko': '갤러리에서 선택',
      'en': 'Select from Gallery',
      'ja': 'ギャラリーから選択',
      'description': '갤러리에서 사진 선택 옵션'
    },
    'cookingLogMemo': {
      'ko': '메모',
      'en': 'Memo',
      'ja': 'メモ',
      'description': '요리 메모 섹션'
    },
    'cookingLogMemoHint': {
      'ko': '요리하면서 느낀 점이나 개선사항을 적어보세요',
      'en': 'Write down your thoughts or improvements while cooking',
      'ja': '料理しながら感じたことや改善点を書いてみてください',
      'description': '요리 메모 입력 힌트'
    },
    'cookingLogRecipeInfo': {
      'ko': '레시피 정보',
      'en': 'Recipe Information',
      'ja': 'レシピ情報',
      'description': '레시피 정보 섹션'
    },

    // === 조리 단계 관련 ===
    'cookingStepAdd': {
      'ko': '단계 추가',
      'en': 'Add Step',
      'ja': '手順を追加',
      'description': '조리 단계 추가 버튼'
    },
    'cookingStepNumber': {
      'ko': '{number}번째 단계',
      'en': 'Step {number}',
      'ja': '{number}番目の手順',
      'description': '조리 단계 번호'
    },
    'cookingStepDescription': {
      'ko': '단계 설명',
      'en': 'Step Description',
      'ja': '手順説明',
      'description': '조리 단계 설명 입력'
    },

    // === 검색 관련 ===
    'searchResults': {
      'ko': '검색 결과',
      'en': 'Search Results',
      'ja': '検索結果',
      'description': '검색 결과 섹션'
    },
    'searchReset': {
      'ko': '검색 초기화',
      'en': 'Reset Search',
      'ja': '検索をリセット',
      'description': '검색 초기화 버튼'
    },
    'searchNoResults': {
      'ko': '선택한 재료로 만들 수 있는\n레시피가 없습니다',
      'en': 'No recipes can be made\nwith selected ingredients',
      'ja': '選択した材料で作れる\nレシピがありません',
      'description': '검색 결과 없음 메시지'
    },
    'searchRecipesFound': {
      'ko': '{count}개의 레시피를 찾았습니다',
      'en': '{count} recipes found',
      'ja': '{count}個のレシピが見つかりました',
      'description': '검색 결과 개수'
    },

    // === 설정 관련 ===
    'settingsManagement': {
      'ko': '관리',
      'en': 'Management',
      'ja': '管理',
      'description': '관리 섹션'
    },
    'settingsSeasoningUnitManagement': {
      'ko': '조미료/단위 관리',
      'en': 'Seasoning/Unit Management',
      'ja': '調味料/単位管理',
      'description': '조미료/단위 관리 메뉴'
    },
    'settingsSeasoningUnitDescription': {
      'ko': '조미료/단위 추가, 수정, 삭제',
      'en': 'Add, edit, delete seasonings/units',
      'ja': '調味料/単位の追加、編集、削除',
      'description': '조미료/단위 관리 설명'
    },
    'settingsAppInfo': {
      'ko': '앱 정보',
      'en': 'App Info',
      'ja': 'アプリ情報',
      'description': '앱 정보 섹션'
    },
    'settingsVersion': {
      'ko': '버전',
      'en': 'Version',
      'ja': 'バージョン',
      'description': '앱 버전'
    },
    'settingsLicense': {
      'ko': '라이선스',
      'en': 'License',
      'ja': 'ライセンス',
      'description': '라이선스 정보'
    },
    'settingsLanguage': {
      'ko': '언어 설정',
      'en': 'Language Settings',
      'ja': '言語設定',
      'description': '언어 설정 메뉴'
    },
    'settingsSelectLanguage': {
      'ko': '언어를 선택하세요',
      'en': 'Please select a language',
      'ja': '言語を選択してください',
      'description': '언어 선택 요청'
    },
    'settingsLanguageSystem': {
      'ko': '시스템 언어',
      'en': 'System Language',
      'ja': 'システム言語',
      'description': '시스템 언어 옵션'
    },
    'settingsLanguageKorean': {
      'ko': '한국어',
      'en': 'Korean',
      'ja': '韓国語',
      'description': '한국어 옵션'
    },
    'settingsLanguageEnglish': {
      'ko': 'English',
      'en': 'English',
      'ja': '英語',
      'description': '영어 옵션'
    },
    'settingsLanguageJapanese': {
      'ko': '日本語',
      'en': 'Japanese',
      'ja': '日本語',
      'description': '일본어 옵션'
    },
    'settingsLanguageChanged': {
      'ko': '언어가 변경되었습니다',
      'en': 'Language has been changed',
      'ja': '言語が変更されました',
      'description': '언어 변경 완료 메시지'
    },

    // === 단위 관리 관련 ===
    'unitTypeSelection': {
      'ko': '"{unitName}" 단위가 어떤 종류인지 선택해주세요.',
      'en': 'Please select what type of unit "{unitName}" is.',
      'ja': '"{unitName}"単位がどのような種類かを選択してください。',
      'description': '단위 타입 선택 요청'
    },
    'unitFrequentlyUsed': {
      'ko': '자주 사용하는 단위',
      'en': 'Frequently Used Units',
      'ja': 'よく使う単位',
      'description': '자주 사용하는 단위 섹션'
    },
    'unitWeightBasic': {
      'ko': '무게 (기본)',
      'en': 'Weight (Basic)',
      'ja': '重量 (基本)',
      'description': '기본 무게 단위 카테고리'
    },
    'unitWeightCustom': {
      'ko': '무게 (사용자 추가)',
      'en': 'Weight (Custom)',
      'ja': '重量 (ユーザー追加)',
      'description': '사용자 추가 무게 단위 카테고리'
    },
    'unitVolumeBasic': {
      'ko': '부피 (기본)',
      'en': 'Volume (Basic)',
      'ja': '体積 (基本)',
      'description': '기본 부피 단위 카테고리'
    },
    'unitVolumeCustom': {
      'ko': '부피 (사용자 추가)',
      'en': 'Volume (Custom)',
      'ja': '体積 (ユーザー追加)',
      'description': '사용자 추가 부피 단위 카테고리'
    },
    'unitCountBasic': {
      'ko': '개수 (기본)',
      'en': 'Count (Basic)',
      'ja': '個数 (基本)',
      'description': '기본 개수 단위 카테고리'
    },
    'unitCountCustom': {
      'ko': '개수 (사용자 추가)',
      'en': 'Count (Custom)',
      'ja': '個数 (ユーザー追加)',
      'description': '사용자 추가 개수 단위 카테고리'
    },
    'unitMiscBasic': {
      'ko': '기타 (기본)',
      'en': 'Misc (Basic)',
      'ja': 'その他 (基本)',
      'description': '기본 기타 단위 카테고리'
    },
    'unitMiscCustom': {
      'ko': '기타 (사용자 추가)',
      'en': 'Misc (Custom)',
      'ja': 'その他 (ユーザー追加)',
      'description': '사용자 추가 기타 단위 카테고리'
    },
    'unitBasic': {
      'ko': '기본',
      'en': 'Basic',
      'ja': '基本',
      'description': '기본 단위 라벨'
    },
    'unitNewAdded': {
      'ko': '새 단위 "{unitName}"이(가) {category} 카테고리에 추가되었습니다',
      'en': 'New unit "{unitName}" added to {category} category',
      'ja': '新しい単位"{unitName}"が{category}カテゴリに追加されました',
      'description': '새 단위 추가 완료 메시지'
    },
    'unitSearch': {
      'ko': '단위 검색...',
      'en': 'Search units...',
      'ja': '単位を検索...',
      'description': '단위 검색 힌트'
    },
    'unitAddNew': {
      'ko': '새 단위 추가: "{unitName}"',
      'en': 'Add new unit: "{unitName}"',
      'ja': '新しい単位を追加: "{unitName}"',
      'description': '새 단위 추가 버튼'
    },
    'unitAddNewSubtitle': {
      'ko': '새로운 단위를 추가합니다',
      'en': 'Add a new unit',
      'ja': '新しい単位を追加します',
      'description': '새 단위 추가 설명'
    },
    'unitUsageCount': {
      'ko': '{count}회',
      'en': '{count} times',
      'ja': '{count}回',
      'description': '단위 사용 횟수'
    },
    'unitErrorLoading': {
      'ko': '단위를 불러오는 중 오류가 발생했습니다',
      'en': 'Error loading units',
      'ja': '単位の読み込み中にエラーが発生しました',
      'description': '단위 로딩 오류 메시지'
    },
    'unitUsedTimes': {
      'ko': '{count}회 사용',
      'en': 'Used {count} times',
      'ja': '{count}回使用',
      'description': '단위 사용 횟수 표시'
    },

    // === 알림 관련 ===
    'notificationTimerTitle': {
      'ko': '타이머 알림',
      'en': 'Timer Notification',
      'ja': 'タイマー通知',
      'description': '타이머 알림 설정'
    },
    'notificationBackgroundRefresh': {
      'ko': '백그라운드 앱 새로고침',
      'en': 'Background App Refresh',
      'ja': 'バックグラウンドアプリ更新',
      'description': '백그라운드 앱 새로고침 설정'
    },
    'notificationBackgroundRefreshDescription': {
      'ko': '타이머 알림이 정확히 작동하도록 설정',
      'en': 'Set up for accurate timer notifications',
      'ja': 'タイマー通知が正確に動作するように設定',
      'description': '백그라운드 앱 새로고침 설명'
    },
    'notificationActivated': {
      'ko': '타이머 알림이 활성화되었습니다',
      'en': 'Timer notifications activated',
      'ja': 'タイマー通知が有効になりました',
      'description': '알림 활성화 메시지'
    },
    'notificationDenied': {
      'ko': '알림 권한이 거부되었습니다. 시스템 설정에서 수동으로 활성화할 수 있습니다',
      'en': 'Notification permission denied. You can manually activate it in system settings',
      'ja': '通知の権限が拒否されました。システム設定で手動で有効にできます',
      'description': '알림 권한 거부 메시지'
    },
    'notificationSettings': {
      'ko': '알림 설정',
      'en': 'Notification Settings',
      'ja': '通知設定',
      'description': '알림 설정 메뉴'
    },
    'notificationEnabled': {
      'ko': '타이머 알림이 활성화되어 있습니다',
      'en': 'Timer notifications are enabled',
      'ja': 'タイマー通知が有効になっています',
      'description': '알림 활성화 상태'
    },
    'notificationTurnOff': {
      'ko': '알림을 끄고 싶다면:',
      'en': 'To turn off notifications:',
      'ja': '通知を無効にしたい場合:',
      'description': '알림 끄기 안내'
    },
    'notificationTurnOffInstructions': {
      'ko': '1. 아이폰 설정 앱 열기\n2. 알림 > Recipick 선택\n3. 알림 허용 끄기',
      'en': '1. Open iPhone Settings app\n2. Select Notifications > Recipick\n3. Turn off Allow Notifications',
      'ja': '1. iPhone設定アプリを開く\n2. 通知 > Recipickを選択\n3. 通知を許可をオフにする',
      'description': '알림 끄기 방법'
    },
    'notificationTurnOffWarning': {
      'ko': '알림을 끄면 타이머 완료 시 알림을 받을 수 없습니다',
      'en': 'If you turn off notifications, you will not receive timer completion alerts',
      'ja': '通知を無効にすると、タイマー完了時に通知を受け取れません',
      'description': '알림 끄기 경고'
    },
    'notificationActivatedStatus': {
      'ko': '활성화됨',
      'en': 'Activated',
      'ja': '有効',
      'description': '활성화 상태'
    },
    'notificationDeactivatedStatus': {
      'ko': '비활성화됨',
      'en': 'Deactivated',
      'ja': '無効',
      'description': '비활성화 상태'
    },
    'notificationOpenSettings': {
      'ko': '설정 열기',
      'en': 'Open Settings',
      'ja': '設定を開く',
      'description': '설정 열기 버튼'
    },
    'notificationEnableInSettings': {
      'ko': '설정에서 알림을 활성화해주세요',
      'en': 'Please enable notifications in settings',
      'ja': '設定で通知を有効にしてください',
      'description': '설정에서 알림 활성화 요청'
    },
    'notificationPermissionDenied': {
      'ko': '알림 권한이 거부되었습니다',
      'en': 'Notification permission denied',
      'ja': '通知の権限が拒否されました',
      'description': '알림 권한 거부 메시지'
    },
    'notificationTestSent': {
      'ko': '테스트 알림이 전송되었습니다',
      'en': 'Test notification sent',
      'ja': 'テスト通知が送信されました',
      'description': '테스트 알림 전송 메시지'
    },
    'notificationTest': {
      'ko': '알림 테스트',
      'en': 'Test Notification',
      'ja': '通知テスト',
      'description': '알림 테스트 기능'
    },

    // === 타이머 알림 메시지 ===
    'timerNotificationChannelTitle': {
      'ko': '요리 타이머',
      'en': 'Cooking Timer',
      'ja': '料理タイマー',
      'description': '타이머 알림 채널 제목'
    },
    'timerNotificationChannelDescription': {
      'ko': '요리 타이머 완료 알림',
      'en': 'Cooking timer completion notifications',
      'ja': '料理タイマー完了通知',
      'description': '타이머 알림 채널 설명'
    },
    'timerNotificationCompleteTitle': {
      'ko': '🍳 {timerName} 완료!',
      'en': '🍳 {timerName} Complete!',
      'ja': '🍳 {timerName} 完了！',
      'description': '타이머 완료 알림 제목'
    },
    'timerNotificationCompleteBody': {
      'ko': '{duration} 타이머가 끝났습니다.',
      'en': '{duration} timer finished.',
      'ja': '{duration}タイマーが終了しました。',
      'description': '타이머 완료 알림 내용'
    },
    'timerNotificationTestChannelTitle': {
      'ko': '테스트 알림',
      'en': 'Test Notifications',
      'ja': 'テスト通知',
      'description': '테스트 알림 채널 제목'
    },
    'timerNotificationTestChannelDescription': {
      'ko': '테스트 알림 채널',
      'en': 'Test notification channel',
      'ja': 'テスト通知チャンネル',
      'description': '테스트 알림 채널 설명'
    },
    'timerNotificationTestTitle': {
      'ko': '🧪 테스트 알림',
      'en': '🧪 Test Notification',
      'ja': '🧪 テスト通知',
      'description': '테스트 알림 제목'
    },
    'timerNotificationTestBody': {
      'ko': '이것은 테스트 알림입니다. 알림이 정상적으로 작동하고 있습니다!',
      'en': 'This is a test notification. Notifications are working properly!',
      'ja': 'これはテスト通知です。通知が正常に動作しています！',
      'description': '테스트 알림 내용'
    },

    // === 기타 공통 메시지 ===
    'generalErrorOccurred': {
      'ko': '오류가 발생했습니다',
      'en': 'An error occurred',
      'ja': 'エラーが発生しました',
      'description': '일반 오류 메시지'
    },
    'generalSaveFailed': {
      'ko': '저장 실패',
      'en': 'Save failed',
      'ja': '保存に失敗しました',
      'description': '저장 실패 메시지'
    },
    'generalSaveFailedWithError': {
      'ko': '저장 실패: {error}',
      'en': 'Save failed: {error}',
      'ja': '保存に失敗しました: {error}',
      'description': '저장 실패 오류 메시지'
    },
    'generalCategoryManagement': {
      'ko': '카테고리 관리',
      'en': 'Category Management',
      'ja': 'カテゴリ管理',
      'description': '카테고리 관리 메뉴'
    },
    'generalAddCategory': {
      'ko': '카테고리 추가',
      'en': 'Add Category',
      'ja': 'カテゴリを追加',
      'description': '카테고리 추가 버튼'
    },
    'generalName': {
      'ko': '이름',
      'en': 'Name',
      'ja': '名前',
      'description': '이름 라벨'
    },
    'generalDescription': {
      'ko': '설명',
      'en': 'Description',
      'ja': '説明',
      'description': '설명 라벨'
    },
    'generalSaveOptions': {
      'ko': '저장 옵션',
      'en': 'Save Options',
      'ja': '保存オプション',
      'description': '저장 옵션 다이얼로그'
    },
    'generalHowToSave': {
      'ko': '어떻게 저장하시겠습니까?',
      'en': 'How would you like to save?',
      'ja': 'どのように保存しますか？',
      'description': '저장 방법 질문'
    },
  };

  /// 새로운 번역 테이블을 ARB 파일로 생성
  static Future<void> generateImprovedArbFiles() async {
    final l10nDir = Directory('lib/l10n');
    if (!l10nDir.existsSync()) {
      await l10nDir.create(recursive: true);
    }

    // 각 언어별 ARB 파일 생성
    for (final locale in ['ko', 'en', 'ja']) {
      final arbData = <String, dynamic>{
        '@@locale': locale,
      };

      // 번역 데이터 추가
      for (final entry in translations.entries) {
        final key = entry.key;
        final translationData = entry.value;
        final text = translationData[locale];
        final description = translationData['description'];

        if (text != null && text.isNotEmpty) {
          arbData[key] = text;

          // 영어 ARB에만 메타데이터 추가 (템플릿 파일)
          if (locale == 'en' && description != null && description.isNotEmpty) {
            // placeholders 확인
            final placeholders = <String, dynamic>{};
            final placeholderPattern = RegExp(r'\{(\w+)\}');
            final matches = placeholderPattern.allMatches(text);
            
            for (final match in matches) {
              final placeholderName = match.group(1)!;
              placeholders[placeholderName] = {
                'type': 'String',
              };
            }

            final metadata = <String, dynamic>{
              'description': description,
            };

            if (placeholders.isNotEmpty) {
              metadata['placeholders'] = placeholders;
            }

            arbData['@$key'] = metadata;
          }
        }
      }

      final file = File('lib/l10n/app_$locale.arb');
      final jsonString = JsonEncoder.withIndent('  ').convert(arbData);

      await file.writeAsString(jsonString);
      print('✅ $locale ARB 파일 생성 완료: ${file.path}');
    }
  }

  /// Google Sheets 업로드용 CSV 데이터 생성
  static List<List<String>> generateCsvData() {
    final csvData = <List<String>>[
      ['Key', 'Korean', 'English', 'Japanese', 'Description']
    ];

    for (final entry in translations.entries) {
      final key = entry.key;
      final translationData = entry.value;
      
      csvData.add([
        key,
        translationData['ko'] ?? '',
        translationData['en'] ?? '',
        translationData['ja'] ?? '',
        translationData['description'] ?? '',
      ]);
    }

    return csvData;
  }
}

/// 메인 함수
Future<void> main() async {
  print('🔄 개선된 다국어 번역 테이블 생성 중...');
  
  try {
    // ARB 파일 생성
    await ImprovedTranslations.generateImprovedArbFiles();
    
    // CSV 데이터 생성
    final csvData = ImprovedTranslations.generateCsvData();
    print('📊 ${csvData.length - 1}개의 번역 항목 생성 완료');
    
    // CSV 파일로 저장 (Google Sheets 업로드용)
    final csvContent = csvData.map((row) => row.join(',')).join('\n');
    final csvFile = File('improved_translations.csv');
    await csvFile.writeAsString(csvContent);
    print('💾 CSV 파일 생성 완료: ${csvFile.path}');
    
    print('\n✅ 완료! 다음 단계:');
    print('1. flutter gen-l10n 실행하여 다국어 코드 생성');
    print('2. improved_translations.csv를 Google Sheets에 업로드');
    print('3. 코드에서 새로운 키를 사용하여 번역을 적용');
    
  } catch (e, stackTrace) {
    print('❌ 실행 실패: $e');
    print('StackTrace: $stackTrace');
    exit(1);
  }
}