import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_app_bar.dart';
import '../widgets/meals_log_day_summary.dart';
import '../widgets/meal_section_card.dart';

class MealsLogView extends StatelessWidget {
  const MealsLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: NutriAppBar(
        title: 'سجل الوجبات اليومي',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MealsLogDaySummary(),
              SizedBox(height: 16),
              MealSectionCard(
                title: 'الفطور',
                calories: 380,
                icon: Icons.breakfast_dining_rounded,
                items: ['2 بيضة مسلوقة (155 سعرة)', 'نصف رغيف بلدي (150 سعرة)', 'جبنة قريش بزيت زيتون (75 سعرة)'],
              ),
              SizedBox(height: 12),
              MealSectionCard(
                title: 'الغداء',
                calories: 720,
                icon: Icons.lunch_dining_rounded,
                items: ['صدر دجاج مشوي (280 سعرة)', 'أرز بسمتي أبيض (240 سعرة)', 'سلطة خضراء بليمون (80 سعرة)'],
              ),
              SizedBox(height: 12),
              MealSectionCard(
                title: 'العشاء',
                calories: 320,
                icon: Icons.dinner_dining_rounded,
                items: ['علبة تونة مصفاة (180 سعرة)', 'طبق سلطة مشكلة (90 سعرة)', 'تفاحة متوسطة (50 سعرة)'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
