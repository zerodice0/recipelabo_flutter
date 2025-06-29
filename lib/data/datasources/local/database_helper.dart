import 'package:flutter/foundation.dart';
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
      version: 13,
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
        versionName TEXT,
        description TEXT NOT NULL,
        authorId TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        isDeleted INTEGER NOT NULL DEFAULT 0,
        changeLog TEXT,
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
        category_id TEXT NOT NULL DEFAULT 'ingredient',
        category TEXT,
        sub_category TEXT,
        description TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        usage_count INTEGER NOT NULL DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE timer_presets(
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        durationMinutes INTEGER NOT NULL,
        durationSeconds INTEGER NOT NULL,
        description TEXT,
        icon TEXT,
        createdAt TEXT NOT NULL,
        lastUsedAt TEXT,
        usageCount INTEGER NOT NULL DEFAULT 0,
        isDefault INTEGER NOT NULL DEFAULT 0
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
          category_id TEXT NOT NULL DEFAULT 'ingredient',
          category TEXT,
          sub_category TEXT,
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
        // 단위별 세부 카테고리 지정
        String subCategory = '기타';
        if (['g', 'kg', '그램', '킬로그램'].contains(unit)) {
          subCategory = '무게';
        } else if ([
          'mL',
          'L',
          '밀리리터',
          '리터',
          '컵',
          '큰술',
          '작은술',
          'T',
          't',
        ].contains(unit)) {
          subCategory = '부피';
        } else if (['개', '마리', '알', '쪽', '장', '봉지', '캔', '병'].contains(unit)) {
          subCategory = '개수';
        }

        await db.execute(
          '''
          INSERT OR IGNORE INTO seasonings (
            id, name, category_id, category, sub_category, description, created_at, updated_at, usage_count
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''',
          [
            '${unit}_unit_${DateTime.now().millisecondsSinceEpoch}',
            unit,
            'unit',
            '단위',
            subCategory,
            '기본 제공 단위',
            now,
            now,
            0,
          ],
        );
      }
    }

    if (oldVersion < 8) {
      // Add changeLog column to recipe_versions table
      await db.execute('''
        ALTER TABLE recipe_versions ADD COLUMN changeLog TEXT
      ''');
    }

    if (oldVersion < 9) {
      // Add timer_presets table
      await db.execute('''
        CREATE TABLE timer_presets(
          id TEXT PRIMARY KEY,
          name TEXT NOT NULL,
          durationMinutes INTEGER NOT NULL,
          durationSeconds INTEGER NOT NULL,
          description TEXT,
          icon TEXT,
          createdAt TEXT NOT NULL,
          lastUsedAt TEXT,
          usageCount INTEGER NOT NULL DEFAULT 0,
          isDefault INTEGER NOT NULL DEFAULT 0
        )
      ''');

      // Add default timer presets
      final now = DateTime.now().toIso8601String();
      final defaultTimers = [
        {
          'name': '파스타 면 삶기',
          'minutes': 7,
          'seconds': 0,
          'desc': '알덴테 파스타를 위한 표준 시간',
          'icon': 'pasta',
        },
        {
          'name': '달걀 완숙',
          'minutes': 8,
          'seconds': 0,
          'desc': '완전히 익힌 삶은 달걀',
          'icon': 'egg',
        },
        {
          'name': '달걀 반숙',
          'minutes': 6,
          'seconds': 0,
          'desc': '노른자가 부드러운 반숙 달걀',
          'icon': 'egg',
        },
        {
          'name': '라면 끓이기',
          'minutes': 3,
          'seconds': 0,
          'desc': '표준 라면 조리 시간',
          'icon': 'noodles',
        },
        {
          'name': '차 우리기',
          'minutes': 3,
          'seconds': 0,
          'desc': '홍차나 녹차 우리는 시간',
          'icon': 'tea',
        },
        {
          'name': '스테이크 굽기 (미디엄)',
          'minutes': 4,
          'seconds': 0,
          'desc': '양면 각각 굽는 시간',
          'icon': 'steak',
        },
        {
          'name': '밥 뜸들이기',
          'minutes': 10,
          'seconds': 0,
          'desc': '밥솥 밥이 완성된 후 뜸들이는 시간',
          'icon': 'rice',
        },
        {
          'name': '빵 굽기 예열',
          'minutes': 15,
          'seconds': 0,
          'desc': '오븐 예열 시간',
          'icon': 'oven',
        },
        {
          'name': '쿠키 굽기',
          'minutes': 12,
          'seconds': 0,
          'desc': '일반적인 쿠키 굽는 시간',
          'icon': 'cookie',
        },
        {
          'name': '찜 요리',
          'minutes': 20,
          'seconds': 0,
          'desc': '찜기에서 찌는 기본 시간',
          'icon': 'steam',
        },
      ];

      for (final timer in defaultTimers) {
        await db.execute(
          '''
          INSERT INTO timer_presets (
            id, name, durationMinutes, durationSeconds, description, icon, 
            createdAt, usageCount, isDefault
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''',
          [
            'default_${(timer['name'] as String).replaceAll(' ', '_')}_${DateTime.now().millisecondsSinceEpoch}',
            timer['name'],
            timer['minutes'],
            timer['seconds'],
            timer['desc'],
            timer['icon'],
            now,
            0,
            1, // isDefault = true
          ],
        );
      }
    }

    if (oldVersion < 10) {
      // Add category_id column to seasonings table and migrate existing data
      await db.execute(
        'ALTER TABLE seasonings ADD COLUMN category_id TEXT DEFAULT "ingredient"',
      );

      // Ensure all rows have a category_id value
      await db.execute(
        'UPDATE seasonings SET category_id = "ingredient" WHERE category_id IS NULL',
      );

      // Migrate existing category data to category_id
      await db.execute('''
        UPDATE seasonings SET category_id = CASE
          WHEN category = '재료' THEN 'ingredient'
          WHEN category = '단위' THEN 'unit'
          WHEN category = '양념' THEN 'seasoning'
          WHEN category = '채소' THEN 'vegetable'
          WHEN category = '육류' THEN 'meat'
          WHEN category = '해산물' THEN 'seafood'
          WHEN category = '유제품' THEN 'dairy'
          WHEN category = '곡물' THEN 'grain'
          ELSE 'ingredient'
        END
      ''');

      // Add NOT NULL constraint by recreating the table
      await db.execute('''
        CREATE TABLE seasonings_new(
          id TEXT PRIMARY KEY,
          name TEXT NOT NULL UNIQUE,
          category_id TEXT NOT NULL DEFAULT 'ingredient',
          category TEXT,
          description TEXT,
          created_at TEXT NOT NULL,
          updated_at TEXT NOT NULL,
          usage_count INTEGER NOT NULL DEFAULT 0
        )
      ''');

      // Copy data with proper column mapping and ensure category_id is not null
      await db.execute('''
        INSERT INTO seasonings_new (
          id, name, category_id, category, description, created_at, updated_at, usage_count
        )
        SELECT 
          id, name, 
          COALESCE(category_id, 'ingredient') as category_id,
          category, description, created_at, updated_at, usage_count
        FROM seasonings
      ''');

      await db.execute('DROP TABLE seasonings');
      await db.execute('ALTER TABLE seasonings_new RENAME TO seasonings');

      // Add versionName column to recipe_versions table
      await db.execute(
        'ALTER TABLE recipe_versions ADD COLUMN versionName TEXT',
      );
    }

    if (oldVersion < 11) {
      // Version 11: Clean up any remaining data consistency issues
      // This version is mainly for fixing any migration issues from version 10

      // Ensure all seasonings have proper category_id
      await db.execute(
        'UPDATE seasonings SET category_id = "ingredient" WHERE category_id IS NULL OR category_id = ""',
      );
    }

    if (oldVersion < 12) {
      // Version 12: Add sub_category column to seasonings table
      await db.execute('ALTER TABLE seasonings ADD COLUMN sub_category TEXT');

      // Migrate existing unit data to have proper sub_category
      await db.execute('''
        UPDATE seasonings SET sub_category = CASE
          WHEN name IN ('g', 'kg', '그램', '킬로그램') THEN '무게'
          WHEN name IN ('mL', 'L', '밀리리터', '리터', '컵', '큰술', '작은술', 'T', 't') THEN '부피'
          WHEN name IN ('개', '마리', '알', '쪽', '장', '봉지', '캔', '병') THEN '개수'
          ELSE '기타'
        END
        WHERE category_id = 'unit' AND sub_category IS NULL
      ''');
    }

    if (oldVersion < 13) {
      // Version 13: Ensure versionName column exists in recipe_versions table
      // This handles cases where the column might be missing due to schema inconsistencies
      try {
        await db.execute(
          'ALTER TABLE recipe_versions ADD COLUMN versionName TEXT',
        );
      } catch (e) {
        // Column might already exist, ignore the error
        debugPrint('versionName column might already exist: $e');
      }
    }
  }
}
