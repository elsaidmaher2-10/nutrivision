import 'package:go_router/go_router.dart';
import 'route_names.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/meals_log_view.dart';
import '../../features/scanner/presentation/views/meal_scanner_view.dart';
import '../../features/scanner/presentation/views/meal_analysis_details_view.dart';
import '../../features/alternatives/presentation/views/alternatives_view.dart';
import '../../features/profile/presentation/views/profile_setup_view.dart';

List<RouteBase> get mainRoutes => [
  GoRoute(path: RouteNames.home, builder: (context, state) => const HomeView()),
  GoRoute(path: RouteNames.scanner, builder: (context, state) => const MealScannerView()),
  GoRoute(
    path: RouteNames.mealDetails,
    builder: (context, state) => MealAnalysisDetailsView(
      mealName: state.extra as String? ?? 'طبق كشري مصري',
    ),
  ),
  GoRoute(path: RouteNames.mealsLog, builder: (context, state) => const MealsLogView()),
  GoRoute(path: RouteNames.alternatives, builder: (context, state) => const AlternativesView()),
  GoRoute(path: RouteNames.profileSetup, builder: (context, state) => const ProfileSetupView()),
];
