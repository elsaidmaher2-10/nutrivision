import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/models/meal_entry.dart';
import '../../../../../core/widgets/nutri_meal_card.dart';

class TodayMealsSection extends StatelessWidget {
  const TodayMealsSection({
    required this.onMealTap,
    this.meals,
    super.key,
  });

  final ValueChanged<String> onMealTap;
  final List<MealEntry>? meals;

  @override
  Widget build(BuildContext context) {
    final list = meals ?? const [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('وجبات اليوم', style: TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.w700)),
            TextButton(
              onPressed: () => context.push('/meals-log'),
              child: const Text('عرض الكل', style: TextStyle(fontFamily: 'Cairo', color: AppColors.primary, fontSize: 13)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...list.map((m) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: NutriMealCard(
            name: m.name,
            calories: m.calories,
            mealTypeLabel: m.mealType.name,
            timeLabel: '${m.loggedAt.hour}:${m.loggedAt.minute.toString().padLeft(2, '0')}',
            onTap: () => onMealTap(m.name),
          ),
        )),
      ],
    );
  }
}
