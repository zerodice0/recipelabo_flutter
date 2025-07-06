import 'package:recipick_flutter/domain/repositories/timer_preset_repository.dart';

/// 커스텀 타이머 프리셋 삭제 유스케이스
class DeleteCustomPresetUsecase {
  final TimerPresetRepository _repository;

  DeleteCustomPresetUsecase(this._repository);

  /// 커스텀 프리셋 삭제
  /// 반환값: true(삭제 성공), false(기본 프리셋이거나 삭제 실패)
  Future<bool> call(String presetId) async {
    return await _repository.deletePreset(presetId);
  }
}
