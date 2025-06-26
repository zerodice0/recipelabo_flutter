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
      version: 7,
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

    await db.execute('''
      CREATE TABLE cooking_logs(
        id TEXT PRIMARY KEY,
        recipeVersionId TEXT NOT NULL,
        authorId TEXT NOT NULL,
        title TEXT NOT NULL,
        memo TEXT,
        imageUrl TEXT,
        cookedAt TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL,
        isDeleted INTEGER NOT NULL DEFAULT 0,
        FOREIGN KEY (recipeVersionId) REFERENCES recipe_versions(id),
        FOREIGN KEY (authorId) REFERENCES users(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE seasonings(
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL UNIQUE,
        category TEXT,
        description TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        usage_count INTEGER NOT NULL DEFAULT 0
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
    
    if (oldVersion < 3) {
      // Add cooking_logs table
      await db.execute('''
        CREATE TABLE cooking_logs(
          id TEXT PRIMARY KEY,
          recipeVersionId TEXT NOT NULL,
          authorId TEXT NOT NULL,
          title TEXT NOT NULL,
          memo TEXT,
          imageUrl TEXT,
          cookedAt TEXT NOT NULL,
          createdAt TEXT NOT NULL,
          updatedAt TEXT NOT NULL,
          isDeleted INTEGER NOT NULL DEFAULT 0,
          FOREIGN KEY (recipeVersionId) REFERENCES recipe_versions(id),
          FOREIGN KEY (authorId) REFERENCES users(id)
        )
      ''');
    }
    
    if (oldVersion < 4) {
      // Add seasonings table
      await db.execute('''
        CREATE TABLE seasonings(
          id TEXT PRIMARY KEY,
          name TEXT NOT NULL UNIQUE,
          category TEXT,
          description TEXT,
          created_at TEXT NOT NULL,
          updated_at TEXT NOT NULL,
          usage_count INTEGER NOT NULL DEFAULT 0
        )
      ''');
    }
    
    if (oldVersion < 7) {
      // Add default units to seasonings table
      final now = DateTime.now().toIso8601String();
      final defaultUnits = [
        // 무게 단위
        'g', 'kg', '그램', '킬로그램',
        // 부피 단위
        'mL', 'L', '밀리리터', '리터',
        '컵', '큰술', '작은술', 'T', 't',
        // 개수 단위
        '개', '마리', '알', '쪽', '장', '봉지', '캔', '병',
        // 기타 단위
        '꼬집', '조금', '적당량', '한줌',
      ];
      
      for (final unit in defaultUnits) {
        await db.execute('''
          INSERT OR IGNORE INTO seasonings (
            id, name, category, description, created_at, updated_at, usage_count
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          '${unit}_unit_${DateTime.now().millisecondsSinceEpoch}',
          unit,
          '단위',
          '기본 제공 단위',
          now,
          now,
          0,
        ]);
      }
    }
  }
}
