import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/widgets/app_loading.dart';
import '../../../../../core/widgets/app_logo.dart';
import '../viewmodels/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashViewModel>(
      create: (_) => SplashViewModel(),
      child: const _SplashViewContent(),
    );
  }
}

class _SplashViewContent extends StatefulWidget {
  const _SplashViewContent();

  @override
  State<_SplashViewContent> createState() => _SplashViewContentState();
}

class _SplashViewContentState extends State<_SplashViewContent> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppSizes.durationSlow,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _animationController.forward();

    // Initialize and navigate
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashViewModel>().initialize().then((_) {
        _navigateToNextScreen();
      });
    });
  }

  Future<void> _navigateToNextScreen() async {
    if (!mounted) return;

    final viewModel = context.read<SplashViewModel>();
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    final nextRoute = viewModel.getNextRoute();
    context.go(nextRoute);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.surfaceLight,
              AppColors.warmCream,
              AppColors.white,
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated Logo
                    AppLogoAnimated(size: AppSizes.logoLg),
                    SizedBox(height: AppSizes.spacing3xl),

                    // App tagline
                    Text(
                      AppStrings.appTagline,
                      style: AppTextStyles.subtitleWhite.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: AppSizes.spacing4xl),

                    // Loading indicator
                    AppLoading(
                      size: AppSizes.iconXl,
                      color: AppColors.primary,
                      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    ),
                    SizedBox(height: AppSizes.spacingLg),

                    // Loading text
                    Text(
                      AppStrings.splashLoading,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: AppSizes.spacing4xl),

                    // Version
                    Text(
                      AppStrings.splashVersion,
                      style: AppTextStyles.captionWhite.copyWith(
                        color: AppColors.textSecondary.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}