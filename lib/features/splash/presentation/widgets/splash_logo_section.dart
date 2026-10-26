import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';

class SplashLogoSection extends StatelessWidget {
  const SplashLogoSection({required this.scaleAnimation, super.key});

  final Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(Icons.restaurant, color: AppColors.primary, size: 50),
          ),
          const SizedBox(height: 20),
          const Text(
            'NutriVision',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 34,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'تغذيتك الذكية بلمسة عربية',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFFC8E6C9),
            ),
          ),
        ],
      ),
    );
  }
}
