import 'package:flutter/material.dart';

/// 반응형 디자인을 위한 헬퍼 클래스
/// 일관된 브레이크포인트와 레이아웃 유틸리티를 제공합니다.
class ResponsiveHelper {
  // 브레이크포인트 상수
  static const double mobileBreakpoint = 480;
  static const double tabletBreakpoint = 768;
  static const double desktopBreakpoint = 1024;
  static const double largeDesktopBreakpoint = 1200;

  /// 현재 화면 크기가 모바일인지 확인
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  /// 현재 화면 크기가 태블릿인지 확인
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < desktopBreakpoint;
  }

  /// 현재 화면 크기가 데스크톱인지 확인
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  /// 화면 크기별 값 반환
  static T responsiveValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
    T? largeDesktop,
  }) {
    final width = MediaQuery.of(context).size.width;

    if (width >= largeDesktopBreakpoint && largeDesktop != null) {
      return largeDesktop;
    }
    if (width >= desktopBreakpoint && desktop != null) {
      return desktop;
    }
    if (width >= mobileBreakpoint && tablet != null) {
      return tablet;
    }
    return mobile;
  }

  /// 그리드 crossAxisCount 반환
  static int getGridCrossAxisCount(
    BuildContext context, {
    int mobile = 2,
    int tablet = 3,
    int desktop = 4,
  }) {
    return responsiveValue(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  /// 그리드 childAspectRatio 반환
  static double getGridChildAspectRatio(
    BuildContext context, {
    double mobile = 1.0,
    double tablet = 1.2,
    double desktop = 1.4,
  }) {
    return responsiveValue(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  /// 패딩 값 반환
  static EdgeInsets getResponsivePadding(
    BuildContext context, {
    EdgeInsets mobile = const EdgeInsets.all(8),
    EdgeInsets? tablet,
    EdgeInsets? desktop,
  }) {
    return responsiveValue(
      context,
      mobile: mobile,
      tablet: tablet ?? const EdgeInsets.all(12),
      desktop: desktop ?? const EdgeInsets.all(16),
    );
  }

  /// 텍스트 크기 반환
  static double getResponsiveTextSize(
    BuildContext context, {
    double mobile = 14,
    double tablet = 16,
    double desktop = 18,
  }) {
    return responsiveValue(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  /// 아이콘 크기 반환
  static double getResponsiveIconSize(
    BuildContext context, {
    double mobile = 20,
    double tablet = 24,
    double desktop = 28,
  }) {
    return responsiveValue(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  /// 스페이싱 값 반환
  static double getSpacing(
    BuildContext context, {
    double mobile = 8,
    double tablet = 12,
    double desktop = 16,
  }) {
    return responsiveValue(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  /// 화면 크기별 레이아웃 빌더
  static Widget responsiveBuilder({
    required BuildContext context,
    required Widget Function(BuildContext) mobile,
    Widget Function(BuildContext)? tablet,
    Widget Function(BuildContext)? desktop,
  }) {
    if (isDesktop(context) && desktop != null) {
      return desktop(context);
    }
    if (isTablet(context) && tablet != null) {
      return tablet(context);
    }
    return mobile(context);
  }
}

/// 반응형 그리드 설정을 위한 확장 클래스
extension ResponsiveGrid on BuildContext {
  /// 반응형 그리드 델리게이트 반환
  SliverGridDelegate get responsiveGridDelegate {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: ResponsiveHelper.getGridCrossAxisCount(this),
      childAspectRatio: ResponsiveHelper.getGridChildAspectRatio(this),
      crossAxisSpacing: ResponsiveHelper.getSpacing(this),
      mainAxisSpacing: ResponsiveHelper.getSpacing(this),
    );
  }

  /// 반응형 패딩 반환
  EdgeInsets get responsivePadding =>
      ResponsiveHelper.getResponsivePadding(this);

  /// 반응형 텍스트 크기 반환
  double get responsiveTextSize => ResponsiveHelper.getResponsiveTextSize(this);

  /// 반응형 아이콘 크기 반환
  double get responsiveIconSize => ResponsiveHelper.getResponsiveIconSize(this);

  /// 반응형 스페이싱 반환
  double get responsiveSpacing => ResponsiveHelper.getSpacing(this);
}
