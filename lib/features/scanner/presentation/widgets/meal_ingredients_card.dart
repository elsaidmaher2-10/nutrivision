import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

class MealIngredientsCard extends StatelessWidget {
  const MealIngredientsCard({super.key});

  static const _items = [
    ('أرز مصري مع شعرية', '180 جم', '220 سعرة'),
    ('مكرونة مسلوقة متنوعة', '120 جم', '160 سعرة'),
    ('عدس بجبة بني', '60 جم', '70 سعرة'),
    ('حمص شام مسلوق', '40 جم', '50 سعرة'),
    ('صلصة طماطم وبصل محمر', '50 جم', '40 سعرة'),
  ];

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('المكونات المكتشفة', style: TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          ..._items.map((it) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(it.$1, style: const TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: FontWeight.w600)),
                Text('${it.$2} • ${it.$3}', style: const TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
