import 'package:go_router/go_router.dart';
import 'package:recipick_flutter/presentation/recipe/detail/view/recipe_detail_screen.dart';
import 'package:recipick_flutter/presentation/recipe/edit/view/recipe_edit_screen.dart';
import 'package:recipick_flutter/presentation/search/view/ingredient_search_screen.dart';
import 'package:recipick_flutter/presentation/cooking_log/create/view/cooking_log_create_screen.dart';
import 'package:recipick_flutter/presentation/main/view/main_navigation_screen.dart';
import 'package:recipick_flutter/presentation/seasoning/view/seasoning_management_screen.dart';
import 'package:recipick_flutter/presentation/timer/view/timer_screen.dart';
import 'package:recipick_flutter/presentation/splash/splash_screen.dart';

// 라우트 경로 상수
class AppRoutes {
  static const splash = '/';
  static const main = '/main';
  static const recipeList = '/recipes';
  static const recipeDetail = '/recipes/:id';
  static const recipeCreate = '/recipes/create';
  static const recipeEdit = '/recipes/:id/edit';
  static const search = '/search';
  static const cookingLogCreate = '/recipes/:id/cooking-log';
  static const seasoningManagement = '/settings/seasonings';
  static const timer = '/timer';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    // 스플래시 화면
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    // 메인 네비게이션 화면 (바대 네비게이션 포함)
    GoRoute(
      path: AppRoutes.main,
      builder: (context, state) => const MainNavigationScreen(),
    ),

    // 레시피 생성 화면 (더 구체적인 경로를 먼저 선언)
    GoRoute(
      path: AppRoutes.recipeCreate,
      builder: (context, state) => const RecipeEditScreen(),
    ),

    // 레시피 상세 화면
    GoRoute(
      path: AppRoutes.recipeDetail,
      builder: (context, state) {
        final recipeId = state.pathParameters['id']!;
        return RecipeDetailScreen(recipeId: recipeId);
      },
    ),

    // 레시피 편집 화면
    GoRoute(
      path: AppRoutes.recipeEdit,
      builder: (context, state) {
        final recipeId = state.pathParameters['id']!;
        final versionId = state.uri.queryParameters['versionId'];
        return RecipeEditScreen(recipeId: recipeId, versionId: versionId);
      },
    ),

    // 쿠킹 로그 생성 화면
    GoRoute(
      path: AppRoutes.cookingLogCreate,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;

        return CookingLogCreateScreen(
          recipeVersionId: extra?['recipeVersionId'] ?? '',
          recipeName: extra?['recipeName'] ?? '',
          versionName: extra?['versionName'] ?? '',
        );
      },
    ),

    // 재료 검색 화면
    GoRoute(
      path: AppRoutes.search,
      builder: (context, state) => const IngredientSearchScreen(),
    ),

    // 조미료 관리 화면
    GoRoute(
      path: AppRoutes.seasoningManagement,
      builder: (context, state) => const SeasoningManagementScreen(),
    ),

    // 타이머 화면
    GoRoute(
      path: AppRoutes.timer,
      builder: (context, state) => const TimerScreen(),
    ),
  ],
);
