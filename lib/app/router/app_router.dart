import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/auth/presentation/views/welcome_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/meals_log_view.dart';
import '../../features/scanner/presentation/views/meal_scanner_view.dart';
import '../../features/scanner/presentation/views/meal_analysis_details_view.dart';
import '../../features/alternatives/presentation/views/alternatives_view.dart';
import '../../features/profile/presentation/views/profile_setup_view.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    debugLogDiagnostics: false,
    routes: [
      // Splash screen
      GoRoute(
        path: RouteNames.splash,
        name: 'splash',
        builder: (context, state) => const SplashView(),
      ),

      // Onboarding
      GoRoute(
        path: RouteNames.onboarding,
        name: 'onboarding',
        builder: (context, state) => const OnboardingView(),
      ),

      // Auth routes
      GoRoute(
        path: RouteNames.welcome,
        name: 'welcome',
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(
        path: RouteNames.login,
        name: 'login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: RouteNames.register,
        name: 'register',
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: RouteNames.forgotPassword,
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordView(),
      ),

      // Main app routes
      GoRoute(
        path: RouteNames.home,
        name: 'home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: RouteNames.scanner,
        name: 'scanner',
        builder: (context, state) => const MealScannerView(),
      ),
      GoRoute(
        path: RouteNames.mealDetails,
        name: 'mealDetails',
        builder: (context, state) {
          final mealName = state.extra as String? ?? 'طبق كشري مصري متوسط';
          return MealAnalysisDetailsView(mealName: mealName);
        },
      ),
      GoRoute(
        path: RouteNames.mealsLog,
        name: 'mealsLog',
        builder: (context, state) => const MealsLogView(),
      ),
      GoRoute(
        path: RouteNames.alternatives,
        name: 'alternatives',
        builder: (context, state) => const AlternativesView(),
      ),
      GoRoute(
        path: RouteNames.profileSetup,
        name: 'profileSetup',
        builder: (context, state) => const ProfileSetupView(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            const Text(
              'الصفحة غير موجودة',
              style: TextStyle(fontFamily: 'Cairo', fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              state.error?.toString() ?? 'خطأ غير معروف',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.home),
              child: const Text('العودة للرئيسية', style: TextStyle(fontFamily: 'Cairo')),
            ),
          ],
        ),
      ),
    ),
  );
}
