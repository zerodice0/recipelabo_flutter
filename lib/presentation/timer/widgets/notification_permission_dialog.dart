import 'package:flutter/material.dart';
import 'package:recipick_flutter/core/config/app_colors.dart';

/// 알림 권한 요청 다이얼로그
/// 타이머 기능 사용 시 권한이 필요한 이유를 설명하고 권한을 요청합니다.
class NotificationPermissionDialog extends StatelessWidget {
  final VoidCallback? onAllow;
  final VoidCallback? onDeny;
  final VoidCallback? onSettings;

  const NotificationPermissionDialog({
    super.key,
    this.onAllow,
    this.onDeny,
    this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.notifications_active,
              color: AppColors.warmWhite,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              '알림 권한 필요',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textBrown,
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 기능 설명
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.lightCream.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.accent.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.timer, color: AppColors.primaryOrange, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      '타이머 기능을 위해 필요합니다',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBrown,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '• 요리 시간이 완료되면 알림으로 알려드립니다\n'
                  '• 앱이 백그라운드에 있어도 놓치지 않습니다\n'
                  '• 완벽한 요리를 위한 필수 기능입니다',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textBrown.withValues(alpha: 0.8),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 선택사항 안내
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.supportGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.supportGreen.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppColors.supportGreen,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '알림을 허용하지 않아도 타이머는 사용할 수 있지만, 완료 알림을 받을 수 없습니다.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.supportGreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // 설정 안내
          if (onSettings != null)
            GestureDetector(
              onTap: onSettings,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: AppColors.primaryOrange,
                      size: 14,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '나중에 설정에서 변경할 수 있습니다',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryOrange,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      actions: [
        // 거부 버튼
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
            onDeny?.call();
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColors.textBrown.withValues(alpha: 0.7),
          ),
          child: const Text('나중에'),
        ),

        // 허용 버튼
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop(true);
            onAllow?.call();
          },
          icon: const Icon(Icons.notifications_active, size: 18),
          label: const Text('알림 허용'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryOrange,
            foregroundColor: AppColors.warmWhite,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
      ],
    );
  }

  /// 다이얼로그 표시 헬퍼 메서드
  static Future<bool?> show(
    BuildContext context, {
    VoidCallback? onAllow,
    VoidCallback? onDeny,
    VoidCallback? onSettings,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // 백그라운드 탭으로 닫기 방지
      builder: (context) => NotificationPermissionDialog(
        onAllow: onAllow,
        onDeny: onDeny,
        onSettings: onSettings,
      ),
    );
  }
}
