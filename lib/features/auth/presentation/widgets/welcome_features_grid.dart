import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

class WelcomeFeaturesGrid extends StatelessWidget {
  const WelcomeFeaturesGrid({super.key});

  static const _features = [
    (Icons.camera_alt_rounded, 'مسح ذكي', 'صوّر وجبتك للتحليل الفوري'),
    (Icons.analytics_rounded, 'تحليل دقيق', 'سعرات وبروتين وكارب ودهون'),
    (Icons.eco_rounded, 'بدائل صحية', 'اقتراحات غذائية مخصصة لك'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _features.map((f) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: NutriCard(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.softMint,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(f.$1, color: AppColors.primary, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(f.$2, style: const TextStyle(fontFamily: 'Cairo', fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.onSurface)),
                const SizedBox(height: 2),
                Text(f.$3, style: const TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.textSecondary)),
              ]),
            ),
          ]),
        ),
      )).toList(),
    );
  }
}
