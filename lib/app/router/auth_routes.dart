import 'package:go_router/go_router.dart';
import 'route_names.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/auth/presentation/views/welcome_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/auth/presentation/views/forgot_password_view.dart';

List<RouteBase> get authRoutes => [
  GoRoute(path: RouteNames.splash, builder: (context, state) => const SplashView()),
  GoRoute(path: RouteNames.onboarding, builder: (context, state) => const OnboardingView()),
  GoRoute(path: RouteNames.welcome, builder: (context, state) => const WelcomeView()),
  GoRoute(path: RouteNames.login, builder: (context, state) => const LoginView()),
  GoRoute(path: RouteNames.register, builder: (context, state) => const RegisterView()),
  GoRoute(path: RouteNames.forgotPassword, builder: (context, state) => const ForgotPasswordView()),
];
