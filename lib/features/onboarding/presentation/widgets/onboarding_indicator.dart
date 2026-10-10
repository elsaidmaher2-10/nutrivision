import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.border,
    this.spacing = AppSizes.spacingSm,
    this.height = 8,
    this.activeWidth = 24,
    this.inactiveWidth = 8,
  });

  final int currentPage;
  final int totalPages;
  final Color activeColor;
  final Color inactiveColor;
  final double spacing;
  final double height;
  final double activeWidth;
  final double inactiveWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        final isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: isActive ? activeWidth : inactiveWidth,
          height: height,
          decoration: BoxDecoration(
            color: isActive ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        );
      }),
    );
  }
}