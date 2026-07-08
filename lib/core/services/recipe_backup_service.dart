import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:recipick_flutter/core/config/local_user_policy.dart';
import 'package:recipick_flutter/core/di/provider.dart';
import 'package:recipick_flutter/core/services/image_storage_service.dart';
import 'package:recipick_flutter/data/datasources/local/database_helper.dart';
import 'package:sqflite/sqflite.dart';

final recipeBackupServiceProvider = Provider<RecipeBackupService>((ref) {
  return RecipeBackupService(
    databaseHelper: ref.watch(databaseHelperProvider),
    imageStorageService: ImageStorageService(),
  );
});

class RecipeBackupService {
  RecipeBackupService({
    required DatabaseHelper databaseHelper,
    required ImageStorageService imageStorageService,
  }) : this._(
         databaseHelper: databaseHelper,
         imageStorageService: imageStorageService,
       );

  RecipeBackupService._({
    required this._databaseHelper,
    required this._imageStorageService,
  });

  static const String backupFormat = 'recipick.recipe_backup';
  static const int currentFormatVersion = 1;

  static const List<String> _tableOrder = [
    'users',
    'recipes',
    'recipe_versions',
    'ingredients',
    'steps',
    'cooking_logs',
  ];

  static const Map<String, Set<String>> _tableColumns = {
    'users': {
      'id',
      'username',
      'avatarUrl',
      'createdAt',
      'updatedAt',
      'isDeleted',
    },
    'recipes': {
      'id',
      'authorId',
      'latestVersionId',
      'name',
      'description',
      'sourceUrl',
      'sourceName',
      'importedAt',
      'isPublic',
      'createdAt',
      'updatedAt',
      'isDeleted',
    },
    'recipe_versions': {
      'id',
      'recipeId',
      'versionNumber',
      'name',
      'versionName',
      'description',
      'authorId',
      'createdAt',
      'isDeleted',
      'changeLog',
      'baseVersionId',
      'versionStatus',
    },
    'ingredients': {
      'id',
      'recipeVersionId',
      'name',
      'quantity',
      'unit',
      'createdAt',
      'updatedAt',
      'isDeleted',
    },
    'steps': {
      'id',
      'recipeVersionId',
      'stepNumber',
      'description',
      'imageUrl',
      'timerMinutes',
      'timerSeconds',
      'timerName',
      'createdAt',
      'updatedAt',
      'isDeleted',
    },
    'cooking_logs': {
      'id',
      'recipeVersionId',
      'authorId',
      'title',
      'memo',
      'base64EncodedImageData',
      'overallRating',
      'saltinessRating',
      'sweetnessRating',
      'spicinessRating',
      'umamiRating',
      'failureReason',
      'nextAdjustment',
      'cookedAt',
      'createdAt',
      'updatedAt',
      'isDeleted',
    },
  };

  static const Map<String, Set<String>> _requiredColumns = {
    'users': {'id', 'username', 'createdAt', 'updatedAt', 'isDeleted'},
    'recipes': {
      'id',
      'authorId',
      'latestVersionId',
      'name',
      'isPublic',
      'createdAt',
      'updatedAt',
      'isDeleted',
    },
    'recipe_versions': {
      'id',
      'recipeId',
      'versionNumber',
      'name',
      'description',
      'authorId',
      'createdAt',
      'isDeleted',
    },
    'ingredients': {
      'id',
      'recipeVersionId',
      'name',
      'quantity',
      'unit',
      'createdAt',
      'updatedAt',
      'isDeleted',
    },
    'steps': {
      'id',
      'recipeVersionId',
      'stepNumber',
      'description',
      'createdAt',
      'updatedAt',
      'isDeleted',
    },
    'cooking_logs': {
      'id',
      'recipeVersionId',
      'authorId',
      'title',
      'cookedAt',
      'createdAt',
      'updatedAt',
      'isDeleted',
    },
  };

  static const Map<String, Set<String>> _integerColumns = {
    'recipes': {'isPublic', 'isDeleted'},
    'recipe_versions': {'versionNumber', 'isDeleted'},
    'ingredients': {'isDeleted'},
    'steps': {'stepNumber', 'timerMinutes', 'timerSeconds', 'isDeleted'},
    'cooking_logs': {
      'overallRating',
      'saltinessRating',
      'sweetnessRating',
      'spicinessRating',
      'umamiRating',
      'isDeleted',
    },
    'users': {'isDeleted'},
  };

  static const Map<String, Set<String>> _numberColumns = {
    'ingredients': {'quantity'},
  };

  final DatabaseHelper _databaseHelper;
  final ImageStorageService _imageStorageService;

  Future<String> exportToJsonString() async {
    final db = await _databaseHelper.database;
    final tables = <String, List<Map<String, Object?>>>{};

    for (final tableName in _tableOrder) {
      final rows = await db.query(tableName, orderBy: 'id ASC');
      tables[tableName] = rows
          .map((row) => Map<String, Object?>.from(row))
          .toList();
    }
    _appendSyntheticUsersForExport(tables);

    final stepImages = await _collectStepImages(tables['steps'] ?? const []);
    final document = <String, Object?>{
      'format': backupFormat,
      'formatVersion': currentFormatVersion,
      'exportedAt': DateTime.now().toUtc().toIso8601String(),
      'mergePolicy': const {
        'records': 'upsert_by_id',
        'existingRecords': 'preserve_unmentioned',
        'duplicateIds': 'backup_record_replaces_existing_record',
        'stepImages':
            'restore_embedded_files_to_local_image_storage_and_rewrite_step_imageUrl',
        'cookingLogImages':
            'preserve_cooking_logs.base64EncodedImageData_without_extra_file_handling',
      },
      'tables': tables,
      'stepImages': stepImages,
    };

    return const JsonEncoder.withIndent('  ').convert(document);
  }

  Future<RecipeBackupExportResult> exportToFile() async {
    final jsonString = await exportToJsonString();
    final appDir = await getApplicationDocumentsDirectory();
    final backupDir = Directory(p.join(appDir.path, 'backups'));

    if (!await backupDir.exists()) {
      await backupDir.create(recursive: true);
    }

    final fileName = _buildBackupFileName(DateTime.now());
    final file = File(p.join(backupDir.path, fileName));
    await file.writeAsString(jsonString, flush: true);

    final summary = _summaryFromDocument(jsonDecode(jsonString));
    return RecipeBackupExportResult(file: file, summary: summary);
  }

  Future<RecipeBackupImportResult> importFromJsonString(
    String jsonString,
  ) async {
    final decoded = jsonDecode(jsonString);
    if (decoded is! Map<String, Object?>) {
      throw const FormatException('백업 파일 형식이 올바르지 않습니다.');
    }

    _validateBackupHeader(decoded);

    final rawTables = decoded['tables'];
    if (rawTables is! Map<String, Object?>) {
      throw const FormatException('백업 파일에 테이블 데이터가 없습니다.');
    }
    _validateTablePresence(rawTables);

    final rowsByTable = <String, List<Map<String, Object?>>>{};
    for (final tableName in _tableOrder) {
      rowsByTable[tableName] = _readTableRows(rawTables[tableName], tableName);
    }

    final db = await _databaseHelper.database;
    await _ensureReferencedUsers(db, rowsByTable);
    await _validateRelationships(db, rowsByTable);

    final restoredImages = await _restoreStepImages(decoded['stepImages']);
    final resolvedStepImages = await _resolveStepImagePaths(
      db,
      rowsByTable['steps']!,
      restoredImages.pathByOriginalPath,
    );
    rowsByTable['steps'] = resolvedStepImages.rows;

    try {
      await db.transaction((txn) async {
        for (final tableName in _tableOrder) {
          for (final row in rowsByTable[tableName]!) {
            await txn.insert(
              tableName,
              row,
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
          }
        }
      });
    } catch (_) {
      for (final path in restoredImages.restoredPaths) {
        await _imageStorageService.deleteImageFile(path);
      }
      rethrow;
    }

    return RecipeBackupImportResult(
      recipes: rowsByTable['recipes']!.length,
      versions: rowsByTable['recipe_versions']!.length,
      ingredients: rowsByTable['ingredients']!.length,
      steps: rowsByTable['steps']!.length,
      cookingLogs: rowsByTable['cooking_logs']!.length,
      restoredStepImages: restoredImages.restoredCount,
      skippedStepImages:
          restoredImages.skippedCount + resolvedStepImages.skippedCount,
    );
  }

  Future<List<Map<String, Object?>>> _collectStepImages(
    List<Map<String, Object?>> steps,
  ) async {
    final images = <Map<String, Object?>>[];
    final seenPaths = <String>{};

    for (final step in steps) {
      final imagePath = step['imageUrl'];
      if (imagePath is! String || imagePath.trim().isEmpty) {
        continue;
      }
      if (!seenPaths.add(imagePath)) {
        continue;
      }

      final imageFile = await _imageStorageService.getImageFile(imagePath);
      if (imageFile == null) {
        continue;
      }

      final bytes = await imageFile.readAsBytes();
      images.add({
        'originalPath': imagePath,
        'fileName': p.basename(imagePath),
        'extension': p.extension(imagePath).isEmpty
            ? '.jpg'
            : p.extension(imagePath),
        'base64Data': base64Encode(bytes),
      });
    }

    return images;
  }

  void _appendSyntheticUsersForExport(
    Map<String, List<Map<String, Object?>>> tables,
  ) {
    final users = tables['users']!;
    final userIds = users.map((row) => row['id']).whereType<String>().toSet();
    final referencedUserIds = <String>{
      ...tables['recipes']!.map((row) => row['authorId']).whereType<String>(),
      ...tables['recipe_versions']!
          .map((row) => row['authorId'])
          .whereType<String>(),
      ...tables['cooking_logs']!
          .map((row) => row['authorId'])
          .whereType<String>(),
    };
    final now = DateTime.now().toUtc().toIso8601String();

    for (final userId in referencedUserIds) {
      if (userIds.contains(userId)) {
        continue;
      }

      users.add({
        'id': userId,
        'username': LocalUserPolicy.syntheticUsernameFor(userId),
        'avatarUrl': null,
        'createdAt': now,
        'updatedAt': now,
        'isDeleted': 0,
      });
      userIds.add(userId);
    }
  }

  Future<_RestoredStepImages> _restoreStepImages(Object? rawImages) async {
    if (rawImages == null) {
      return const _RestoredStepImages();
    }
    if (rawImages is! List<Object?>) {
      throw const FormatException('백업 이미지 데이터가 올바르지 않습니다.');
    }

    final pathByOriginalPath = <String, String>{};
    var restoredCount = 0;
    var skippedCount = 0;
    var imageIndex = 0;

    for (final rawImage in rawImages) {
      imageIndex += 1;
      if (rawImage is! Map<String, Object?>) {
        skippedCount += 1;
        continue;
      }

      final originalPath = rawImage['originalPath'];
      final base64Data = rawImage['base64Data'];
      if (originalPath is! String || base64Data is! String) {
        skippedCount += 1;
        continue;
      }

      try {
        final bytes = base64Decode(base64Data);
        final extension = rawImage['extension'] is String
            ? rawImage['extension'] as String
            : p.extension(originalPath);
        final safeExtension = extension.startsWith('.')
            ? extension
            : '.$extension';
        final safeName = _sanitizeFileName(
          'backup_${DateTime.now().microsecondsSinceEpoch}_$imageIndex$safeExtension',
        );

        final restoredPath = await _imageStorageService.saveImageBytes(
          bytes,
          safeExtension,
          customFileName: safeName,
        );
        pathByOriginalPath[originalPath] = restoredPath;
        restoredCount += 1;
      } catch (_) {
        skippedCount += 1;
      }
    }

    return _RestoredStepImages(
      pathByOriginalPath: pathByOriginalPath,
      restoredPaths: pathByOriginalPath.values.toList(),
      restoredCount: restoredCount,
      skippedCount: skippedCount,
    );
  }

  Future<_ResolvedStepImageRows> _resolveStepImagePaths(
    Database db,
    List<Map<String, Object?>> rows,
    Map<String, String> pathByOriginalPath,
  ) async {
    final resolvedRows = <Map<String, Object?>>[];
    var skippedCount = 0;

    for (final row in rows) {
      final imagePath = row['imageUrl'];
      if (imagePath is! String || imagePath.trim().isEmpty) {
        resolvedRows.add(row);
        continue;
      }

      final restoredPath = pathByOriginalPath[imagePath];
      if (restoredPath != null) {
        resolvedRows.add({...row, 'imageUrl': restoredPath});
        continue;
      }

      final existingRows = await db.query(
        'steps',
        columns: ['imageUrl'],
        where: 'id = ?',
        whereArgs: [row['id']],
        limit: 1,
      );
      final existingPath = existingRows.isEmpty
          ? null
          : existingRows.first['imageUrl'];

      resolvedRows.add({
        ...row,
        'imageUrl': existingPath is String && existingPath.trim().isNotEmpty
            ? existingPath
            : null,
      });
      skippedCount += 1;
    }

    return _ResolvedStepImageRows(
      rows: resolvedRows,
      skippedCount: skippedCount,
    );
  }

  void _validateBackupHeader(Map<String, Object?> decoded) {
    if (decoded['format'] != backupFormat) {
      throw const FormatException('지원하지 않는 백업 파일입니다.');
    }
    if (decoded['formatVersion'] != currentFormatVersion) {
      throw const FormatException('지원하지 않는 백업 버전입니다.');
    }
  }

  void _validateTablePresence(Map<String, Object?> rawTables) {
    for (final tableName in _tableOrder) {
      if (!rawTables.containsKey(tableName)) {
        throw FormatException('$tableName 데이터가 백업 파일에 없습니다.');
      }
    }
  }

  List<Map<String, Object?>> _readTableRows(Object? rawRows, String tableName) {
    if (rawRows == null) {
      return [];
    }
    if (rawRows is! List<Object?>) {
      throw FormatException('$tableName 데이터가 올바르지 않습니다.');
    }

    final allowedColumns = _tableColumns[tableName]!;
    final requiredColumns = _requiredColumns[tableName]!;
    return rawRows.map((rawRow) {
      if (rawRow is! Map<String, Object?>) {
        throw FormatException('$tableName 행 데이터가 올바르지 않습니다.');
      }

      final row = Map<String, Object?>.fromEntries(
        rawRow.entries.where((entry) => allowedColumns.contains(entry.key)),
      );
      for (final columnName in requiredColumns) {
        if (!row.containsKey(columnName) || row[columnName] == null) {
          throw FormatException('$tableName.$columnName 값이 필요합니다.');
        }
      }

      return _normalizeRow(tableName, row);
    }).toList();
  }

  Map<String, Object?> _normalizeRow(
    String tableName,
    Map<String, Object?> row,
  ) {
    final normalized = Map<String, Object?>.from(row);
    final integerColumns = _integerColumns[tableName] ?? const {};
    final numberColumns = _numberColumns[tableName] ?? const {};

    for (final entry in normalized.entries.toList()) {
      final columnName = entry.key;
      final value = entry.value;

      if (columnName == 'id' && !_isNonEmptyString(value)) {
        throw FormatException('$tableName.id 값이 올바르지 않습니다.');
      }

      if (integerColumns.contains(columnName) && value != null) {
        normalized[columnName] = _normalizeInteger(
          value,
          '$tableName.$columnName',
        );
      }

      if (numberColumns.contains(columnName) && value != null) {
        normalized[columnName] = _normalizeNumber(
          value,
          '$tableName.$columnName',
        );
      }
    }

    return normalized;
  }

  int _normalizeInteger(Object? value, String fieldName) {
    if (value is bool) {
      return value ? 1 : 0;
    }
    if (value is int) {
      return value;
    }
    if (value is num && value == value.roundToDouble()) {
      return value.toInt();
    }

    throw FormatException('$fieldName 값은 정수여야 합니다.');
  }

  double _normalizeNumber(Object? value, String fieldName) {
    if (value is num) {
      return value.toDouble();
    }

    throw FormatException('$fieldName 값은 숫자여야 합니다.');
  }

  Future<void> _ensureReferencedUsers(
    Database db,
    Map<String, List<Map<String, Object?>>> rowsByTable,
  ) async {
    final existingUserIds = await _getExistingIds(db, 'users');
    final importedUsers = rowsByTable['users']!;
    final importedUserIds = importedUsers
        .map((row) => row['id'])
        .whereType<String>()
        .toSet();
    final referencedUserIds = <String>{
      ...rowsByTable['recipes']!
          .map((row) => row['authorId'])
          .whereType<String>(),
      ...rowsByTable['recipe_versions']!
          .map((row) => row['authorId'])
          .whereType<String>(),
      ...rowsByTable['cooking_logs']!
          .map((row) => row['authorId'])
          .whereType<String>(),
    };
    final now = DateTime.now().toUtc().toIso8601String();

    for (final userId in referencedUserIds) {
      if (existingUserIds.contains(userId) ||
          importedUserIds.contains(userId)) {
        continue;
      }

      importedUsers.add({
        'id': userId,
        'username': LocalUserPolicy.syntheticUsernameFor(userId),
        'avatarUrl': null,
        'createdAt': now,
        'updatedAt': now,
        'isDeleted': 0,
      });
      importedUserIds.add(userId);
    }
  }

  Future<void> _validateRelationships(
    Database db,
    Map<String, List<Map<String, Object?>>> rowsByTable,
  ) async {
    final userIds = {
      ...await _getExistingIds(db, 'users'),
      ..._idsFromRows(rowsByTable['users']!),
    };
    final recipeIds = {
      ...await _getExistingIds(db, 'recipes'),
      ..._idsFromRows(rowsByTable['recipes']!),
    };
    final versionIds = {
      ...await _getExistingIds(db, 'recipe_versions'),
      ..._idsFromRows(rowsByTable['recipe_versions']!),
    };

    for (final row in rowsByTable['recipes']!) {
      _requireReference(userIds, row['authorId'], 'recipes.authorId');
      _requireReference(
        versionIds,
        row['latestVersionId'],
        'recipes.latestVersionId',
      );
    }

    for (final row in rowsByTable['recipe_versions']!) {
      _requireReference(recipeIds, row['recipeId'], 'recipe_versions.recipeId');
      _requireReference(userIds, row['authorId'], 'recipe_versions.authorId');
      final baseVersionId = row['baseVersionId'];
      if (baseVersionId != null) {
        _requireReference(
          versionIds,
          baseVersionId,
          'recipe_versions.baseVersionId',
        );
      }
    }

    for (final row in rowsByTable['ingredients']!) {
      _requireReference(
        versionIds,
        row['recipeVersionId'],
        'ingredients.recipeVersionId',
      );
    }

    for (final row in rowsByTable['steps']!) {
      _requireReference(
        versionIds,
        row['recipeVersionId'],
        'steps.recipeVersionId',
      );
    }

    for (final row in rowsByTable['cooking_logs']!) {
      _requireReference(
        versionIds,
        row['recipeVersionId'],
        'cooking_logs.recipeVersionId',
      );
      _requireReference(userIds, row['authorId'], 'cooking_logs.authorId');
    }
  }

  Future<Set<String>> _getExistingIds(Database db, String tableName) async {
    final rows = await db.query(tableName, columns: ['id']);
    return rows.map((row) => row['id']).whereType<String>().toSet();
  }

  Set<String> _idsFromRows(List<Map<String, Object?>> rows) {
    return rows.map((row) => row['id']).whereType<String>().toSet();
  }

  void _requireReference(
    Set<String> allowedIds,
    Object? value,
    String fieldName,
  ) {
    if (!_isNonEmptyString(value) || !allowedIds.contains(value)) {
      throw FormatException('$fieldName 참조가 올바르지 않습니다.');
    }
  }

  bool _isNonEmptyString(Object? value) {
    return value is String && value.trim().isNotEmpty;
  }

  RecipeBackupSummary _summaryFromDocument(Object? decoded) {
    if (decoded is! Map<String, Object?>) {
      return const RecipeBackupSummary();
    }
    final rawTables = decoded['tables'];
    final rawStepImages = decoded['stepImages'];
    if (rawTables is! Map<String, Object?>) {
      return const RecipeBackupSummary();
    }

    int rowCount(String tableName) {
      final rows = rawTables[tableName];
      return rows is List<Object?> ? rows.length : 0;
    }

    return RecipeBackupSummary(
      recipes: rowCount('recipes'),
      versions: rowCount('recipe_versions'),
      ingredients: rowCount('ingredients'),
      steps: rowCount('steps'),
      cookingLogs: rowCount('cooking_logs'),
      stepImages: rawStepImages is List<Object?> ? rawStepImages.length : 0,
    );
  }

  String _buildBackupFileName(DateTime now) {
    String twoDigits(int value) => value.toString().padLeft(2, '0');
    final date = [
      now.year.toString(),
      twoDigits(now.month),
      twoDigits(now.day),
    ].join();
    final time = [
      twoDigits(now.hour),
      twoDigits(now.minute),
      twoDigits(now.second),
    ].join();

    return 'recipick_backup_${date}_$time.json';
  }

  String _sanitizeFileName(String fileName) {
    return fileName.replaceAll(RegExp(r'[^A-Za-z0-9._-]'), '_');
  }
}

class RecipeBackupExportResult {
  const RecipeBackupExportResult({required this.file, required this.summary});

  final File file;
  final RecipeBackupSummary summary;
}

class RecipeBackupImportResult {
  const RecipeBackupImportResult({
    required this.recipes,
    required this.versions,
    required this.ingredients,
    required this.steps,
    required this.cookingLogs,
    required this.restoredStepImages,
    required this.skippedStepImages,
  });

  final int recipes;
  final int versions;
  final int ingredients;
  final int steps;
  final int cookingLogs;
  final int restoredStepImages;
  final int skippedStepImages;
}

class RecipeBackupSummary {
  const RecipeBackupSummary({
    this.recipes = 0,
    this.versions = 0,
    this.ingredients = 0,
    this.steps = 0,
    this.cookingLogs = 0,
    this.stepImages = 0,
  });

  final int recipes;
  final int versions;
  final int ingredients;
  final int steps;
  final int cookingLogs;
  final int stepImages;
}

class _RestoredStepImages {
  const _RestoredStepImages({
    this.pathByOriginalPath = const {},
    this.restoredPaths = const [],
    this.restoredCount = 0,
    this.skippedCount = 0,
  });

  final Map<String, String> pathByOriginalPath;
  final List<String> restoredPaths;
  final int restoredCount;
  final int skippedCount;
}

class _ResolvedStepImageRows {
  const _ResolvedStepImageRows({
    required this.rows,
    required this.skippedCount,
  });

  final List<Map<String, Object?>> rows;
  final int skippedCount;
}
