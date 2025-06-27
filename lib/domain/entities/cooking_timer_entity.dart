import 'package:freezed_annotation/freezed_annotation.dart';

part 'cooking_timer_entity.freezed.dart';

/// 진행 중인 요리 타이머를 나타내는 엔티티
@freezed
class CookingTimerEntity with _$CookingTimerEntity {
  const factory CookingTimerEntity({
    required String id,
    required String name, // 타이머 이름
    required int totalSeconds, // 전체 시간 (초)
    required int remainingSeconds, // 남은 시간 (초)
    required DateTime startTime, // 시작 시간
    DateTime? endTime, // 종료 시간 (계산된 값)
    required TimerStatus status,
    String? description,
    String? icon,
    String? recipeId, // 연결된 레시피 ID (선택사항)
    String? stepId, // 연결된 조리 단계 ID (선택사항)
  }) = _CookingTimerEntity;

  const CookingTimerEntity._();

  /// 타이머가 완료되었는지 확인
  bool get isCompleted => remainingSeconds <= 0;

  /// 타이머가 진행 중인지 확인
  bool get isRunning => status == TimerStatus.running;

  /// 타이머가 일시정지되었는지 확인
  bool get isPaused => status == TimerStatus.paused;

  /// 진행률 (0.0 ~ 1.0)
  double get progress {
    if (totalSeconds <= 0) return 1.0;
    return (totalSeconds - remainingSeconds) / totalSeconds;
  }

  /// 남은 시간을 "MM:SS" 형식으로 포맷
  String get formattedRemainingTime {
    final minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  /// 전체 시간을 "MM:SS" 형식으로 포맷
  String get formattedTotalTime {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  /// 계산된 종료 시간
  DateTime get calculatedEndTime {
    return endTime ?? startTime.add(Duration(seconds: totalSeconds));
  }
}

/// 타이머 상태
enum TimerStatus {
  running,    // 진행 중
  paused,     // 일시정지
  completed,  // 완료
  cancelled,  // 취소됨
}