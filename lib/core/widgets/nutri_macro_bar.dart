import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NutriMacroBar extends StatelessWidget {
  const NutriMacroBar({
    required this.label,
    required this.consumed,
    required this.target,
    required this.color,
    super.key,
    this.unit = 'جم',
  });

  final String label;
  final double consumed;
  final double target;
  final Color color;
  final String unit;

  @override
  Widget build(BuildContext context) {
    final ratio = target > 0 ? (consumed / target).clamp(0.0, 1.0) : 0.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.onSurface)),
            Text('${consumed.toInt()}/${ target.toInt()} $unit', style: const TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.textSecondary)),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: ratio,
            minHeight: 7,
            backgroundColor: AppColors.surfaceContainer,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}
