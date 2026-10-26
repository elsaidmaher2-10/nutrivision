import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';

class OnboardingPageCard extends StatelessWidget {
  const OnboardingPageCard({
    required this.featureTitle,
    required this.featureSubtitle,
    super.key,
  });

  final String featureTitle;
  final String featureSubtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 220,
      decoration: BoxDecoration(
        color: AppColors.softMint,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.eco_rounded, size: 72, color: AppColors.primary),
          const SizedBox(height: 16),
          Text(
            featureTitle,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            featureSubtitle,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
