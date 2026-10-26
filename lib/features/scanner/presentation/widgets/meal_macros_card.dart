import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';
import '../../../../../core/widgets/nutri_macro_bar.dart';

class MealMacrosCard extends StatelessWidget {
  const MealMacrosCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const NutriCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('المغذيات الكبرى (Macros)', style: TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.w700)),
          SizedBox(height: 14),
          NutriMacroBar(label: 'بروتين', consumed: 22, target: 45, color: AppColors.primary),
          SizedBox(height: 10),
          NutriMacroBar(label: 'كاربوهيدرات', consumed: 88, target: 120, color: AppColors.orange),
          SizedBox(height: 10),
          NutriMacroBar(label: 'دهون', consumed: 12, target: 30, color: AppColors.teal),
          SizedBox(height: 10),
          NutriMacroBar(label: 'ألياف غذائية', consumed: 9, target: 15, color: Color(0xFF8D6E63)),
        ],
      ),
    );
  }
}
