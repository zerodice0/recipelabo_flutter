import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:recipick_flutter/core/routes/app_router.dart';
import 'package:recipick_flutter/core/config/app_theme.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';
import 'package:recipick_flutter/core/providers/locale_provider.dart';
import 'package:recipick_flutter/core/services/ad_service.dart';
import 'package:recipick_flutter/core/services/alarm_timer_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await AdService.initialize();
  await AlarmTimerService().initialize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeAsync = ref.watch(localeNotifierProvider);

    return MaterialApp.router(
      title: 'Recilab',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // 항상 라이트 테마 사용 (브랜드 색상 일관성을 위해)
      routerConfig: appRouter,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ko'), Locale('en'), Locale('ja')],
      locale: localeAsync.when(
        data: (supportedLocale) => supportedLocale.locale,
        loading: () => null,
        error: (error, stackTrace) => null,
      ),
      localeResolutionCallback: (locale, supportedLocales) {
        // 사용자가 언어를 선택한 경우
        final currentLocale = localeAsync.valueOrNull?.locale;
        if (currentLocale != null) {
          return currentLocale;
        }

        // 시스템 언어 사용 모드인 경우 또는 로딩 중인 경우
        if (locale != null) {
          for (final supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode) {
              return supportedLocale;
            }
          }
        }

        // 기본값: 한국어
        return const Locale('ko');
      },
    );
  }
}
