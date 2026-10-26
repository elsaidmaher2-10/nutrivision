import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

class AiMealHeroCard extends StatelessWidget {
  const AiMealHeroCard({required this.onStartScan, super.key});

  final VoidCallback onStartScan;

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      color: AppColors.primary,
      onTap: onStartScan,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Text(
                    '✨ ذكاء اصطناعي فوري',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'صوّر طبقك الآن',
                  style: TextStyle(fontFamily: 'Cairo', fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
                ),
                const SizedBox(height: 4),
                const Text(
                  'احصل على تحليل السعرات فوراً بالكاميرا',
                  style: TextStyle(fontFamily: 'Cairo', fontSize: 12, color: Color(0xFFE8F5E9)),
                ),
              ],
            ),
          ),
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: const Icon(Icons.camera_alt_rounded, color: AppColors.primary, size: 28),
          ),
        ],
      ),
    );
  }
}
