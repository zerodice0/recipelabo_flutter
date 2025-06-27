import 'package:saucerer_flutter/domain/entities/timer_preset_entity.dart';
import 'package:saucerer_flutter/domain/repositories/timer_preset_repository.dart';
import 'package:uuid/uuid.dart';

/// 커스텀 타이머 프리셋 저장 유스케이스
class SaveCustomPresetUsecase {
  final TimerPresetRepository _repository;
  final Uuid _uuid = const Uuid();

  SaveCustomPresetUsecase(this._repository);

  /// 새 커스텀 프리셋 저장
  /// 반환값: true(성공), false(중복 프리셋 존재)
  Future<bool> call({
    required String name,
    required int minutes,
    required int seconds,
    String? description,
    String? icon,
  }) async {
    // 중복 프리셋 체크
    final exists = await _repository.presetExists(name, minutes, seconds);
    if (exists) {
      return false;
    }

    final preset = TimerPresetEntity(
      id: _uuid.v4(),
      name: name,
      durationMinutes: minutes,
      durationSeconds: seconds,
      description: description,
      icon: icon ?? 'timer',
      createdAt: DateTime.now(),
      usageCount: 0,
      isDefault: false,
    );

    await _repository.addPreset(preset);
    return true;
  }
}