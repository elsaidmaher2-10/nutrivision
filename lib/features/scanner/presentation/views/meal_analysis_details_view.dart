import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_app_bar.dart';
import '../widgets/meal_hero_summary_card.dart';
import '../widgets/meal_macros_card.dart';
import '../widgets/meal_ingredients_card.dart';
import '../widgets/meal_analysis_actions.dart';

class MealAnalysisDetailsView extends StatelessWidget {
  const MealAnalysisDetailsView({
    super.key,
    this.mealName = 'طبق كشري مصري متوسط',
  });

  final String mealName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: NutriAppBar(
        title: 'تفاصيل التحليل المتقدم',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MealHeroSummaryCard(mealName: mealName),
              const SizedBox(height: 16),
              const MealMacrosCard(),
              const SizedBox(height: 16),
              const MealIngredientsCard(),
              const SizedBox(height: 20),
              MealAnalysisActions(
                onSaveMeal: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تم حفظ الوجبة في سجلك!', style: TextStyle(fontFamily: 'Cairo'))),
                  );
                  context.go('/home');
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
