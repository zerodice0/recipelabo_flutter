import 'package:saucerer_flutter/domain/repositories/timer_preset_repository.dart';

/// 타이머 프리셋 사용 횟수 증가 유스케이스
class IncrementPresetUsageUsecase {
  final TimerPresetRepository _repository;

  IncrementPresetUsageUsecase(this._repository);

  Future<void> call(String presetId) async {
    await _repository.incrementUsage(presetId);
  }
}