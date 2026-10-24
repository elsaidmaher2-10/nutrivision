import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Linear macronutrient progress bar with label, value, and animated bar.
class MacroProgressBar extends StatelessWidget {
  const MacroProgressBar({
    required this.label,
    required this.currentGrams,
    required this.targetGrams,
    required this.color,
    super.key,
  });

  final String label;
  final int currentGrams;
  final int targetGrams;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final progress = targetGrams > 0 ? (currentGrams / targetGrams).clamp(0.0, 1.0) : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
              ),
            ),
            Text(
              '$currentGrams/${targetGrams}g',
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(9999),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerRight, // RTL bar
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
