import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

class ProfileGoalSelector extends StatelessWidget {
  const ProfileGoalSelector({
    required this.selectedGoal,
    required this.onSelect,
    super.key,
  });

  final String selectedGoal;
  final ValueChanged<String> onSelect;

  static const _goals = ['خسارة الوزن', 'المحافظة على الوزن', 'زيادة الوزن / العضلات'];

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('هدفك الصحي الأساسي', style: TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          ..._goals.map((g) {
            final isSel = selectedGoal == g;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                tileColor: isSel ? AppColors.softMint : AppColors.surfaceContainer,
                leading: Icon(isSel ? Icons.check_circle_rounded : Icons.radio_button_unchecked, color: isSel ? AppColors.primary : AppColors.outline),
                title: Text(g, style: TextStyle(fontFamily: 'Cairo', fontSize: 14, fontWeight: isSel ? FontWeight.w700 : FontWeight.normal)),
                onTap: () => onSelect(g),
              ),
            );
          }),
        ],
      ),
    );
  }
}
