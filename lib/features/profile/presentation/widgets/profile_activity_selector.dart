import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

class ProfileActivitySelector extends StatelessWidget {
  const ProfileActivitySelector({
    required this.selectedActivity,
    required this.onSelect,
    super.key,
  });

  final String selectedActivity;
  final ValueChanged<String> onSelect;

  static const _levels = ['قليل الحركة', 'متوسط (3-4 أيام تمرين)', 'نشط جداً (تمرين يومي)'];

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('مستوى النشاط البدني', style: TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          ..._levels.map((lvl) {
            final isSel = selectedActivity == lvl;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                tileColor: isSel ? AppColors.softMint : AppColors.surfaceContainer,
                leading: Icon(isSel ? Icons.check_circle_rounded : Icons.radio_button_unchecked, color: isSel ? AppColors.primary : AppColors.outline),
                title: Text(lvl, style: TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: isSel ? FontWeight.w700 : FontWeight.normal)),
                onTap: () => onSelect(lvl),
              ),
            );
          }),
        ],
      ),
    );
  }
}
