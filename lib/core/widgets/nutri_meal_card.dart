import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'nutri_card.dart';

class NutriMealCard extends StatelessWidget {
  const NutriMealCard({
    required this.name,
    required this.calories,
    required this.mealTypeLabel,
    required this.timeLabel,
    super.key,
    this.onTap,
  });

  final String name;
  final int calories;
  final String mealTypeLabel;
  final String timeLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(color: AppColors.softMint, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.restaurant_menu, color: AppColors.primary, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(name, style: const TextStyle(fontFamily: 'Cairo', fontSize: 15, fontWeight: FontWeight.w700), maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Text('$mealTypeLabel • $timeLabel', style: const TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.textSecondary)),
            ]),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('$calories', style: const TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.primary)),
            const Text('سعرة', style: TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textSecondary)),
          ]),
          const SizedBox(width: 6),
          const Icon(Icons.arrow_forward_ios_rounded, size: 12, color: AppColors.outlineVariant),
        ],
      ),
    );
  }
}
