import 'package:flutter/material.dart';
import 'package:recipick_flutter/core/config/app_colors.dart';
import 'package:recipick_flutter/core/services/alarm_timer_service.dart';
import 'package:recipick_flutter/domain/entities/cooking_timer_entity.dart';
import 'package:recipick_flutter/domain/entities/step_entity.dart';
import 'package:uuid/uuid.dart';

/// 타이머가 포함된 조리 단계 위젯
/// 레시피 상세보기나 요리 중에 사용됩니다.
class StepWithTimerWidget extends StatefulWidget {
  final StepEntity step;
  final bool isEditing;
  final Function(StepEntity)? onStepChanged;
  final VoidCallback? onRemove;

  const StepWithTimerWidget({
    super.key,
    required this.step,
    this.isEditing = false,
    this.onStepChanged,
    this.onRemove,
  });

  @override
  State<StepWithTimerWidget> createState() => _StepWithTimerWidgetState();
}

class _StepWithTimerWidgetState extends State<StepWithTimerWidget> {
  final AlarmTimerService _timerService = AlarmTimerService();
  late TextEditingController _descriptionController;
  late TextEditingController _timerNameController;
  int _timerMinutes = 0;
  int _timerSeconds = 0;
  bool _showTimerSettings = false;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController(
      text: widget.step.description,
    );
    _timerNameController = TextEditingController(
      text: widget.step.timerName ?? '',
    );
    _timerMinutes = widget.step.timerMinutes ?? 0;
    _timerSeconds = widget.step.timerSeconds ?? 0;
    _showTimerSettings =
        widget.step.timerMinutes != null || widget.step.timerSeconds != null;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _timerNameController.dispose();
    super.dispose();
  }

  void _updateStep() {
    if (widget.onStepChanged != null) {
      widget.onStepChanged!(
        widget.step.copyWith(
          description: _descriptionController.text,
          timerMinutes:
              _showTimerSettings && (_timerMinutes > 0 || _timerSeconds > 0)
              ? _timerMinutes
              : null,
          timerSeconds:
              _showTimerSettings && (_timerMinutes > 0 || _timerSeconds > 0)
              ? _timerSeconds
              : null,
          timerName: _showTimerSettings && _timerNameController.text.isNotEmpty
              ? _timerNameController.text
              : null,
        ),
      );
    }
  }

  Future<void> _startTimer() async {
    if (widget.step.timerMinutes == null && widget.step.timerSeconds == null) {
      return;
    }

    const uuid = Uuid();
    final totalSeconds =
        ((widget.step.timerMinutes ?? 0) * 60) +
        (widget.step.timerSeconds ?? 0);

    if (totalSeconds <= 0) return;

    final timer = CookingTimerEntity(
      id: uuid.v4(),
      name: widget.step.timerName ?? '조리 단계 ${widget.step.stepNumber}',
      totalSeconds: totalSeconds,
      remainingSeconds: totalSeconds,
      startTime: DateTime.now(),
      status: TimerStatus.running,
      description: widget.step.description,
      stepId: widget.step.id,
    );

    // 권한 확인 후 타이머 시작
    await _startTimerWithPermissionCheck(timer);
  }

  /// 권한 확인 후 타이머 시작
  Future<void> _startTimerWithPermissionCheck(CookingTimerEntity timer) async {
    // 현재 권한 상태 확인
    final hasPermission = await _timerService.checkNotificationPermission();

    if (!hasPermission && mounted) {
      // 권한이 없으면 권한 요청
      final granted = await _timerService.requestNotificationPermission();

      if (granted && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('알림이 활성화되었습니다.'),
            backgroundColor: AppColors.supportGreen,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }

    // 타이머 시작 (권한과 관계없이)
    if (mounted) {
      await _timerService.startTimer(timer, context);
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${timer.name} 타이머가 시작되었습니다'),
          backgroundColor: AppColors.supportGreen,
        ),
      );
    }
  }

  String _formatTime(int minutes, int seconds) {
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasTimer =
        (widget.step.timerMinutes ?? 0) > 0 ||
        (widget.step.timerSeconds ?? 0) > 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: hasTimer
              ? AppColors.primaryOrange.withValues(alpha: 0.3)
              : AppColors.accent.withValues(alpha: 0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: (hasTimer ? AppColors.primaryOrange : AppColors.accent)
                .withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 단계 헤더
            Row(
              children: [
                // 단계 번호
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: hasTimer
                        ? AppColors.primaryOrange
                        : AppColors.accent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.step.stepNumber}',
                      style: const TextStyle(
                        color: AppColors.warmWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // 타이머 정보
                if (hasTimer) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryOrange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.primaryOrange.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.timer,
                          size: 16,
                          color: AppColors.primaryOrange,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatTime(
                            widget.step.timerMinutes ?? 0,
                            widget.step.timerSeconds ?? 0,
                          ),
                          style: TextStyle(
                            color: AppColors.primaryOrange,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                ],

                const Spacer(),

                // 액션 버튼들
                if (widget.isEditing) ...[
                  IconButton(
                    icon: Icon(
                      _showTimerSettings ? Icons.timer_off : Icons.timer,
                      color: _showTimerSettings
                          ? AppColors.primaryOrange
                          : AppColors.textBrown.withValues(alpha: 0.6),
                    ),
                    onPressed: () {
                      setState(() {
                        _showTimerSettings = !_showTimerSettings;
                      });
                    },
                    tooltip: _showTimerSettings ? '타이머 제거' : '타이머 추가',
                  ),
                  if (widget.onRemove != null)
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: theme.colorScheme.error,
                      ),
                      onPressed: widget.onRemove,
                      tooltip: '단계 삭제',
                    ),
                ] else if (hasTimer) ...[
                  ElevatedButton.icon(
                    onPressed: _startTimer,
                    icon: const Icon(Icons.play_arrow, size: 18),
                    label: const Text('타이머 시작'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryOrange,
                      foregroundColor: AppColors.warmWhite,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(height: 16),

            // 단계 설명
            if (widget.isEditing) ...[
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: '조리 단계 설명',
                  hintText: '예: 팬에 올리브오일을 두르고 중불에서 2분간 가열하세요',
                ),
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                onChanged: (_) => _updateStep(),
              ),
            ] else ...[
              Text(
                widget.step.description,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textBrown,
                  height: 1.5,
                ),
              ),
            ],

            // 타이머 설정 (편집 모드)
            if (widget.isEditing && _showTimerSettings) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightCream.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.accent.withValues(alpha: 0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '타이머 설정',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBrown,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // 타이머 이름
                    TextField(
                      controller: _timerNameController,
                      decoration: const InputDecoration(
                        labelText: '타이머 이름 (선택사항)',
                        hintText: '예: 볶기, 삶기, 굽기',
                        isDense: true,
                      ),
                      onChanged: (_) => _updateStep(),
                    ),
                    const SizedBox(height: 12),

                    // 시간 설정
                    Row(
                      children: [
                        // 분
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('분', style: theme.textTheme.bodySmall),
                              const SizedBox(height: 4),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.accent.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove, size: 18),
                                      onPressed: _timerMinutes > 0
                                          ? () {
                                              setState(() => _timerMinutes--);
                                              _updateStep();
                                            }
                                          : null,
                                    ),
                                    Expanded(
                                      child: Text(
                                        _timerMinutes.toString().padLeft(
                                          2,
                                          '0',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                              fontFamily: 'monospace',
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add, size: 18),
                                      onPressed: _timerMinutes < 99
                                          ? () {
                                              setState(() => _timerMinutes++);
                                              _updateStep();
                                            }
                                          : null,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),

                        // 초
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('초', style: theme.textTheme.bodySmall),
                              const SizedBox(height: 4),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.accent.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove, size: 18),
                                      onPressed: _timerSeconds > 0
                                          ? () {
                                              setState(() => _timerSeconds--);
                                              _updateStep();
                                            }
                                          : null,
                                    ),
                                    Expanded(
                                      child: Text(
                                        _timerSeconds.toString().padLeft(
                                          2,
                                          '0',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                              fontFamily: 'monospace',
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add, size: 18),
                                      onPressed: _timerSeconds < 59
                                          ? () {
                                              setState(() => _timerSeconds++);
                                              _updateStep();
                                            }
                                          : null,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
