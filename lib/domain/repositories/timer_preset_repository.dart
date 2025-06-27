import 'package:saucerer_flutter/domain/entities/timer_preset_entity.dart';

/// 타이머 프리셋 레포지토리 인터페이스
abstract class TimerPresetRepository {
  /// 모든 프리셋 조회 (기본 + 사용자 커스텀)
  Future<List<TimerPresetEntity>> getAllPresets();

  /// 기본 프리셋만 조회
  Future<List<TimerPresetEntity>> getDefaultPresets();

  /// 사용자 커스텀 프리셋만 조회
  Future<List<TimerPresetEntity>> getCustomPresets();

  /// 프리셋 추가
  Future<void> addPreset(TimerPresetEntity preset);

  /// 프리셋 업데이트
  Future<void> updatePreset(TimerPresetEntity preset);

  /// 프리셋 삭제 (기본 프리셋은 삭제 불가)
  Future<bool> deletePreset(String presetId);

  /// 프리셋 사용 횟수 증가 및 최근 사용 시간 업데이트
  Future<void> incrementUsage(String presetId);

  /// ID로 프리셋 조회
  Future<TimerPresetEntity?> getPresetById(String presetId);

  /// 중복 프리셋 체크
  Future<bool> presetExists(String name, int minutes, int seconds);
}