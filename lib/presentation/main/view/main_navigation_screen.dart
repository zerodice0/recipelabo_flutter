import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saucerer_flutter/presentation/recipe/list/view/recipe_list_screen.dart';
import 'package:saucerer_flutter/presentation/search/view/ingredient_search_screen.dart';
import 'package:saucerer_flutter/presentation/main/viewmodel/main_navigation_viewmodel.dart';

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
          RecipeListScreen(showAppBar: false),
          IngredientSearchScreen(showAppBar: false),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '프로필',
          ),
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
      appBar: AppBar(
        title: const Text('설정'),
        automaticallyImplyLeading: false,
      ),
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
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '로컬 사용자',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
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
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
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
                ListTile(
                  leading: const Icon(Icons.merge_type),
                  title: const Text('재료 병합'),
                  subtitle: const Text('중복된 재료 정리'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: 재료 병합 화면 구현
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('준비 중인 기능입니다')),
                    );
                  },
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // 앱 정보 섹션
          Text(
            '앱 정보',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
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