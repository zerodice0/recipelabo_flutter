import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saucerer_flutter/core/config/app_colors.dart';
import 'package:saucerer_flutter/core/services/timer_service.dart';
import 'package:saucerer_flutter/core/di/provider.dart';
import 'package:saucerer_flutter/domain/entities/cooking_timer_entity.dart';
import 'package:saucerer_flutter/domain/entities/timer_preset_entity.dart';
import 'package:saucerer_flutter/presentation/timer/widgets/timer_card_widget.dart';
import 'package:saucerer_flutter/presentation/timer/widgets/timer_preset_selector.dart';
import 'package:saucerer_flutter/presentation/timer/widgets/notification_permission_dialog.dart';
import 'package:uuid/uuid.dart';

/// 타이머 메인 화면
/// 프리셋 선택, 진행 중인 타이머 표시, 타이머 관리 기능을 제공합니다.
class TimerScreen extends ConsumerStatefulWidget {
  const TimerScreen({super.key});

  @override
  ConsumerState<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends ConsumerState<TimerScreen> {
  final TimerService _timerService = TimerService();
  List<TimerPresetEntity> _presets = [];

  @override
  void initState() {
    super.initState();
    _initializeTimer();
    _loadPresets();
  }

  Future<void> _initializeTimer() async {
    await _timerService.initialize();
    _timerService.addListener(_onTimerUpdate);
  }

  Future<void> _loadPresets() async {
    try {
      List<TimerPresetEntity> defaultPresets =
          await _initializeDefaultPresets();
      final presetFromRepository =
          await ref.read(getAllPresetsUsecaseProvider).call();

      final presets = [...defaultPresets, ...presetFromRepository];

      setState(() {
        _presets = presets;
      });
    } catch (e) {
      debugPrint('Failed to load presets: $e');
      // 실패 시 기본 프리셋들로 초기화
      await _initializeDefaultPresets();
    }
  }

  Future<List<TimerPresetEntity>> _initializeDefaultPresets() async {
    final defaultPresets = [
      TimerPresetEntity(
        id: '1',
        name: '파스타 면 삶기',
        durationMinutes: 7,
        durationSeconds: 0,
        description: '알덴테 파스타를 위한 표준 시간',
        icon: 'pasta',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '2',
        name: '달걀 완숙',
        durationMinutes: 8,
        durationSeconds: 0,
        description: '완전히 익힌 삶은 달걀',
        icon: 'egg',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '3',
        name: '달걀 반숙',
        durationMinutes: 6,
        durationSeconds: 0,
        description: '노른자가 부드러운 반숙 달걀',
        icon: 'egg',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '4',
        name: '라면 끓이기',
        durationMinutes: 3,
        durationSeconds: 0,
        description: '표준 라면 조리 시간',
        icon: 'noodles',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '5',
        name: '차 우리기',
        durationMinutes: 3,
        durationSeconds: 0,
        description: '홍차나 녹차 우리는 시간',
        icon: 'tea',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '6',
        name: '스테이크 굽기',
        durationMinutes: 4,
        durationSeconds: 0,
        description: '양면 각각 굽는 시간',
        icon: 'steak',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
    ];

    final repository = ref.read(timerPresetRepositoryProvider);
    for (final preset in defaultPresets) {
      try {
        await repository.addPreset(preset);
      } catch (e) {
        // 이미 존재하는 경우 무시
      }
    }

    return defaultPresets;
  }

  @override
  void dispose() {
    _timerService.removeListener(_onTimerUpdate);
    super.dispose();
  }

  void _onTimerUpdate() {
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _startTimerFromPreset(TimerPresetEntity preset) async {
    await _startTimerWithPermissionCheck(() {
      const uuid = Uuid();
      return CookingTimerEntity(
        id: uuid.v4(),
        name: preset.name,
        totalSeconds: preset.totalSeconds,
        remainingSeconds: preset.totalSeconds,
        startTime: DateTime.now(),
        status: TimerStatus.running,
        description: preset.description,
        icon: preset.icon,
      );
    });

    // 프리셋 사용 횟수 증가
    try {
      await ref.read(incrementPresetUsageUsecaseProvider).call(preset.id);
      _loadPresets(); // 프리셋 목록 새로고침
    } catch (e) {
      debugPrint('Failed to increment preset usage: $e');
    }
  }

  /// 권한 확인 후 타이머 시작
  Future<void> _startTimerWithPermissionCheck(
    CookingTimerEntity Function() timerFactory,
  ) async {
    // 현재 권한 상태 확인
    final hasPermission = await _timerService.checkNotificationPermission();

    if (!hasPermission && mounted) {
      // 권한이 없으면 다이얼로그 표시
      final shouldRequest = await NotificationPermissionDialog.show(
        context,
        onAllow: () async {
          // 권한 요청
          await _timerService.requestNotificationPermission();
        },
        onDeny: () {
          // 권한 거부 시 아무것도 하지 않음 (타이머는 시작하되 알림 없음)
        },
        onSettings: () {
          // 설정 화면으로 이동하는 로직 추가 가능
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('설정 > 알림에서 타이머 알림을 활성화할 수 있습니다'),
              duration: Duration(seconds: 3),
            ),
          );
        },
      );

      if (shouldRequest == true) {
        // 권한 요청 후 결과 확인
        final granted = await _timerService.requestNotificationPermission();

        if (granted && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('알림이 활성화되었습니다. 타이머 완료 시 알림을 받을 수 있습니다.'),
              backgroundColor: AppColors.supportGreen,
              duration: const Duration(seconds: 2),
            ),
          );
        } else if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                '알림 권한이 거부되었습니다. 타이머는 사용할 수 있지만 완료 알림은 받을 수 없습니다.',
              ),
              backgroundColor: AppColors.primaryOrange,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
    }

    // 타이머 시작 (권한과 관계없이)
    final timer = timerFactory();
    await _timerService.startTimer(timer);
  }

  void _showCustomTimerDialog() {
    showDialog(
      context: context,
      builder: (context) => _CustomTimerDialog(
        onTimerCreated: (timer) async {
          await _startTimerWithPermissionCheck(() => timer);
        },
        onPresetSaved: () {
          _loadPresets(); // 프리셋 목록 새로고침
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final runningTimers = _timerService.runningTimers;

    return Scaffold(
      appBar: AppBar(
        title: const Text('요리 타이머'),
        backgroundColor: AppColors.primaryOrange,
        foregroundColor: AppColors.warmWhite,
        actions: [
          // 노티피케이션 테스트 버튼
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () async {
              await _timerService.testNotification();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('테스트 노티피케이션을 전송했습니다'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            tooltip: '노티피케이션 테스트',
          ),
          if (_timerService.activeTimerCount > 0)
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.warmWhite.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${_timerService.activeTimerCount}개 진행중',
                style: const TextStyle(
                  color: AppColors.warmWhite,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 진행 중인 타이머들
            if (runningTimers.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '진행 중인 타이머',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBrown,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: runningTimers.length,
                itemBuilder: (context, index) {
                  final timer = runningTimers[index];
                  return TimerCardWidget(
                    timer: timer,
                    onPause: () => _timerService.pauseTimer(timer.id),
                    onResume: () => _timerService.resumeTimer(timer.id),
                    onStop: () => _timerService.stopTimer(timer.id),
                    onRemove: () => _timerService.removeTimer(timer.id),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],

            // 프리셋 선택기
            TimerPresetSelector(
              presets: _presets,
              onPresetSelected: _startTimerFromPreset,
              onAddCustomTimer: _showCustomTimerDialog,
              onPresetDeleted: (preset) async {
                final success = await ref
                    .read(deleteCustomPresetUsecaseProvider)
                    .call(preset.id);
                if (success && context.mounted) {
                  _loadPresets(); // 프리셋 목록 새로고침
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${preset.name} 프리셋이 삭제되었습니다'),
                      backgroundColor: AppColors.supportGreen,
                    ),
                  );
                } else if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('기본 프리셋은 삭제할 수 없습니다'),
                      backgroundColor: AppColors.primaryOrange,
                    ),
                  );
                }
              },
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: AppColors.primaryGradient,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryOrange.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: _showCustomTimerDialog,
          backgroundColor: Colors.transparent,
          elevation: 0,
          splashColor: AppColors.warmWhite.withValues(alpha: 0.2),
          icon: const Icon(
            Icons.add_alarm,
            color: AppColors.warmWhite,
            size: 24,
          ),
          label: const Text(
            '커스텀 타이머',
            style: TextStyle(
              color: AppColors.warmWhite,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

/// 커스텀 타이머 생성 다이얼로그
class _CustomTimerDialog extends ConsumerStatefulWidget {
  final Future<void> Function(CookingTimerEntity) onTimerCreated;
  final VoidCallback? onPresetSaved;

  const _CustomTimerDialog({required this.onTimerCreated, this.onPresetSaved});

  @override
  ConsumerState<_CustomTimerDialog> createState() => _CustomTimerDialogState();
}

class _CustomTimerDialogState extends ConsumerState<_CustomTimerDialog> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  int _minutes = 5;
  int _seconds = 0;
  bool _saveAsPreset = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _createTimer() async {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('타이머 이름을 입력해주세요')));
      return;
    }

    if (_minutes == 0 && _seconds == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('시간을 설정해주세요')));
      return;
    }

    const uuid = Uuid();
    final totalSeconds = (_minutes * 60) + _seconds;
    final name = _nameController.text.trim();
    final description = _descriptionController.text.trim().isEmpty
        ? null
        : _descriptionController.text.trim();

    // 프리셋으로 저장하는 경우
    if (_saveAsPreset) {
      try {
        final saveUsecase = ref.read(saveCustomPresetUsecaseProvider);
        final success = await saveUsecase.call(
          name: name,
          minutes: _minutes,
          seconds: _seconds,
          description: description,
          icon: 'timer',
        );

        if (!success && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('동일한 이름과 시간의 프리셋이 이미 존재합니다'),
              backgroundColor: AppColors.primaryOrange,
            ),
          );
          return;
        }

        // 프리셋 저장 성공 시 콜백 호출
        widget.onPresetSaved?.call();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$name 프리셋이 저장되었습니다'),
              backgroundColor: AppColors.supportGreen,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('프리셋 저장에 실패했습니다'),
              backgroundColor: AppColors.error,
            ),
          );
        }
        return;
      }
    }

    final timer = CookingTimerEntity(
      id: uuid.v4(),
      name: name,
      totalSeconds: totalSeconds,
      remainingSeconds: totalSeconds,
      startTime: DateTime.now(),
      status: TimerStatus.running,
      description: description,
    );

    if (mounted) {
      Navigator.of(context).pop();
    }
    await widget.onTimerCreated(timer);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: const Text('커스텀 타이머 생성'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 타이머 이름
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '타이머 이름',
                hintText: '예: 스프 끓이기',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 16),

            // 시간 설정
            Text(
              '시간 설정',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                // 분
                Expanded(
                  child: Column(
                    children: [
                      Text('분', style: theme.textTheme.bodySmall),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.accent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: _minutes > 0
                                  ? () => setState(() => _minutes--)
                                  : null,
                            ),
                            Expanded(
                              child: Text(
                                _minutes.toString().padLeft(2, '0'),
                                textAlign: TextAlign.center,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontFamily: 'monospace',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: _minutes < 99
                                  ? () => setState(() => _minutes++)
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
                    children: [
                      Text('초', style: theme.textTheme.bodySmall),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.accent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: _seconds > 0
                                  ? () => setState(() => _seconds--)
                                  : null,
                            ),
                            Expanded(
                              child: Text(
                                _seconds.toString().padLeft(2, '0'),
                                textAlign: TextAlign.center,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontFamily: 'monospace',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: _seconds < 59
                                  ? () => setState(() => _seconds++)
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

            const SizedBox(height: 16),

            // 설명 (선택사항)
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: '설명 (선택사항)',
                hintText: '타이머에 대한 메모',
              ),
              maxLines: 2,
            ),

            const SizedBox(height: 16),

            // 프리셋 저장 옵션
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.lightCream.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.accent.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: _saveAsPreset,
                    onChanged: (value) {
                      setState(() {
                        _saveAsPreset = value ?? false;
                      });
                    },
                    activeColor: AppColors.primaryOrange,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '프리셋으로 저장',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBrown,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '다음에도 사용할 수 있도록 저장합니다',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textBrown.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('취소'),
        ),
        ElevatedButton(onPressed: _createTimer, child: const Text('시작')),
      ],
    );
  }
}
