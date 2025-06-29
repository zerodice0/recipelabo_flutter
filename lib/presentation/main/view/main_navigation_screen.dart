import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saucerer_flutter/presentation/recipe/list/view/recipe_list_screen.dart';
import 'package:saucerer_flutter/presentation/search/view/ingredient_search_screen.dart';
import 'package:saucerer_flutter/presentation/timer/view/timer_screen.dart';
import 'package:saucerer_flutter/presentation/main/viewmodel/main_navigation_viewmodel.dart';
import 'package:saucerer_flutter/core/services/timer_service.dart';
import 'package:saucerer_flutter/core/config/app_colors.dart';

class MainNavigationScreen extends ConsumerWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(mainNavigationViewModelProvider);
    final viewModel = ref.read(mainNavigationViewModelProvider.notifier);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          RecipeListScreen(),
          IngredientSearchScreen(),
          TimerScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: viewModel.setIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: '레시피',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: '타이머'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
        ],
      ),
    );
  }
}

// 프로필/설정 화면
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('설정'), automaticallyImplyLeading: false),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 사용자 정보 섹션
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '사용자',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '로컬 사용자',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // 관리 섹션
          Text(
            '관리',
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.spa),
                  title: const Text('조미료 관리'),
                  subtitle: const Text('조미료 추가, 수정, 삭제'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    context.push('/settings/seasonings');
                  },
                ),
                const Divider(height: 1),
                _NotificationSettingsTile(),
                // const Divider(height: 1),
                // ListTile(
                //   leading: const Icon(Icons.merge_type),
                //   title: const Text('재료 병합'),
                //   subtitle: const Text('중복된 재료 정리'),
                //   trailing: const Icon(Icons.chevron_right),
                //   onTap: () {
                //     // TODO: 재료 병합 화면 구현
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(content: Text('준비 중인 기능입니다')),
                //     );
                //   },
                // ),
                const Divider(height: 1),
                _BackgroundAppRefreshTile(),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // 앱 정보 섹션
          Text(
            '앱 정보',
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('버전'),
                  subtitle: const Text('1.0.0'),
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text('라이선스'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    showLicensePage(context: context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 알림 설정 타일
class _NotificationSettingsTile extends ConsumerStatefulWidget {
  @override
  ConsumerState<_NotificationSettingsTile> createState() =>
      _NotificationSettingsTileState();
}

class _NotificationSettingsTileState
    extends ConsumerState<_NotificationSettingsTile> {
  final TimerService _timerService = TimerService();
  bool _hasPermission = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    setState(() => _isLoading = true);
    final hasPermission = await _timerService.checkNotificationPermission();
    setState(() {
      _hasPermission = hasPermission;
      _isLoading = false;
    });
  }

  Future<void> _togglePermission() async {
    if (_hasPermission) {
      // 이미 권한이 있는 경우 안내 다이얼로그 표시
      _showPermissionInfoDialog();
    } else {
      // 권한이 없는 경우 요청
      setState(() => _isLoading = true);
      final granted = await _timerService.requestNotificationPermission();

      setState(() {
        _hasPermission = granted;
        _isLoading = false;
      });

      if (granted && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('타이머 알림이 활성화되었습니다'),
            backgroundColor: AppColors.supportGreen,
          ),
        );
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('알림 권한이 거부되었습니다. 시스템 설정에서 수동으로 활성화할 수 있습니다'),
            backgroundColor: AppColors.primaryOrange,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }

  void _showPermissionInfoDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              children: [
                Icon(
                  Icons.notifications_active,
                  color: AppColors.supportGreen,
                  size: 24,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    '알림 설정',
                    style: TextStyle(
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
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.supportGreen.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.supportGreen.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: AppColors.supportGreen,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          '타이머 알림이 활성화되어 있습니다',
                          style: TextStyle(
                            color: AppColors.supportGreen,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  '알림을 끄고 싶다면:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBrown,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '1. 아이폰 설정 앱 열기\n'
                  '2. 알림 > Saucerer 선택\n'
                  '3. 알림 허용 끄기',
                  style: TextStyle(color: AppColors.textBrown, height: 1.4),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.lightCream.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.primaryOrange,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      const Expanded(
                        child: Text(
                          '알림을 끄면 타이머 완료 시 알림을 받을 수 없습니다',
                          style: TextStyle(
                            color: AppColors.primaryOrange,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryOrange,
                  foregroundColor: AppColors.warmWhite,
                ),
                child: const Text('확인'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        _hasPermission ? Icons.notifications_active : Icons.notifications_off,
        color:
            _hasPermission
                ? AppColors.supportGreen
                : AppColors.textBrown.withValues(alpha: 0.6),
      ),
      title: const Text('타이머 알림'),
      subtitle: Text(
        _hasPermission ? '타이머 완료 시 알림을 받습니다' : '타이머 완료 알림을 받으려면 권한이 필요합니다',
      ),
      trailing:
          _isLoading
              ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
              : Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color:
                      _hasPermission
                          ? AppColors.supportGreen.withValues(alpha: 0.1)
                          : AppColors.primaryOrange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color:
                        _hasPermission
                            ? AppColors.supportGreen.withValues(alpha: 0.3)
                            : AppColors.primaryOrange.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  _hasPermission ? '활성화됨' : '비활성화됨',
                  style: TextStyle(
                    color:
                        _hasPermission
                            ? AppColors.supportGreen
                            : AppColors.primaryOrange,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      onTap: _togglePermission,
    );
  }
}

/// 백그라운드 앱 새로고침 설정 안내 타일
class _BackgroundAppRefreshTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // iOS에서만 표시
    if (!Platform.isIOS) {
      return const SizedBox.shrink();
    }

    return ListTile(
      leading: Icon(Icons.refresh, color: AppColors.primaryOrange),
      title: const Text('백그라운드 앱 새로고침'),
      subtitle: const Text('타이머 알림이 정확히 작동하도록 설정'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        _showBackgroundRefreshDialog(context);
      },
    );
  }

  void _showBackgroundRefreshDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.refresh,
                    color: AppColors.warmWhite,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    '백그라운드 앱 새로고침',
                    style: TextStyle(
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
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.lightCream.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.accent.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: AppColors.primaryOrange,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '타이머 알림을 놓치지 마세요',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textBrown,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'iOS에서 백그라운드 앱 새로고침이 꺼져있으면:\n'
                        '• 앱이 백그라운드에 있을 때 타이머가 정확히 작동하지 않을 수 있습니다\n'
                        '• 타이머 완료 알림이 늦게 오거나 오지 않을 수 있습니다\n'
                        '• 앱을 다시 열어야 타이머 상태가 업데이트됩니다',
                        style: TextStyle(
                          color: AppColors.textBrown,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.supportGreen.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.supportGreen.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '설정 방법:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.supportGreen,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '1. 설정 앱 열기\n'
                        '2. 일반 > 백그라운드 앱 새로고침\n'
                        '3. 백그라운드 앱 새로고침 켜기\n'
                        '4. Saucerer 앱 새로고침 켜기',
                        style: TextStyle(
                          color: AppColors.supportGreen,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.textBrown.withValues(alpha: 0.7),
                ),
                child: const Text('확인'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('설정 앱에서 백그라운드 앱 새로고침을 활성화해주세요'),
                      backgroundColor: AppColors.primaryOrange,
                      duration: const Duration(seconds: 3),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryOrange,
                  foregroundColor: AppColors.warmWhite,
                ),
                child: const Text('설정 열기'),
              ),
            ],
          ),
    );
  }
}
