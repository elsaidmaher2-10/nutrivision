import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

/// Smart Healthy Alternatives Screen designed from NutriVision Stitch export (nutrivision_5, nutrivision_13)
class AlternativesView extends StatelessWidget {
  const AlternativesView({super.key});

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
          'بدائل صحية ذكية',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.onSurface,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Intro banner
              const _AlternativesIntroBanner(),

              const SizedBox(height: 20),

              // Alternative Item 1: Beshamel
              const _AlternativeCard(
                dishName: 'معكرونة بالبشاميل الصحية',
                dishCategory: 'وجبة غداء رئيسية',
                traditionalCalories: 750,
                healthyCalories: 320,
                savingsPercentage: 57,
                ingredientsTips: 'استبدال الدقيق الأبيض بدقيق الشوفان، وحليب قليل الدسم، ولحم مفروم 5% دهون.',
                icon: Icons.dinner_dining_rounded,
                badgeColor: AppColors.primary,
              ),

              const SizedBox(height: 16),

              // Alternative Item 2: Drinks
              const _AlternativeCard(
                dishName: 'ماء فوار بالنعناع والليمون',
                dishCategory: 'بديل المشروبات الغازية',
                traditionalCalories: 140,
                healthyCalories: 5,
                savingsPercentage: 96,
                ingredientsTips: 'ماء فوار طبيعي مع أوراق نعناع طازجة وشرائح ليمون منعشة بدون سكر مضاف.',
                icon: Icons.local_drink_rounded,
                badgeColor: AppColors.teal,
              ),

              const SizedBox(height: 16),

              // Alternative Item 3: Moussaka
              const _AlternativeCard(
                dishName: 'مسقعة صحية بالفرن',
                dishCategory: 'أطباق شرقية مشوية',
                traditionalCalories: 680,
                healthyCalories: 260,
                savingsPercentage: 62,
                ingredientsTips: 'شوي الباذنجان في الفرن بقليل من رذاذ زيت الزيتون بدلاً من القلي الغزير.',
                icon: Icons.lunch_dining_rounded,
                badgeColor: AppColors.orange,
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _AlternativesIntroBanner extends StatelessWidget {
  const _AlternativesIntroBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.softMint,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: const Row(
        children: [
          Icon(Icons.eco_rounded, color: AppColors.primary, size: 36),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'استمتع بأكلك المفضل بسعرات أقل!',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepGreen,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'نقدم لك وصفات وبدائل ذكية للأطباق العربية الشهيرة بدون حرمان.',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12,
                    color: AppColors.deepGreen,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AlternativeCard extends StatelessWidget {
  const _AlternativeCard({
    required this.dishName,
    required this.dishCategory,
    required this.traditionalCalories,
    required this.healthyCalories,
    required this.savingsPercentage,
    required this.ingredientsTips,
    required this.icon,
    required this.badgeColor,
  });

  final String dishName;
  final String dishCategory;
  final int traditionalCalories;
  final int healthyCalories;
  final int savingsPercentage;
  final String ingredientsTips;
  final IconData icon;
  final Color badgeColor;

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      padding: const EdgeInsets.all(18),
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: badgeColor, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dishCategory,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      dishName,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.softMint,
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Text(
                  '-$savingsPercentage% سعرة',
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Comparison Box
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      'الطبق التقليدي',
                      style: TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$traditionalCalories سعرة',
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.error,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward_rounded, color: AppColors.primary, size: 20),
                Column(
                  children: [
                    const Text(
                      'البديل الذكي',
                      style: TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$healthyCalories سعرة',
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            ingredientsTips,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 12,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
