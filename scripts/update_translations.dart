#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';

/// Script to download translations from Google Sheets and update ARB files
///
/// Usage:
/// dart scripts/update_translations.dart [sheet_id] [--dry-run]
///
/// Environment variables required:
/// - GOOGLE_SHEETS_API_KEY: Your Google Sheets API key
///
/// Arguments:
/// - sheet_id: Google Sheets document ID (optional, will use default from config)
/// - --dry-run: Preview changes without writing files

class TranslationUpdater {
  static const String defaultSheetId =
      '1q3T5hPEshaAifT5K9g0L-2yqPH4zv62x-43Z1u-cZns';
  static String get apiKey =>
      Platform.environment['GOOGLE_SHEETS_API_KEY'] ?? '';

  final String sheetId;
  final bool dryRun;

  TranslationUpdater({required this.sheetId, this.dryRun = false});

  /// Main execution method
  Future<void> run() async {
    debugPrint('🌍 Starting translation update...');
    debugPrint('📊 Sheet ID: $sheetId');
    debugPrint('🔑 API Key: ${apiKey.isNotEmpty ? "✅ Set" : "❌ Missing"}');

    if (apiKey.isEmpty) {
      debugPrint('❌ Error: GOOGLE_SHEETS_API_KEY environment variable not set');
      debugPrint('💡 Please set your Google Sheets API key:');
      debugPrint('   export GOOGLE_SHEETS_API_KEY="your_api_key_here"');
      exit(1);
    }

    try {
      // Download CSV data from Google Sheets
      final csvData = await downloadSheetAsCsv();

      // Parse CSV and convert to translation maps
      final translations = parseCsvToTranslations(csvData);

      // Generate ARB files
      await generateArbFiles(translations);

      debugPrint('✅ Translation update completed successfully!');
    } catch (e, stackTrace) {
      debugPrint('❌ Error updating translations: $e');
      debugPrint('Stack trace: $stackTrace');
      exit(1);
    }
  }

  /// Download Google Sheets as CSV format
  Future<String> downloadSheetAsCsv() async {
    final url =
        'https://docs.google.com/spreadsheets/d/$sheetId/export?format=csv&gid=0';

    debugPrint('📥 Downloading translations from Google Sheets...');
    debugPrint('🔗 URL: $url');

    final client = HttpClient();
    try {
      final request = await client.getUrl(Uri.parse(url));
      final response = await request.close();

      if (response.statusCode == 200) {
        final csvContent = await response.transform(utf8.decoder).join();
        debugPrint('✅ Successfully downloaded ${csvContent.length} characters');
        return csvContent;
      } else {
        throw Exception(
            'Failed to download sheet: HTTP ${response.statusCode}');
      }
    } finally {
      client.close();
    }
  }

  /// Parse CSV data into translation maps
  Map<String, Map<String, String>> parseCsvToTranslations(String csvData) {
    debugPrint('🔄 Parsing CSV data...');

    final rows = const CsvToListConverter().convert(csvData);

    if (rows.isEmpty) {
      throw Exception('CSV data is empty');
    }

    // Expected header: Key, Korean (ko), English (en), Japanese (ja), Context, Status, Last Modified, Notes
    final headers = rows.first.map((e) => e.toString()).toList();
    debugPrint('📋 Headers: $headers');

    // Find column indices
    final keyIndex = headers.indexOf('Key');
    final koIndex =
        headers.indexWhere((h) => h.contains('Korean') || h.contains('ko'));
    final enIndex =
        headers.indexWhere((h) => h.contains('English') || h.contains('en'));
    final jaIndex =
        headers.indexWhere((h) => h.contains('Japanese') || h.contains('ja'));
    final statusIndex = headers.indexOf('Status');

    if (keyIndex == -1 || koIndex == -1 || enIndex == -1 || jaIndex == -1) {
      throw Exception(
          'Required columns not found. Expected: Key, Korean, English, Japanese');
    }

    debugPrint(
        '📍 Column mapping: Key=$keyIndex, Ko=$koIndex, En=$enIndex, Ja=$jaIndex');

    final translations = <String, Map<String, String>>{};
    var processedCount = 0;
    var approvedCount = 0;

    // Process data rows (skip header)
    for (int i = 1; i < rows.length; i++) {
      final row = rows[i];

      if (row.length <= keyIndex) continue;

      final key = row[keyIndex]?.toString().trim();
      if (key == null || key.isEmpty) continue;

      // Skip rows that are not approved (if status column exists)
      if (statusIndex != -1 && row.length > statusIndex) {
        final status = row[statusIndex]?.toString().trim().toLowerCase();
        if (status != null && status != 'approved') {
          debugPrint('⏭️  Skipping $key (status: $status)');
          continue;
        }
        approvedCount++;
      }

      final ko =
          row.length > koIndex ? row[koIndex]?.toString().trim() ?? '' : '';
      final en =
          row.length > enIndex ? row[enIndex]?.toString().trim() ?? '' : '';
      final ja =
          row.length > jaIndex ? row[jaIndex]?.toString().trim() ?? '' : '';

      translations[key] = {
        'ko': ko,
        'en': en,
        'ja': ja,
      };

      processedCount++;
    }

    debugPrint(
        '✅ Parsed $processedCount translations ($approvedCount approved)');
    return translations;
  }

  /// Generate ARB files from translations
  Future<void> generateArbFiles(
      Map<String, Map<String, String>> translations) async {
    debugPrint('📝 Generating ARB files...');

    final locales = ['ko', 'en', 'ja'];

    for (final locale in locales) {
      await generateArbFile(locale, translations);
    }
  }

  /// Generate individual ARB file for a locale
  Future<void> generateArbFile(
      String locale, Map<String, Map<String, String>> translations) async {
    final arbPath = 'lib/l10n/app_$locale.arb';

    debugPrint('📄 Generating $arbPath...');

    // Build ARB content
    final arbData = <String, dynamic>{
      '@@locale': locale,
    };

    // Add section comments and translations
    var addedCount = 0;
    String? currentSection;

    for (final entry in translations.entries) {
      final key = entry.key;
      final translationsMap = entry.value;
      final value = translationsMap[locale];

      if (value == null || value.isEmpty) {
        debugPrint('⚠️  Missing $locale translation for: $key');
        continue;
      }

      // Add section comment if key starts with different prefix
      final newSection = _extractSection(key);
      if (newSection != currentSection) {
        currentSection = newSection;
        arbData['@@${newSection}_section'] =
            _getSectionTitle(newSection, locale);
      }

      arbData[key] = value;

      // Add metadata for parameterized strings
      if (value.contains('{') && value.contains('}')) {
        arbData['@$key'] = _generateMetadata(value);
      }

      addedCount++;
    }

    // Convert to JSON with proper formatting
    final jsonContent = const JsonEncoder.withIndent('  ').convert(arbData);

    if (dryRun) {
      debugPrint(
          '🔍 [DRY RUN] Would write to $arbPath ($addedCount translations)');
      debugPrint('📄 Content preview (first 300 chars):');
      debugPrint(jsonContent.substring(
          0, jsonContent.length > 300 ? 300 : jsonContent.length));
      debugPrint('...');
    } else {
      final file = File(arbPath);
      await file.parent.create(recursive: true);
      await file.writeAsString(jsonContent);
      debugPrint('✅ Written $arbPath ($addedCount translations)');
    }
  }

  /// Extract section name from key (e.g., "nav_tab_recipes" -> "nav")
  String _extractSection(String key) {
    final parts = key.split('_');
    return parts.isNotEmpty ? parts.first : 'general';
  }

  /// Get localized section title
  String _getSectionTitle(String section, String locale) {
    final titles = {
      'nav': {'ko': '네비게이션', 'en': 'Navigation', 'ja': 'ナビゲーション'},
      'screen': {'ko': '화면 제목', 'en': 'Screen Titles', 'ja': '画面タイトル'},
      'button': {'ko': '버튼', 'en': 'Buttons', 'ja': 'ボタン'},
      'label': {'ko': '폼 라벨', 'en': 'Form Labels', 'ja': 'フォームラベル'},
      'hint': {'ko': '폼 힌트', 'en': 'Form Hints', 'ja': 'フォームヒント'},
      'error': {'ko': '에러 메시지', 'en': 'Error Messages', 'ja': 'エラーメッセージ'},
      'empty': {
        'ko': '빈 상태 메시지',
        'en': 'Empty State Messages',
        'ja': '空の状態メッセージ'
      },
      'status': {'ko': '상태 메시지', 'en': 'Status Messages', 'ja': 'ステータスメッセージ'},
      'success': {'ko': '성공 메시지', 'en': 'Success Messages', 'ja': '成功メッセージ'},
      'dialog': {'ko': '다이얼로그', 'en': 'Dialog', 'ja': 'ダイアログ'},
      'settings': {'ko': '설정 라벨', 'en': 'Settings Labels', 'ja': '設定ラベル'},
      'recipe': {'ko': '레시피 관련', 'en': 'Recipe Related', 'ja': 'レシピ関連'},
      'search': {'ko': '검색 라벨', 'en': 'Search Labels', 'ja': '検索ラベル'},
      'seasoning': {
        'ko': '조미료 관리',
        'en': 'Seasoning Management',
        'ja': '調味料管理'
      },
      'unit': {'ko': '단위 카테고리', 'en': 'Unit Categories', 'ja': '単位カテゴリ'},
      'timer': {'ko': '타이머', 'en': 'Timer', 'ja': 'タイマー'},
    };

    return titles[section]?[locale] ?? section.toUpperCase();
  }

  /// Generate metadata for parameterized strings
  Map<String, dynamic> _generateMetadata(String value) {
    final placeholders = <String, Map<String, String>>{};

    // Find all placeholders like {count}, {recipeName}, etc.
    final regex = RegExp(r'\{(\w+)\}');
    final matches = regex.allMatches(value);

    for (final match in matches) {
      final placeholder = match.group(1)!;

      // Determine type based on common patterns
      String type = 'String';
      if (placeholder.toLowerCase().contains('count') ||
          placeholder.toLowerCase().contains('number')) {
        type = 'int';
      }

      placeholders[placeholder] = {'type': type};
    }

    return placeholders.isNotEmpty ? {'placeholders': placeholders} : {};
  }
}

/// Main entry point
Future<void> main(List<String> arguments) async {
  // Parse arguments
  String sheetId = TranslationUpdater.defaultSheetId;
  bool dryRun = false;

  for (int i = 0; i < arguments.length; i++) {
    final arg = arguments[i];

    if (arg == '--dry-run') {
      dryRun = true;
    } else if (arg == '--help' || arg == '-h') {
      printUsage();
      return;
    } else if (!arg.startsWith('-')) {
      sheetId = arg;
    }
  }

  if (sheetId == 'YOUR_SHEET_ID_HERE') {
    debugPrint('❌ Error: Google Sheets ID not provided');
    debugPrint(
        '💡 Please provide sheet ID as argument or update defaultSheetId in script');
    printUsage();
    exit(1);
  }

  final updater = TranslationUpdater(sheetId: sheetId, dryRun: dryRun);
  await updater.run();
}

void printUsage() {
  debugPrint('''
🌍 Translation Update Script

Usage:
  dart scripts/update_translations.dart [options] <sheet_id>

Arguments:
  sheet_id    Google Sheets document ID (required)

Options:
  --dry-run   Preview changes without writing files
  --help      Show this help message

Environment Variables:
  GOOGLE_SHEETS_API_KEY    Your Google Sheets API key (required)

Example:
  export GOOGLE_SHEETS_API_KEY="your_api_key_here"
  dart scripts/update_translations.dart --dry-run 1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms
''');
}
