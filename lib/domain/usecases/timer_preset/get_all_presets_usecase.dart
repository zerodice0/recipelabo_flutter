import 'package:saucerer_flutter/domain/entities/timer_preset_entity.dart';
import 'package:saucerer_flutter/domain/repositories/timer_preset_repository.dart';

/// 모든 타이머 프리셋 조회 유스케이스
class GetAllPresetsUsecase {
  final TimerPresetRepository _repository;

  GetAllPresetsUsecase(this._repository);

  Future<List<TimerPresetEntity>> call() async {
    return await _repository.getAllPresets();
  }
}