import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipick_flutter/l10n/app_localizations.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _imageAnimationController;
  late AnimationController _textAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  // 텍스트 애니메이션들
  late Animation<double> _recipeOpacity;
  late Animation<double> _pickOpacity;
  late Animation<double> _mergeAnimation;
  late Animation<double> _recipickOpacity;
  late Animation<double> _finalNameOpacity;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimationSequence();
  }

  void _setupAnimations() {
    // 이미지 애니메이션 (짧게)
    _imageAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // 텍스트 애니메이션 (길게)
    _textAnimationController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _imageAnimationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _imageAnimationController,
        curve: const Interval(0.2, 1.0, curve: Curves.elasticOut),
      ),
    );

    // 텍스트 애니메이션 단계별 설정 (더 자연스러운 타이밍)
    _recipeOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: const Interval(0.0, 0.12, curve: Curves.easeIn),
      ),
    );

    _pickOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: const Interval(0.18, 0.3, curve: Curves.easeIn),
      ),
    );

    _mergeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: const Interval(0.35, 0.55, curve: Curves.easeInOut),
      ),
    );

    _recipickOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: const Interval(0.6, 0.75, curve: Curves.easeIn),
      ),
    );

    _finalNameOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: const Interval(0.8, 1.0, curve: Curves.easeIn),
      ),
    );
  }

  Future<void> _startAnimationSequence() async {
    // 이미지 애니메이션 시작
    _imageAnimationController.forward();

    // 0.8초 후 텍스트 애니메이션 시작
    await Future.delayed(const Duration(milliseconds: 800));
    _textAnimationController.forward();

    // 전체 애니메이션 완료 후 네비게이션 (4000ms + 500ms 여유)
    await Future.delayed(const Duration(milliseconds: 4500));
    if (mounted) {
      context.go('/main');
    }
  }

  @override
  void dispose() {
    _imageAnimationController.dispose();
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizedAppName = AppLocalizations.of(context).appName;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surfaceContainerHighest,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // 메인 이미지
              AnimatedBuilder(
                animation: _imageAnimationController,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/main_image2.jpeg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primaryContainer,
                                child: Icon(
                                  Icons.restaurant_menu,
                                  size: 80,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 48),

              // 어원 애니메이션과 앱 이름
              SizedBox(
                height: 120,
                child: AnimatedBuilder(
                  animation: _textAnimationController,
                  builder: (context, child) {
                    return _buildTextAnimation(context, localizedAppName);
                  },
                ),
              ),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextAnimation(BuildContext context, String localizedAppName) {
    final textStyle = Theme.of(context).textTheme.headlineLarge?.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
    );

    final smallTextStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.8,
    );

    // 단계별 애니메이션 표시
    return Stack(
      alignment: Alignment.center,
      children: [
        // 1단계: "Recipe" 표시
        if (_recipeOpacity.value > 0 && _mergeAnimation.value < 0.5)
          Opacity(
            opacity: _recipeOpacity.value * (1 - _mergeAnimation.value * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Recipe", style: smallTextStyle),
                const SizedBox(width: 8),
                if (_pickOpacity.value > 0)
                  Opacity(
                    opacity: _pickOpacity.value,
                    child: Text("Pick", style: smallTextStyle),
                  ),
              ],
            ),
          ),

        // 2단계: 합쳐지는 애니메이션 중 "Recipick" 등장
        if (_mergeAnimation.value > 0 && _recipickOpacity.value < 1)
          Opacity(
            opacity: _mergeAnimation.value,
            child: Transform.scale(
              scale: 0.9 + (_mergeAnimation.value * 0.1),
              child: Text("Recipick", style: textStyle),
            ),
          ),

        // 3단계: 완성된 "Recipick" 표시
        if (_recipickOpacity.value > 0 && _finalNameOpacity.value < 0.5)
          Opacity(
            opacity: _recipickOpacity.value * (1 - _finalNameOpacity.value * 2),
            child: Text("Recipick", style: textStyle),
          ),

        // 4단계: 최종 다국어 앱 이름
        if (_finalNameOpacity.value > 0)
          Opacity(
            opacity: _finalNameOpacity.value,
            child: Transform.scale(
              scale: 0.95 + (_finalNameOpacity.value * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(localizedAppName, style: textStyle),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
