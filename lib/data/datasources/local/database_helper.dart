import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'saucerer.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id TEXT PRIMARY KEY,
        username TEXT NOT NULL,
        avatarUrl TEXT,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL,
        isDeleted INTEGER NOT NULL DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE recipes(
        id TEXT PRIMARY KEY,
        authorId TEXT NOT NULL,
        latestVersionId TEXT NOT NULL,
        name TEXT NOT NULL,
        description TEXT,
        isPublic INTEGER NOT NULL DEFAULT 1,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL,
        isDeleted INTEGER NOT NULL DEFAULT 0,
        FOREIGN KEY (authorId) REFERENCES users(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE recipe_versions(
        id TEXT PRIMARY KEY,
        recipeId TEXT NOT NULL,
        versionNumber INTEGER NOT NULL,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        authorId TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        isDeleted INTEGER NOT NULL DEFAULT 0,
        FOREIGN KEY (recipeId) REFERENCES recipes(id),
        FOREIGN KEY (authorId) REFERENCES users(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE ingredients(
        id TEXT PRIMARY KEY,
        recipeVersionId TEXT NOT NULL,
        name TEXT NOT NULL,
        quantity REAL NOT NULL,
        unit TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL,
        isDeleted INTEGER NOT NULL DEFAULT 0,
        FOREIGN KEY (recipeVersionId) REFERENCES recipe_versions(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE steps(
        id TEXT PRIMARY KEY,
        recipeVersionId TEXT NOT NULL,
        stepNumber INTEGER NOT NULL,
        description TEXT NOT NULL,
        imageUrl TEXT,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL,
        isDeleted INTEGER NOT NULL DEFAULT 0,
        FOREIGN KEY (recipeVersionId) REFERENCES recipe_versions(id)
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Drop existing tables and recreate with new schema
      await db.execute('DROP TABLE IF EXISTS ingredients');
      await db.execute('DROP TABLE IF EXISTS steps');
      await db.execute('DROP TABLE IF EXISTS recipe_versions');
      await db.execute('DROP TABLE IF EXISTS recipes');
      await db.execute('DROP TABLE IF EXISTS users');
      
      // Recreate tables with new schema
      await _onCreate(db, newVersion);
    }
  }
}
