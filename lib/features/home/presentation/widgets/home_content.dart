import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../cubit/home_state.dart';
import 'home_greeting_section.dart';
import 'ai_meal_hero_card.dart';
import 'daily_calorie_card.dart';
import 'today_meals_section.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({required this.state, super.key});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final loaded = state is HomeLoaded ? state as HomeLoaded : null;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const HomeGreetingSection(),
        const SizedBox(height: 16),
        AiMealHeroCard(onStartScan: () => context.push('/scanner')),
        const SizedBox(height: 16),
        DailyCalorieCard(
          consumed: loaded?.consumedCalories ?? 1420,
          target: loaded?.targetCalories ?? 2000,
          protein: loaded?.proteinG ?? 85,
          carbs: loaded?.carbsG ?? 160,
          fat: loaded?.fatG ?? 45,
        ),
        const SizedBox(height: 18),
        TodayMealsSection(
          meals: loaded?.meals,
          onMealTap: (n) => context.push('/meal-details', extra: n),
        ),
      ]),
    );
  }
}
