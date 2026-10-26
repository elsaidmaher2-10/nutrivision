import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

class MealSectionCard extends StatelessWidget {
  const MealSectionCard({
    required this.title,
    required this.calories,
    required this.items,
    required this.icon,
    super.key,
  });

  final String title;
  final int calories;
  final List<String> items;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36, height: 36,
                decoration: BoxDecoration(color: AppColors.softMint, borderRadius: BorderRadius.circular(10)),
                child: Icon(icon, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(child: Text(title, style: const TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.w700))),
              Text('$calories سعرة', style: const TextStyle(fontFamily: 'Cairo', fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primary)),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: AppColors.outlineVariant, height: 1),
          const SizedBox(height: 10),
          ...items.map((it) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: [
                const Icon(Icons.circle, size: 6, color: AppColors.primary),
                const SizedBox(width: 8),
                Expanded(child: Text(it, style: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.onSurface))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
