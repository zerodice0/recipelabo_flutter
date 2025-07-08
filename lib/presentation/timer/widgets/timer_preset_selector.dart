import 'package:flutter/material.dart';
import 'package:recipick_flutter/core/config/app_colors.dart';
import 'package:recipick_flutter/core/config/responsive_helper.dart';
import 'package:recipick_flutter/domain/entities/timer_preset_entity.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';

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

  /// 기본 프리셋 이름을 다국어 키로 변환
  String _getLocalizedPresetName(
    BuildContext context,
    TimerPresetEntity preset,
  ) {
    if (!preset.isDefault) {
      return preset.name; // 커스텀 프리셋은 원래 이름 사용
    }

    final localizations = AppLocalizations.of(context);

    switch (preset.name) {
      case '파스타 면 삶기':
        return localizations.timerPresetPastaCooking;
      case '달걀 완숙':
        return localizations.timerPresetHardBoiledEgg;
      case '달걀 반숙':
        return localizations.timerPresetSoftBoiledEgg;
      case '라면 끓이기':
        return localizations.timerPresetInstantNoodle;
      case '차 우리기':
        return localizations.timerPresetTeaBrewing;
      case '스테이크 굽기 (미디엄)':
        return localizations.timerPresetSteakMedium;
      case '밥 뜸들이기':
        return localizations.timerPresetRiceSteaming;
      case '빵 굽기 예열':
        return localizations.timerPresetOvenPreheating;
      case '쿠키 굽기':
        return localizations.timerPresetCookieBaking;
      case '찜 요리':
        return localizations.timerPresetSteaming;
      default:
        return preset.name; // fallback
    }
  }

  /// 기본 프리셋 설명을 다국어 키로 변환
  String? _getLocalizedPresetDescription(
    BuildContext context,
    TimerPresetEntity preset,
  ) {
    if (!preset.isDefault) {
      return preset.description; // 커스텀 프리셋은 원래 설명 사용
    }

    final localizations = AppLocalizations.of(context);

    switch (preset.name) {
      case '파스타 면 삶기':
        return localizations.timerPresetPastaCookingDesc;
      case '달걀 완숙':
        return localizations.timerPresetHardBoiledEggDesc;
      case '달걀 반숙':
        return localizations.timerPresetSoftBoiledEggDesc;
      case '라면 끓이기':
        return localizations.timerPresetInstantNoodleDesc;
      case '차 우리기':
        return localizations.timerPresetTeaBrewingDesc;
      case '스테이크 굽기 (미디엄)':
        return localizations.timerPresetSteakMediumDesc;
      case '밥 뜸들이기':
        return localizations.timerPresetRiceSteamingDesc;
      case '빵 굽기 예열':
        return localizations.timerPresetOvenPreheatingDesc;
      case '쿠키 굽기':
        return localizations.timerPresetCookieBakingDesc;
      case '찜 요리':
        return localizations.timerPresetSteamingDesc;
      default:
        return preset.description; // fallback
    }
  }

  void _showDeleteDialog(BuildContext context, TimerPresetEntity preset) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          AppLocalizations.of(context).timerPresetDelete,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textBrown,
          ),
        ),
        content: Text(
          AppLocalizations.of(
            context,
          ).timerPresetDeleteConfirm(_getLocalizedPresetName(context, preset)),
          style: TextStyle(color: AppColors.textBrown),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.textBrown.withValues(alpha: 0.7),
            ),
            child: Text(AppLocalizations.of(context).actionCancel),
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
            child: Text(AppLocalizations.of(context).actionDelete),
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
          padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSpacing * 2,
            vertical: context.responsiveSpacing,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).timerFrequentlyUsed,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textBrown,
                  fontSize: context.responsiveTextSize + 2,
                ),
              ),
              if (onAddCustomTimer != null)
                TextButton.icon(
                  onPressed: onAddCustomTimer,
                  icon: Icon(Icons.add, size: context.responsiveIconSize * 0.9),
                  label: Text(AppLocalizations.of(context).timerCustom),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryOrange,
                  ),
                ),
            ],
          ),
        ),

        // 프리셋 그리드
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.responsiveSpacing),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ResponsiveHelper.getGridCrossAxisCount(
                context,
                mobile: 2,
                tablet: 3,
                desktop: 4,
              ),
              childAspectRatio: ResponsiveHelper.getGridChildAspectRatio(
                context,
                mobile: 1.6,
                tablet: 1.8,
                desktop: 2.0,
              ),
              crossAxisSpacing: context.responsiveSpacing,
              mainAxisSpacing: context.responsiveSpacing,
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
                      padding: EdgeInsets.all(context.responsiveSpacing * 1.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // 아이콘, 시간, 삭제 버튼
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(
                                  context.responsiveSpacing,
                                ),
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  _getPresetIcon(preset.icon),
                                  color: AppColors.warmWhite,
                                  size: context.responsiveIconSize,
                                ),
                              ),

                              // 유연한 공간 분배
                              SizedBox(width: context.responsiveSpacing),

                              // 커스텀 프리셋인 경우 삭제 버튼 표시
                              if (!preset.isDefault && onPresetDeleted != null)
                                GestureDetector(
                                  onTap: () =>
                                      _showDeleteDialog(context, preset),
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      context.responsiveSpacing * 0.5,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      size: context.responsiveIconSize * 0.8,
                                      color: AppColors.textBrown.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                  ),
                                ),

                              const Spacer(),

                              // 시간 표시를 Flexible로 감싸서 오버플로우 방지
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.responsiveSpacing,
                                    vertical: context.responsiveSpacing * 0.5,
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
                                      fontSize:
                                          context.responsiveTextSize * 0.9,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: context.responsiveSpacing),

                          // 타이머 이름과 설명을 Expanded로 감싸서 유연하게 처리
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _getLocalizedPresetName(context, preset),
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textBrown,
                                    fontSize: context.responsiveTextSize,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(height: 2),

                                // 사용 횟수 (기본 프리셋이 아닌 경우)
                                if (!preset.isDefault && preset.usageCount > 0)
                                  Text(
                                    AppLocalizations.of(context).unitUsedTimes(
                                      preset.usageCount.toString(),
                                    ),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: AppColors.textBrown.withValues(
                                        alpha: 0.6,
                                      ),
                                      fontSize:
                                          context.responsiveTextSize * 0.8,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                else if (_getLocalizedPresetDescription(
                                      context,
                                      preset,
                                    ) !=
                                    null)
                                  Text(
                                    _getLocalizedPresetDescription(
                                      context,
                                      preset,
                                    )!,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: AppColors.textBrown.withValues(
                                        alpha: 0.6,
                                      ),
                                      fontSize:
                                          context.responsiveTextSize * 0.8,
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
