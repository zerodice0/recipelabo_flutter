# RecipeLabo 픽셀 아트 Assets 생성 프롬프트

RecipeLabo 앱의 귀여운 곰 셰프 테마에 맞는 픽셀 아트 스타일 assets 생성을 위한 프롬프트 모음입니다.

## 📋 필요한 Assets 목록

### 1. 레시피 카드 배경
**파일명**: `recipe_card_bg.png`

**프롬프트**:
```
Create a pixel art style recipe card background with vintage cookbook aesthetics. Include ornate decorative borders with kitchen utensils motifs (spoons, forks, whisks) in corners. Use warm cream/beige base color with subtle brown wooden texture. Size should be suitable for mobile card interface. Style should match cute pixel art black bear chef character.
```

---

### 2. 레시피북 커버
**파일명**: `recipe_book_cover.png`

**프롬프트**:
```
Design a pixel art cookbook cover that looks like an old leather-bound recipe book. Include brass clasps, weathered brown leather texture, and embossed title area. Add small decorative elements like kitchen herbs or utensil silhouettes. Should feel nostalgic and cozy, matching the cute black black bear chef aesthetic.
```

---

### 3. 재료 아이콘 세트
**파일명**: `ingredient_icons_set.png`

**프롬프트**:
```
Create a pixel art icon set of common cooking ingredients in cute kawaii style. Include: tomato, onion, garlic, salt shaker, pepper mill, olive oil bottle, herbs (basil leaves), egg, flour bag. Each icon should be 32x32 pixels, colorful and cheerful, matching the black bear chef character style.
```

---

### 4. 타이머 모래시계
**파일명**: `timer_hourglass.png`

**프롬프트**:
```
Design a cute pixel art hourglass/timer icon with sand particles. Make it magical and whimsical with sparkle effects around it. Use warm golden sand and vintage brass frame. Should be 64x64 pixels and match the cozy cooking game aesthetic.
```

---

### 5. 요리 도구 보더 패턴
**파일명**: `cooking_utensils_border.png`

**프롬프트**:
```
Create a decorative pixel art border pattern featuring cooking utensils (ladles, spatulas, whisks, measuring cups) arranged in a repeating pattern. Use warm kitchen colors and cute, rounded designs. Should tile seamlessly for use as UI borders and frames.
```

---

## 🎨 스타일 가이드라인

모든 assets은 다음 기준을 따라야 합니다:

- **픽셀 아트 스타일**: 선명한 픽셀, 블러 효과 없음
- **색상 팔레트**: 따뜻한 갈색, 크림색, 토마토색, 골드 등
- **귀여운 스타일**: 곰 셰프 캐릭터와 조화로운 kawaii 느낌
- **게임 UI 적합**: 모바일 인터페이스에 잘 어울리는 크기와 비율

## 📱 사용 목적

- **recipe_card_bg.png**: 레시피 카드 배경 장식
- **recipe_book_cover.png**: 스플래시 화면이나 메인 헤더용
- **ingredient_icons_set.png**: 재료 선택 UI에서 개별 아이콘으로 분할 사용
- **timer_hourglass.png**: 타이머 화면 메인 아이콘
- **cooking_utensils_border.png**: 카드 테두리나 장식 요소로 사용

## 🔄 적용 방법

1. Gemini로 각 프롬프트를 입력하여 이미지 생성
2. 생성된 이미지를 해당 파일명으로 `assets/` 폴더에 저장
3. 필요시 `pubspec.yaml`의 assets 섹션에 경로 추가
4. Flutter 코드에서 `Image.asset()` 또는 `AssetImage()` 사용하여 로드

---

## 🔧 필요한 수정사항

현재 생성된 assets에 다음과 같은 문제들이 발견되어 수정이 필요합니다:

### 1. 레시피 카드 배경 (recipe_card_bg.png)
**문제**: 이미지에 "RECIPE" 텍스트가 하드코딩되어 있음
**해결방안**: 텍스트 없는 순수 배경 패턴으로 재생성 필요
**수정된 프롬프트**:
```
Create a pixel art style recipe card background with vintage cookbook aesthetics. Include ornate decorative borders with kitchen utensils motifs (spoons, forks, whisks) in corners. Use warm cream/beige base color with subtle brown wooden texture. NO TEXT should be included - just the background pattern and decorative elements. Size should be suitable for mobile card interface. Style should match cute pixel art black bear chef character.
```

### 2. 레시피북 커버 (recipe_book_cover.png)
**문제**: 이미지에 "TITLE" 플레이스홀더 텍스트가 포함되어 있음
**해결방안**: 제목 영역은 비워두고 순수 커버 디자인만 포함
**수정된 프롬프트**:
```
Design a pixel art cookbook cover that looks like an old leather-bound recipe book. Include brass clasps, weathered brown leather texture, and embossed decorative elements but NO TEXT OR TITLE. Add small decorative elements like kitchen herbs or utensil silhouettes. The title area should be blank/clean for text overlay. Should feel nostalgic and cozy, matching the cute black bear chef aesthetic.
```

### 3. 재료 아이콘 세트 (ingredient_icons_set.png)
**권장사항**: 개별 재료 아이콘들을 별도 파일로 분할 추출하여 UI에서 독립적으로 사용하는 것을 고려
**작업**: 이미지 편집 도구를 사용하여 각 32x32 아이콘을 개별 파일로 추출

### 4. PNG → SVG 전환 고려사항
**효율성 개선**: PNG 대신 SVG 형식 사용을 고려할 수 있음
**장점**:
- 벡터 기반으로 해상도 독립적
- 파일 크기 최적화
- 색상 변경이나 스케일링이 용이

**단점**:
- 픽셀 아트의 특성상 PNG가 더 적절할 수 있음
- SVG는 픽셀 단위의 정밀한 제어가 어려움

**결론**: 현재 픽셀 아트 스타일을 유지하려면 PNG 형식이 더 적합함

---

**참고**: 모든 assets은 현재 적용된 픽셀 아트 스타일 UI와 일관성을 유지해야 합니다.