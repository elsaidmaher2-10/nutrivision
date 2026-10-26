import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_badge.dart';
import '../../../../../core/widgets/nutri_card.dart';

class MealHeroSummaryCard extends StatelessWidget {
  const MealHeroSummaryCard({required this.mealName, super.key});

  final String mealName;

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const NutriBadge(label: 'دقة AI: 94%', variant: NutriBadgeVariant.mint, icon: Icons.auto_awesome),
              Text('اليوم • 02:30 م', style: TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 12),
          Text(mealName, style: const TextStyle(fontFamily: 'Cairo', fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.onSurface)),
          const SizedBox(height: 6),
          const Text('وجبة متوازنة تحتوي على نشويات وبروتين نباتي', style: TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.textSecondary)),
          const SizedBox(height: 14),
          const Row(
            children: [
              Text('540', style: TextStyle(fontFamily: 'Cairo', fontSize: 28, fontWeight: FontWeight.w900, color: AppColors.primary)),
              SizedBox(width: 6),
              Text('سعرة حرارية إجمالية', style: TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.textSecondary)),
            ],
          ),
        ],
      ),
    );
  }
}
