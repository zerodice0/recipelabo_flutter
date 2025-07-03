import 'package:flutter/material.dart';
import 'package:saucerer_flutter/core/config/app_colors.dart';
import 'package:saucerer_flutter/domain/entities/timer_preset_entity.dart';
import 'package:saucerer_flutter/l10n/app_localizations.dart';

/// 타이머 프리셋 선택 위젯
/// 자주 사용하는 타이머 프리셋을 그리드로 표시합니다.
class TimerPresetSelector extends StatelessWidget {
  final List<TimerPresetEntity> presets;
  final Function(TimerPresetEntity) onPresetSelected;
  final VoidCallback? onAddCustomTimer;
  final Function(TimerPresetEntity)? onPresetDeleted;

  const TimerPresetSelector({
    super.key,
    required this.presets,
    required this.onPresetSelected,
    this.onAddCustomTimer,
    this.onPresetDeleted,
  });

  IconData _getPresetIcon(String? iconName) {
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

  Color _getPresetColor(int index) {
    final colors = [
      AppColors.primaryOrange,
      AppColors.supportGreen,
      AppColors.accent,
      AppColors.primaryDark,
    ];
    return colors[index % colors.length];
  }

  void _showDeleteDialog(BuildContext context, TimerPresetEntity preset) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              '프리셋 삭제',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textBrown,
              ),
            ),
            content: Text(
              '${preset.name} 프리셋을 삭제하시겠습니까?\n삭제된 프리셋은 복구할 수 없습니다.',
              style: TextStyle(color: AppColors.textBrown),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.textBrown.withValues(alpha: 0.7),
                ),
                child: const Text('취소'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onPresetDeleted?.call(preset);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryOrange,
                  foregroundColor: AppColors.warmWhite,
                ),
                child: const Text('삭제'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 헤더
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '자주 사용하는 타이머',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textBrown,
                ),
              ),
              if (onAddCustomTimer != null)
                TextButton.icon(
                  onPressed: onAddCustomTimer,
                  icon: const Icon(Icons.add, size: 18),
                  label: Text(AppLocalizations.of(context).customTimer),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryOrange,
                  ),
                ),
            ],
          ),
        ),

        // 프리셋 그리드
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.6,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: presets.length,
            itemBuilder: (context, index) {
              final preset = presets[index];
              final color = _getPresetColor(index);

              return Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(16),
                shadowColor: color.withValues(alpha: 0.3),
                child: InkWell(
                  onTap: () => onPresetSelected(preset),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          color.withValues(alpha: 0.1),
                          color.withValues(alpha: 0.05),
                        ],
                      ),
                      border: Border.all(
                        color: color.withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // 아이콘, 시간, 삭제 버튼
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  _getPresetIcon(preset.icon),
                                  color: AppColors.warmWhite,
                                  size: 20,
                                ),
                              ),
                              const Spacer(),

                              // 커스텀 프리셋인 경우 삭제 버튼 표시
                              if (!preset.isDefault && onPresetDeleted != null)
                                GestureDetector(
                                  onTap:
                                      () => _showDeleteDialog(context, preset),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.close,
                                      size: 16,
                                      color: AppColors.textBrown.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                  ),
                                ),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: color.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  preset.formattedDuration,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: color,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'monospace',
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          // 타이머 이름과 설명을 Expanded로 감싸서 유연하게 처리
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  preset.name,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textBrown,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(height: 2),

                                // 사용 횟수 (기본 프리셋이 아닌 경우)
                                if (!preset.isDefault && preset.usageCount > 0)
                                  Text(
                                    AppLocalizations.of(context).usedTimes(preset.usageCount),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: AppColors.textBrown.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                else if (preset.description != null)
                                  Text(
                                    preset.description!,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: AppColors.textBrown.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
