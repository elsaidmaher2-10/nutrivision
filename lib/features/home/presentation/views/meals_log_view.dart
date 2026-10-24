import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

/// Daily Meals Log designed from NutriVision Stitch export (nutrivision_8, nutrivision_2)
class MealsLogView extends StatelessWidget {
  const MealsLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.onSurface),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'سجل الوجبات اليومي',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.onSurface,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined, color: AppColors.onSurface, size: 20),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _DaySummaryCard(),

              const SizedBox(height: 20),

              _MealSectionCard(
                categoryName: 'الفطور',
                time: '8:30 ص',
                totalCalories: 380,
                icon: Icons.breakfast_dining_rounded,
                iconColor: AppColors.orange,
                items: const [
                  _FoodItem(name: '2 بيضة مسلوقة', grams: '100 جم', calories: 155),
                  _FoodItem(name: 'نصف رغيف خبز بلدي', grams: '60 جم', calories: 150),
                  _FoodItem(name: 'قطعة جبنة قريش بزيت زيتون', grams: '80 جم', calories: 75),
                ],
                onAddFood: () {},
              ),

              const SizedBox(height: 16),

              _MealSectionCard(
                categoryName: 'الغداء',
                time: '2:15 م',
                totalCalories: 620,
                icon: Icons.lunch_dining_rounded,
                iconColor: AppColors.primary,
                items: const [
                  _FoodItem(name: 'طبق كشري مصري متوسط', grams: '350 جم', calories: 450),
                  _FoodItem(name: 'صلصة طماطم ودقوس', grams: '60 جم', calories: 50),
                  _FoodItem(name: 'طبق سلطة خضراء بلدي', grams: '150 جم', calories: 120),
                ],
                onAddFood: () {},
              ),

              const SizedBox(height: 16),

              _MealSectionCard(
                categoryName: 'سناك خفيف',
                time: '5:00 م',
                totalCalories: 170,
                icon: Icons.coffee_rounded,
                iconColor: AppColors.teal,
                items: const [
                  _FoodItem(name: 'تفاحة خضراء متوسطة', grams: '150 جم', calories: 95),
                  _FoodItem(name: 'حفنة لوز وجوز نيء', grams: '20 جم', calories: 75),
                ],
                onAddFood: () {},
              ),

              const SizedBox(height: 16),

              // Dinner Section
              _MealSectionCard(
                categoryName: 'العشاء',
                time: '8:45 م',
                totalCalories: 280,
                icon: Icons.dinner_dining_rounded,
                iconColor: AppColors.deepGreen,
                items: const [
                  _FoodItem(name: 'علبة تونة مصفاة من الزيت', grams: '120 جم', calories: 160),
                  _FoodItem(name: 'سلطة جرجير وخيار وزيت زيتون', grams: '150 جم', calories: 120),
                ],
                onAddFood: () {},
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _DaySummaryCard extends StatelessWidget {
  const _DaySummaryCard();

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      backgroundColor: AppColors.primaryDark,
      padding: const EdgeInsets.all(18),
      borderRadius: BorderRadius.circular(20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SummaryMetric(label: 'المستهلك', value: '1,450', unit: 'سعرة', color: Colors.white),
          _SummaryMetric(label: 'المتبقي', value: '550', unit: 'سعرة', color: AppColors.secondaryContainer),
          _SummaryMetric(label: 'الهدف', value: '2,000', unit: 'سعرة', color: AppColors.softMint),
        ],
      ),
    );
  }
}

class _SummaryMetric extends StatelessWidget {
  const _SummaryMetric({
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
  });

  final String label;
  final String value;
  final String unit;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 12,
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: color,
          ),
        ),
        Text(
          unit,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 10,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}

class _MealSectionCard extends StatelessWidget {
  const _MealSectionCard({
    required this.categoryName,
    required this.time,
    required this.totalCalories,
    required this.icon,
    required this.iconColor,
    required this.items,
    required this.onAddFood,
  });

  final String categoryName;
  final String time;
  final int totalCalories;
  final IconData icon;
  final Color iconColor;
  final List<_FoodItem> items;
  final VoidCallback onAddFood;

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(18),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryName,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.onSurface,
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '$totalCalories سعرة',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: iconColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: AppColors.surfaceContainer, height: 1),
          const SizedBox(height: 8),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(radius: 3, backgroundColor: AppColors.outline),
                        const SizedBox(width: 8),
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 13,
                            color: AppColors.onSurface,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${item.calories} سعرة',
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _FoodItem {
  const _FoodItem({
    required this.name,
    required this.grams,
    required this.calories,
  });

  final String name;
  final String grams;
  final int calories;
}
