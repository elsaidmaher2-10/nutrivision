import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/nutri_button.dart';

class MealAnalysisActions extends StatelessWidget {
  const MealAnalysisActions({required this.onSaveMeal, super.key});

  final VoidCallback onSaveMeal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NutriButton(
          label: 'حفظ الوجبة في سجلي',
          onPressed: onSaveMeal,
          icon: Icons.check_circle_rounded,
        ),
        const SizedBox(height: 10),
        NutriButton(
          label: 'استكشاف بدائل صحية لهذه الوجبة',
          onPressed: () => context.push('/alternatives'),
          isOutlined: true,
          icon: Icons.eco_rounded,
        ),
      ],
    );
  }
}
