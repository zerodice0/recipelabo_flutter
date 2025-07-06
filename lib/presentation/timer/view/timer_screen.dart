import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipick_flutter/core/config/app_colors.dart';
import 'package:recipick_flutter/core/services/alarm_timer_service.dart';
import 'package:recipick_flutter/core/di/provider.dart';
import 'package:recipick_flutter/domain/entities/cooking_timer_entity.dart';
import 'package:recipick_flutter/domain/entities/timer_preset_entity.dart';
import 'package:recipick_flutter/presentation/timer/widgets/timer_card_widget.dart';
import 'package:recipick_flutter/presentation/timer/widgets/timer_preset_selector.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';

/// 타이머 메인 화면
/// 프리셋 선택, 진행 중인 타이머 표시, 타이머 관리 기능을 제공합니다.
class TimerScreen extends ConsumerStatefulWidget {
  const TimerScreen({super.key});

  @override
  ConsumerState<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends ConsumerState<TimerScreen> {
  final AlarmTimerService _timerService = AlarmTimerService();
  List<TimerPresetEntity> _presets = [];

  @override
  void initState() {
    super.initState();
    _initializeTimer();
    _loadPresets();
  }

  Future<void> _initializeTimer() async {
    // AlarmTimerService는 main.dart에서 이미 초기화됨
    _timerService.addListener(_onTimerUpdate);
  }

  Future<void> _loadPresets() async {
    try {
      debugPrint('=== TIMER PRESET LOADING DEBUG ===');
      debugPrint('Starting to load presets...');

      // 기본 프리셋을 데이터베이스에 초기화 (없는 경우만)
      await _initializeDefaultPresets();
      debugPrint('Default presets initialized in database');

      // 데이터베이스에서 모든 프리셋 조회
      final allPresets = await ref.read(getAllPresetsUsecaseProvider).call();
      debugPrint('All presets loaded from database: ${allPresets.length}');

      if (mounted) {
        setState(() {
          _presets = allPresets;
        });

        debugPrint('Presets set in state: ${_presets.length}');
        for (int i = 0; i < _presets.length; i++) {
          debugPrint(
            'Preset $i: ${_presets[i].name} (${_presets[i].formattedDuration})',
          );
        }
      }

      debugPrint('=== TIMER PRESET LOADING COMPLETE ===');
    } catch (e) {
      debugPrint('Failed to load presets: $e');
      debugPrint('Error type: ${e.runtimeType}');
      debugPrint('Stack trace: ${StackTrace.current}');

      // 실패 시 하드코딩된 기본 프리셋만 사용
      if (mounted) {
        try {
          final fallbackPresets = await _createHardcodedPresets();
          setState(() {
            _presets = fallbackPresets;
          });
          debugPrint('Fallback presets loaded: ${fallbackPresets.length}');
        } catch (fallbackError) {
          debugPrint('Fallback preset loading failed: $fallbackError');
        }
      }
    }
  }

  Future<void> _initializeDefaultPresets() async {
    if (!mounted) return;

    final l10n = AppLocalizations.of(context);
    final defaultPresets = [
      TimerPresetEntity(
        id: '1',
        name: l10n.timerPresetPastaCooking,
        durationMinutes: 7,
        durationSeconds: 0,
        description: l10n.timerPresetPastaCookingDescription,
        icon: 'pasta',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '2',
        name: l10n.timerPresetHardBoiledEgg,
        durationMinutes: 8,
        durationSeconds: 0,
        description: l10n.timerPresetHardBoiledEggDescription,
        icon: 'egg',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '3',
        name: l10n.timerPresetSoftBoiledEgg,
        durationMinutes: 6,
        durationSeconds: 0,
        description: l10n.timerPresetSoftBoiledEggDescription,
        icon: 'egg',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '4',
        name: l10n.timerPresetInstantNoodles,
        durationMinutes: 3,
        durationSeconds: 0,
        description: l10n.timerPresetInstantNoodlesDescription,
        icon: 'noodles',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '5',
        name: l10n.timerPresetTeaBrewing,
        durationMinutes: 3,
        durationSeconds: 0,
        description: l10n.timerPresetTeaBrewingDescription,
        icon: 'tea',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '6',
        name: l10n.timerPresetSteakCooking,
        durationMinutes: 4,
        durationSeconds: 0,
        description: l10n.timerPresetSteakCookingDescription,
        icon: 'steak',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
    ];

    final repository = ref.read(timerPresetRepositoryProvider);
    for (final preset in defaultPresets) {
      try {
        // 기존에 있는지 확인 후 추가
        final existing = await repository.getPresetById(preset.id);
        if (existing == null) {
          await repository.addPreset(preset);
          debugPrint('Added default preset: ${preset.name}');
        } else {
          debugPrint('Default preset already exists: ${preset.name}');
        }
      } catch (e) {
        debugPrint('Error adding preset ${preset.name}: $e');
      }
    }
  }

  Future<List<TimerPresetEntity>> _createHardcodedPresets() async {
    if (!mounted) return [];

    final l10n = AppLocalizations.of(context);
    return [
      TimerPresetEntity(
        id: '1',
        name: l10n.timerPresetPastaCooking,
        durationMinutes: 7,
        durationSeconds: 0,
        description: l10n.timerPresetPastaCookingDescription,
        icon: 'pasta',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '2',
        name: l10n.timerPresetHardBoiledEgg,
        durationMinutes: 8,
        durationSeconds: 0,
        description: l10n.timerPresetHardBoiledEggDescription,
        icon: 'egg',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '3',
        name: l10n.timerPresetSoftBoiledEgg,
        durationMinutes: 6,
        durationSeconds: 0,
        description: l10n.timerPresetSoftBoiledEggDescription,
        icon: 'egg',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '4',
        name: l10n.timerPresetInstantNoodles,
        durationMinutes: 3,
        durationSeconds: 0,
        description: l10n.timerPresetInstantNoodlesDescription,
        icon: 'noodles',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '5',
        name: l10n.timerPresetTeaBrewing,
        durationMinutes: 3,
        durationSeconds: 0,
        description: l10n.timerPresetTeaBrewingDescription,
        icon: 'tea',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
      TimerPresetEntity(
        id: '6',
        name: l10n.timerPresetSteakCooking,
        durationMinutes: 4,
        durationSeconds: 0,
        description: l10n.timerPresetSteakCookingDescription,
        icon: 'steak',
        createdAt: DateTime.now(),
        isDefault: true,
      ),
    ];
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
      // 권한이 없으면 권한 요청
      final granted = await _timerService.requestNotificationPermission();

      if (granted && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).notificationEnabled),
            backgroundColor: AppColors.supportGreen,
            duration: const Duration(seconds: 2),
          ),
        );
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context).notificationPermissionDenied,
            ),
            backgroundColor: AppColors.primaryOrange,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }

    // 타이머 시작 (권한과 관계없이)
    final timer = timerFactory();
    if (mounted) {
      await _timerService.startTimer(timer, context);
    }
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
    final l10n = AppLocalizations.of(context);
    final runningTimers = _timerService.runningTimers;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.timerNotificationChannelTitle),
        backgroundColor: AppColors.primaryOrange,
        foregroundColor: AppColors.warmWhite,
        actions: [
          // 노티피케이션 테스트 버튼
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () async {
              await _timerService.testAlarm(context);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(l10n.notificationTestSent),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
            tooltip: l10n.notificationTest,
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
                l10n.timerRunning(_timerService.activeTimerCount.toString()),
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
                  l10n.timerRunningList,
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
                    onPause: () async => await _timerService.pauseTimer(timer.id),
                    onResume: () async => await _timerService.resumeTimer(timer.id),
                    onStop: () async => await _timerService.stopTimer(timer.id),
                    onRemove: () async => await _timerService.removeTimer(timer.id),
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
                      content: Text(l10n.timerPresetDeleted(preset.name)),
                      backgroundColor: AppColors.supportGreen,
                    ),
                  );
                } else if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l10n.timerPresetCannotDeleteDefault),
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
          label: Text(
            l10n.timerCustom,
            style: const TextStyle(
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
    final l10n = AppLocalizations.of(context);

    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.timerNameRequired)));
      return;
    }

    if (_minutes == 0 && _seconds == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.timerTimeRequired)));
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
            SnackBar(
              content: Text(l10n.timerPresetAlreadyExists),
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
              content: Text(l10n.timerPresetSaved(name)),
              backgroundColor: AppColors.supportGreen,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.timerPresetSaveFailed),
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
    final l10n = AppLocalizations.of(context);

    return AlertDialog(
      title: Text(l10n.timerCreateCustom),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 타이머 이름
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: l10n.timerName,
                hintText: l10n.timerNameHint,
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 16),

            // 시간 설정
            Text(
              l10n.timerTimeSetting,
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
                      Text(l10n.timerMinutes, style: theme.textTheme.bodySmall),
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
                      Text(l10n.timerSeconds, style: theme.textTheme.bodySmall),
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
              decoration: InputDecoration(
                labelText: l10n.timerDescriptionOptional,
                hintText: l10n.timerDescriptionHint,
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
                          l10n.timerPresetSave,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBrown,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          l10n.timerPresetSaveDescription,
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
          child: Text(l10n.actionCancel),
        ),
        ElevatedButton(onPressed: _createTimer, child: Text(l10n.actionStart)),
      ],
    );
  }
}
