import 'package:sqflite/sqflite.dart';
import 'package:saucerer_flutter/data/datasources/local/database_helper.dart';
import 'package:saucerer_flutter/domain/entities/timer_preset_entity.dart';

/// 타이머 프리셋 로컬 데이터소스
/// 기본 프리셋과 사용자 커스텀 프리셋을 관리합니다.
class TimerPresetDatasource {
  final DatabaseHelper _dbHelper;
  
  TimerPresetDatasource(this._dbHelper);

  /// 모든 프리셋 조회 (기본 + 사용자 커스텀)
  Future<List<TimerPresetEntity>> getAllPresets() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'timer_presets',
      orderBy: 'isDefault DESC, lastUsedAt DESC, usageCount DESC, createdAt ASC',
    );

    return List.generate(maps.length, (i) {
      return TimerPresetEntity.fromMap(maps[i]);
    });
  }

  /// 기본 프리셋만 조회
  Future<List<TimerPresetEntity>> getDefaultPresets() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'timer_presets',
      where: 'isDefault = ?',
      whereArgs: [1],
      orderBy: 'createdAt ASC',
    );

    return List.generate(maps.length, (i) {
      return TimerPresetEntity.fromMap(maps[i]);
    });
  }

  /// 사용자 커스텀 프리셋만 조회
  Future<List<TimerPresetEntity>> getCustomPresets() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'timer_presets',
      where: 'isDefault = ?',
      whereArgs: [0],
      orderBy: 'lastUsedAt DESC, usageCount DESC, createdAt DESC',
    );

    return List.generate(maps.length, (i) {
      return TimerPresetEntity.fromMap(maps[i]);
    });
  }

  /// 프리셋 추가
  Future<void> insertPreset(TimerPresetEntity preset) async {
    final db = await _dbHelper.database;
    await db.insert(
      'timer_presets',
      preset.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// 프리셋 업데이트
  Future<void> updatePreset(TimerPresetEntity preset) async {
    final db = await _dbHelper.database;
    await db.update(
      'timer_presets',
      preset.toMap(),
      where: 'id = ?',
      whereArgs: [preset.id],
    );
  }

  /// 프리셋 삭제 (기본 프리셋은 삭제 불가)
  Future<bool> deletePreset(String presetId) async {
    final db = await _dbHelper.database;
    
    // 기본 프리셋인지 확인
    final List<Map<String, dynamic>> preset = await db.query(
      'timer_presets',
      where: 'id = ? AND isDefault = ?',
      whereArgs: [presetId, 1],
    );
    
    // 기본 프리셋은 삭제 불가
    if (preset.isNotEmpty) {
      return false;
    }
    
    // 사용자 커스텀 프리셋 삭제
    final result = await db.delete(
      'timer_presets',
      where: 'id = ?',
      whereArgs: [presetId],
    );
    
    return result > 0;
  }

  /// 프리셋 사용 횟수 증가 및 최근 사용 시간 업데이트
  Future<void> incrementUsage(String presetId) async {
    final db = await _dbHelper.database;
    final now = DateTime.now().toIso8601String();
    
    await db.rawUpdate('''
      UPDATE timer_presets 
      SET usageCount = usageCount + 1, lastUsedAt = ? 
      WHERE id = ?
    ''', [now, presetId]);
  }

  /// ID로 프리셋 조회
  Future<TimerPresetEntity?> getPresetById(String presetId) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'timer_presets',
      where: 'id = ?',
      whereArgs: [presetId],
    );

    if (maps.isNotEmpty) {
      return TimerPresetEntity.fromMap(maps.first);
    }
    return null;
  }

  /// 프리셋 존재 여부 확인
  Future<bool> presetExists(String name, int minutes, int seconds) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'timer_presets',
      where: 'name = ? AND durationMinutes = ? AND durationSeconds = ?',
      whereArgs: [name, minutes, seconds],
    );

    return maps.isNotEmpty;
  }
}