import '../../../../core/models/meal_entry.dart';

abstract final class HomeSampleMeals {
  static List<MealEntry> get samples => [
        MealEntry(
          id: '1',
          userId: 'default',
          name: 'فطور عربي متكامل',
          calories: 420,
          mealType: MealType.breakfast,
          loggedAt: DateTime.now(),
          proteinG: 22,
          carbsG: 45,
          fatG: 12,
        ),
        MealEntry(
          id: '2',
          userId: 'default',
          name: 'كبسة دجاج صحية',
          calories: 680,
          mealType: MealType.lunch,
          loggedAt: DateTime.now(),
          proteinG: 48,
          carbsG: 75,
          fatG: 18,
        ),
        MealEntry(
          id: '3',
          userId: 'default',
          name: 'زبادي يوناني ومكسرات',
          calories: 320,
          mealType: MealType.snack,
          loggedAt: DateTime.now(),
          proteinG: 15,
          carbsG: 20,
          fatG: 15,
        ),
      ];
}
