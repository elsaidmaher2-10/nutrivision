import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

class AlternativesIntroBanner extends StatelessWidget {
  const AlternativesIntroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      color: AppColors.softMint,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
            child: const Icon(Icons.eco_rounded, color: Colors.white, size: 26),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('وفّر حتى 60% من السعرات', style: TextStyle(fontFamily: 'Cairo', fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.primary)),
                SizedBox(height: 2),
                Text('بدائل لأطباقك العربية المفضلة بنفس المذاق اللذيذ.', style: TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
