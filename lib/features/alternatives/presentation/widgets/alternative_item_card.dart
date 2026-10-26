import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_badge.dart';
import '../../../../../core/widgets/nutri_card.dart';

class AlternativeItemCard extends StatelessWidget {
  const AlternativeItemCard({
    required this.name,
    required this.category,
    required this.traditionalCal,
    required this.healthyCal,
    required this.savedPct,
    required this.tip,
    super.key,
  });

  final String name;
  final String category;
  final int traditionalCal;
  final int healthyCal;
  final int savedPct;
  final String tip;

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.w700)),
              NutriBadge(label: 'وفر $savedPct%', variant: NutriBadgeVariant.mint),
            ],
          ),
          const SizedBox(height: 2),
          Text(category, style: const TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.textSecondary)),
          const SizedBox(height: 12),
          Row(
            children: [
              Text('$healthyCal سعرة', style: const TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.primary)),
              const SizedBox(width: 8),
              Text('بدلاً من $traditionalCal سعرة', style: const TextStyle(fontFamily: 'Cairo', fontSize: 13, decoration: TextDecoration.lineThrough, color: AppColors.outline)),
            ],
          ),
          const SizedBox(height: 8),
          Text(tip, style: const TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.textSecondary, height: 1.5)),
        ],
      ),
    );
  }
}
