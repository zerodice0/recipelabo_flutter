import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> setUpIsolatedSqfliteFfiDatabaseFactory(String name) async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final databasePath = p.join(
    Directory.current.path,
    '.dart_tool',
    'test_databases',
    name,
  );
  final directory = Directory(databasePath);
  if (await directory.exists()) {
    await directory.delete(recursive: true);
  }
  await directory.create(recursive: true);

  await databaseFactory.setDatabasesPath(databasePath);
}
