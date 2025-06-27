import 'package:flutter/material.dart';

/// 요리 앱을 위한 브랜드 색상 정의
/// "따뜻한 스파이스" 테마를 기반으로 한 색상 체계
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
      primaryOrange.withOpacity(opacity);
  
  static Color accentWithOpacity(double opacity) => 
      accent.withOpacity(opacity);
  
  static Color backgroundWithOpacity(double opacity) => 
      backgroundCream.withOpacity(opacity);

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
}