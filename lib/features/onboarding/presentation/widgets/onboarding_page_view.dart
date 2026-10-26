import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../domain/models/onboarding_page_data.dart';
import 'onboarding_page_card.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({required this.pageData, super.key});

  final OnboardingPageData pageData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnboardingPageCard(
            featureTitle: pageData.featureTitle,
            featureSubtitle: pageData.featureSubtitle,
          ),
          const SizedBox(height: 36),
          Text(
            pageData.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            pageData.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
