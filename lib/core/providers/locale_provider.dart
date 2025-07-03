import 'dart:ui';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_provider.g.dart';

const String _localeKey = 'selected_locale';

enum SupportedLocale {
  system('system'),
  korean('ko'),
  english('en'),
  japanese('ja');

  const SupportedLocale(this.code);
  final String code;

  Locale? get locale {
    switch (this) {
      case SupportedLocale.system:
        return null; // 시스템 언어 사용
      case SupportedLocale.korean:
        return const Locale('ko');
      case SupportedLocale.english:
        return const Locale('en');
      case SupportedLocale.japanese:
        return const Locale('ja');
    }
  }

  static SupportedLocale fromCode(String code) {
    return SupportedLocale.values.firstWhere(
      (locale) => locale.code == code,
      orElse: () => SupportedLocale.system,
    );
  }
}

@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Future<SupportedLocale> build() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString(_localeKey);
    
    if (savedLocale != null) {
      return SupportedLocale.fromCode(savedLocale);
    }
    
    return SupportedLocale.system;
  }

  Future<void> setLocale(SupportedLocale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.code);
    state = AsyncValue.data(locale);
  }

  Locale? getCurrentLocale() {
    return state.valueOrNull?.locale;
  }

  Locale getEffectiveLocale() {
    final currentLocale = getCurrentLocale();
    if (currentLocale != null) {
      return currentLocale;
    }
    
    // 시스템 언어가 선택된 경우, 지원하는 언어인지 확인
    final systemLocale = PlatformDispatcher.instance.locale;
    const supportedLocaleCodes = ['ko', 'en', 'ja'];
    
    if (supportedLocaleCodes.contains(systemLocale.languageCode)) {
      return systemLocale;
    }
    
    // 지원하지 않는 시스템 언어인 경우 한국어를 기본으로 사용
    return const Locale('ko');
  }
}