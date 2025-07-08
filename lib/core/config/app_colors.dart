import 'package:flutter/material.dart';

/// RecipeLabo 픽셀 아트 스타일 색상 정의
/// 귀여운 곰 셰프 테마와 게임풍 디자인을 위한 색상 체계
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // 브랜드 주요 색상 (따뜻한 스파이스 테마)
  static const Color primaryOrange = Color(0xFFED6E3A); // 코랄 오렌지
  static const Color primaryDark = Color(0xFFA4330D); // 깊은 레드 오렌지
  static const Color accent = Color(0xFFE9B08E); // 피치
  static const Color backgroundCream = Color(0xFFDBCDB5); // 크림
  static const Color textBrown = Color(0xFF5E3C2C); // 다크 브라운
  static const Color supportGreen = Color(0xFF6C9E4F); // 올리브 그린

  // 추가 색상 팔레트
  static const Color warmWhite = Color(0xFFFAF8F4); // 따뜻한 화이트
  static const Color lightCream = Color(0xFFF5F2ED); // 밝은 크림
  static const Color softOrange = Color(0xFFF5C99B); // 부드러운 오렌지
  static const Color deepBrown = Color(0xFF3C2415); // 깊은 브라운

  // Ingredient Chip 전용 색상 (오렌지 계통으로 통일)
  static const Color chipBackground = Color(0xFFFAF0E6); // 크림색 배경
  static const Color chipBorder = Color(0xFFD2691E); // 갈색 테두리
  static const Color chipSelectedBackground = Color(0xFFED6E3A); // 선택된 배경 (primaryOrange)
  static const Color chipSelectedBorder = Color(0xFFA4330D); // 선택된 테두리 (primaryDark)
  static const Color chipText = Color(0xFF4A2C17); // 진한 갈색 텍스트
  static const Color chipSelectedText = Color(0xFFF5F3E8); // 선택된 텍스트 (크림색)
  static const Color chipShadow = Color(0xFFB8860B); // 기본 그림자
  static const Color chipSelectedShadow = Color(0xFF8B4513); // 선택된 그림자

  // 상태 색상
  static const Color success = Color(0xFF6C9E4F); // 성공 (올리브 그린)
  static const Color warning = Color(0xFFED6E3A); // 경고 (주요 오렌지)
  static const Color error = Color(0xFFD32F2F); // 에러 (빨간색)
  static const Color info = Color(0xFF1976D2); // 정보 (파란색)

  // 그라데이션
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryOrange, primaryDark],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [accent, softOrange],
  );

  // 투명도 변형
  static Color primaryWithOpacity(double opacity) =>
      primaryOrange.withValues(alpha: opacity);

  static Color accentWithOpacity(double opacity) =>
      accent.withValues(alpha: opacity);

  static Color backgroundWithOpacity(double opacity) =>
      backgroundCream.withValues(alpha: opacity);

  // Material Design 3 호환 색상 매핑
  static const Map<String, Color> materialColors = {
    'primary': primaryOrange,
    'onPrimary': warmWhite,
    'primaryContainer': lightCream,
    'onPrimaryContainer': textBrown,
    'secondary': supportGreen,
    'onSecondary': warmWhite,
    'secondaryContainer': Color(0xFFE8F5E8),
    'onSecondaryContainer': Color(0xFF1B4E20),
    'tertiary': accent,
    'onTertiary': deepBrown,
    'tertiaryContainer': softOrange,
    'onTertiaryContainer': textBrown,
    'error': error,
    'onError': warmWhite,
    'errorContainer': Color(0xFFFFDAD6),
    'onErrorContainer': Color(0xFF410002),
    'background': warmWhite,
    'onBackground': textBrown,
    'surface': warmWhite,
    'onSurface': textBrown,
    'surfaceVariant': backgroundCream,
    'onSurfaceVariant': Color(0xFF7A6B5A),
    'outline': Color(0xFF8A7A68),
    'outlineVariant': Color(0xFFCCC2B0),
    'shadow': Colors.black,
    'scrim': Colors.black,
    'inverseSurface': deepBrown,
    'onInverseSurface': warmWhite,
    'inversePrimary': softOrange,
  };

  // 어두운 테마용 색상
  static const Color darkBackground = Color(0xFF1C1611);
  static const Color darkSurface = Color(0xFF2C231C);
  static const Color darkOnSurface = Color(0xFFF0E6D2);
  static const Color darkPrimary = Color(0xFFFFB4A1);
  static const Color darkOnPrimary = Color(0xFF5F1A00);

  // 픽셀 아트 스타일 게임 색상 팔레트
  /// 레시피북 배경색 (크림색 종이)
  static const Color pixelPaper = Color(0xFFF5F3E8);
  /// 레시피북 어두운 크림색
  static const Color pixelPaperDark = Color(0xFFEDE5D3);
  /// 갈색 테두리 (책 프레임)
  static const Color pixelBrown = Color(0xFF8B4513);
  /// 진한 갈색 (텍스트)
  static const Color pixelTextBrown = Color(0xFF4A2C17);
  /// 중간 갈색
  static const Color pixelMidBrown = Color(0xFF6B4423);
  /// 어두운 갈색 (그림자)
  static const Color pixelDarkBrown = Color(0xFF5D2E0A);
  /// 매우 어두운 갈색 (깊은 그림자)
  static const Color pixelVeryDarkBrown = Color(0xFF3D1E0A);
  
  // 픽셀 아트 UI 색상
  /// 밝은 초록색 (성공/확인 버튼)
  static const Color pixelGreen = Color(0xFF32CD32);
  /// 어두운 초록색 (초록 버튼 테두리)
  static const Color pixelGreenDark = Color(0xFF228B22);
  /// 매우 어두운 초록색 (초록 그림자)
  static const Color pixelGreenShadow = Color(0xFF006400);
  
  /// 로얄 블루 (검색 버튼)
  static const Color pixelBlue = Color(0xFF4169E1);
  /// 어두운 블루 (블루 버튼 테두리)
  static const Color pixelBlueDark = Color(0xFF0000CD);
  /// 네이비 블루 (블루 그림자)
  static const Color pixelBlueShadow = Color(0xFF000080);
  
  /// 토마토 색상 (주요 액션 버튼)
  static const Color pixelRed = Color(0xFFFF6347);
  /// 크림슨 (빨강 버튼 테두리)
  static const Color pixelRedDark = Color(0xFFDC143C);
  /// 어두운 빨강 (빨강 그림자)
  static const Color pixelRedShadow = Color(0xFFB22222);
  /// 매우 어두운 빨강 (깊은 그림자)
  static const Color pixelRedDeepShadow = Color(0xFF8B0000);
  
  /// 골드 (장식용)
  static const Color pixelGold = Color(0xFFFFD700);
  /// 어두운 골드
  static const Color pixelGoldDark = Color(0xFFDAA520);
  
  /// 양피지 배경
  static const Color pixelParchment = Color(0xFFFAF0E6);
  /// 갈색 레시피 아이콘 배경
  static const Color pixelRecipeBrown = Color(0xFFD2691E);
  
  // 픽셀 아트 그라데이션
  static const LinearGradient pixelPaperGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [pixelPaper, pixelPaperDark],
  );
  
  static const LinearGradient pixelBrownGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [pixelRecipeBrown, pixelBrown],
  );
}
