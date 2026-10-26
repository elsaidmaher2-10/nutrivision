import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';
import '../../../../../core/widgets/nutri_calorie_ring.dart';
import '../../../../../core/widgets/nutri_macro_bar.dart';

class DailyCalorieCard extends StatelessWidget {
  const DailyCalorieCard({
    this.consumed = 1420,
    this.target = 2000,
    this.protein = 85,
    this.carbs = 160,
    this.fat = 45,
    super.key,
  });

  final int consumed, target;
  final double protein, carbs, fat;

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('السعرات اليومية', style: TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.w700)),
                  Text('المستهلك: $consumed / الهدف: $target سعرة', style: const TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
              NutriCalorieRing(consumed: consumed, target: target, size: 68),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(color: AppColors.outlineVariant),
          const SizedBox(height: 10),
          NutriMacroBar(label: 'بروتين', consumed: protein, target: 130, color: AppColors.primary),
          const SizedBox(height: 8),
          NutriMacroBar(label: 'كاربوهيدرات', consumed: carbs, target: 220, color: AppColors.orange),
          const SizedBox(height: 8),
          NutriMacroBar(label: 'دهون صحية', consumed: fat, target: 65, color: AppColors.teal),
        ],
      ),
    );
  }
}
