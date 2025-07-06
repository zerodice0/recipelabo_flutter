import 'package:recipick_flutter/data/datasources/local/timer_preset_datasource.dart';
import 'package:recipick_flutter/domain/entities/timer_preset_entity.dart';
import 'package:recipick_flutter/domain/repositories/timer_preset_repository.dart';

/// 타이머 프리셋 레포지토리 구현체
class TimerPresetRepositoryImpl implements TimerPresetRepository {
  final TimerPresetDatasource _datasource;

  TimerPresetRepositoryImpl(this._datasource);

  @override
  Future<List<TimerPresetEntity>> getAllPresets() async {
    return await _datasource.getAllPresets();
  }

  @override
  Future<List<TimerPresetEntity>> getDefaultPresets() async {
    return await _datasource.getDefaultPresets();
  }

  @override
  Future<List<TimerPresetEntity>> getCustomPresets() async {
    return await _datasource.getCustomPresets();
  }

  @override
  Future<void> addPreset(TimerPresetEntity preset) async {
    await _datasource.insertPreset(preset);
  }

  @override
  Future<void> updatePreset(TimerPresetEntity preset) async {
    await _datasource.updatePreset(preset);
  }

  @override
  Future<bool> deletePreset(String presetId) async {
    return await _datasource.deletePreset(presetId);
  }

  @override
  Future<void> incrementUsage(String presetId) async {
    await _datasource.incrementUsage(presetId);
  }

  @override
  Future<TimerPresetEntity?> getPresetById(String presetId) async {
    return await _datasource.getPresetById(presetId);
  }

  @override
  Future<bool> presetExists(String name, int minutes, int seconds) async {
    return await _datasource.presetExists(name, minutes, seconds);
  }
}
