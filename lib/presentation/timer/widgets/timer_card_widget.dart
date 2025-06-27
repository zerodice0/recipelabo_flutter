import 'package:flutter/material.dart';
import 'package:saucerer_flutter/core/config/app_colors.dart';
import 'package:saucerer_flutter/domain/entities/cooking_timer_entity.dart';

/// 타이머 카드 위젯
/// 진행 중인 타이머를 시각적으로 표시합니다.
class TimerCardWidget extends StatelessWidget {
  final CookingTimerEntity timer;
  final VoidCallback? onPause;
  final VoidCallback? onResume;
  final VoidCallback? onStop;
  final VoidCallback? onRemove;

  const TimerCardWidget({
    super.key,
    required this.timer,
    this.onPause,
    this.onResume,
    this.onStop,
    this.onRemove,
  });

  IconData _getTimerIcon(String? iconName) {
    switch (iconName) {
      case 'pasta':
        return Icons.restaurant;
      case 'egg':
        return Icons.egg;
      case 'noodles':
        return Icons.ramen_dining;
      case 'tea':
        return Icons.local_cafe;
      case 'steak':
        return Icons.set_meal;
      case 'rice':
        return Icons.rice_bowl;
      case 'oven':
        return Icons.microwave;
      case 'cookie':
        return Icons.cookie;
      case 'steam':
        return Icons.cloud;
      default:
        return Icons.timer;
    }
  }

  Color _getStatusColor() {
    switch (timer.status) {
      case TimerStatus.running:
        return AppColors.supportGreen;
      case TimerStatus.paused:
        return AppColors.primaryOrange;
      case TimerStatus.completed:
        return AppColors.success;
      case TimerStatus.cancelled:
        return AppColors.error;
    }
  }

  String _getStatusText() {
    switch (timer.status) {
      case TimerStatus.running:
        return '진행 중';
      case TimerStatus.paused:
        return '일시정지';
      case TimerStatus.completed:
        return '완료';
      case TimerStatus.cancelled:
        return '취소됨';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = _getStatusColor();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        elevation: timer.isRunning ? 6 : 3,
        borderRadius: BorderRadius.circular(16),
        shadowColor: statusColor.withValues(alpha: 0.3),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.colorScheme.surface,
                statusColor.withValues(alpha: 0.05),
              ],
            ),
            border: Border.all(
              color: statusColor.withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 헤더 행
                Row(
                  children: [
                    // 타이머 아이콘
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: statusColor.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        _getTimerIcon(timer.icon),
                        color: AppColors.warmWhite,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // 타이머 정보
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            timer.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textBrown,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: statusColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              _getStatusText(),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: statusColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 액션 버튼들
                    if (timer.isCompleted ||
                        timer.status == TimerStatus.cancelled)
                      IconButton(
                        icon: Icon(Icons.close, color: theme.colorScheme.error),
                        onPressed: onRemove,
                        tooltip: '제거',
                      )
                    else ...[
                      if (timer.isRunning)
                        IconButton(
                          icon: Icon(
                            Icons.pause,
                            color: AppColors.primaryOrange,
                          ),
                          onPressed: onPause,
                          tooltip: '일시정지',
                        )
                      else if (timer.isPaused)
                        IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            color: AppColors.supportGreen,
                          ),
                          onPressed: onResume,
                          tooltip: '재개',
                        ),
                      IconButton(
                        icon: Icon(Icons.stop, color: theme.colorScheme.error),
                        onPressed: onStop,
                        tooltip: '정지',
                      ),
                    ],
                  ],
                ),

                const SizedBox(height: 20),

                // 진행 바
                if (!timer.isCompleted) ...[
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: timer.progress,
                            minHeight: 8,
                            backgroundColor: statusColor.withValues(alpha: 0.2),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              statusColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '${(timer.progress * 100).toInt()}%',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],

                // 시간 정보
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 남은 시간
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          timer.isCompleted ? '완료!' : '남은 시간',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textBrown.withValues(alpha: 0.7),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          timer.isCompleted
                              ? '00:00'
                              : timer.formattedRemainingTime,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color:
                                timer.isCompleted
                                    ? AppColors.success
                                    : statusColor,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),

                    // 전체 시간
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '전체 시간',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textBrown.withValues(alpha: 0.7),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          timer.formattedTotalTime,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBrown.withValues(alpha: 0.8),
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // 설명 (있는 경우)
                if (timer.description != null &&
                    timer.description!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.lightCream.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      timer.description!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textBrown.withValues(alpha: 0.8),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
