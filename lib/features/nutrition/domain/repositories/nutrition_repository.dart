import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/models/meal_entry.dart';

abstract class NutritionRepository {
  Future<Either<Failure, List<MealEntry>>> getMealsForDate(
    String userId,
    DateTime date,
  );
  Future<Either<Failure, Unit>> addMeal(MealEntry meal);
  Future<Either<Failure, Unit>> deleteMeal(String mealId, String userId);
}
