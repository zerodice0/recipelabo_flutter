import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saucerer_flutter/core/providers/locale_provider.dart';
import 'package:saucerer_flutter/l10n/app_localizations.dart';

class LanguageSelectionDialog extends ConsumerWidget {
  const LanguageSelectionDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeAsync = ref.watch(localeNotifierProvider);
    final localeNotifier = ref.read(localeNotifierProvider.notifier);

    return AlertDialog(
      title: Text(AppLocalizations.of(context).settingsLanguage),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context).settingsSelectLanguage,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          ...SupportedLocale.values.map((locale) {
            return RadioListTile<SupportedLocale>(
              title: Text(_getLocaleName(context, locale)),
              value: locale,
              groupValue: localeAsync.valueOrNull,
              onChanged: (SupportedLocale? value) async {
                if (value != null) {
                  await localeNotifier.setLocale(value);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(AppLocalizations.of(context)
                            .settingsLanguageChanged),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                }
              },
              dense: true,
            );
          }),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context).actionCancel),
        ),
      ],
    );
  }

  String _getLocaleName(BuildContext context, SupportedLocale locale) {
    final l10n = AppLocalizations.of(context);
    switch (locale) {
      case SupportedLocale.system:
        return l10n.settingsLanguageSystem;
      case SupportedLocale.korean:
        return l10n.settingsLanguageKorean;
      case SupportedLocale.english:
        return l10n.settingsLanguageEnglish;
      case SupportedLocale.japanese:
        return l10n.settingsLanguageJapanese;
    }
  }
}
