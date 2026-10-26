import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

class MealsLogDaySummary extends StatelessWidget {
  const MealsLogDaySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      padding: const EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _Stat(label: 'المستهلك', value: '1,420', unit: 'سعرة', color: AppColors.primary),
          const SizedBox(height: 36, child: VerticalDivider(color: AppColors.outlineVariant)),
          _Stat(label: 'المتبقي', value: '580', unit: 'سعرة', color: AppColors.orange),
          const SizedBox(height: 36, child: VerticalDivider(color: AppColors.outlineVariant)),
          _Stat(label: 'الهدف', value: '2,000', unit: 'سعرة', color: AppColors.textSecondary),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value, required this.unit, required this.color});
  final String label;
  final String value;
  final String unit;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontFamily: 'Cairo', fontSize: 18, fontWeight: FontWeight.w800, color: color)),
        const SizedBox(height: 2),
        Text('$label ($unit)', style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textSecondary)),
      ],
    );
  }
}
