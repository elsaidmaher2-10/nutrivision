import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

enum NutriBadgeVariant { mint, orange, teal, error }

class NutriBadge extends StatelessWidget {
  const NutriBadge({
    required this.label,
    super.key,
    this.variant = NutriBadgeVariant.mint,
    this.icon,
  });

  final String label;
  final NutriBadgeVariant variant;
  final IconData? icon;

  Color get _bg => switch (variant) {
        NutriBadgeVariant.mint => AppColors.softMint,
        NutriBadgeVariant.orange => const Color(0xFFFFF0E0),
        NutriBadgeVariant.teal => const Color(0xFFE0F5F3),
        NutriBadgeVariant.error => const Color(0xFFFFECEC),
      };

  Color get _fg => switch (variant) {
        NutriBadgeVariant.mint => AppColors.primary,
        NutriBadgeVariant.orange => AppColors.orange,
        NutriBadgeVariant.teal => AppColors.teal,
        NutriBadgeVariant.error => const Color(0xFFD32F2F),
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: _bg, borderRadius: BorderRadius.circular(999)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 13, color: _fg), const SizedBox(width: 4)],
          Text(label, style: TextStyle(fontFamily: 'Cairo', fontSize: 12, fontWeight: FontWeight.w600, color: _fg)),
        ],
      ),
    );
  }
}
