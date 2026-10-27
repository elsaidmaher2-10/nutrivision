import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/models/meal_entry.dart';
import '../../../../core/services/firestore_service.dart';
import '../../domain/repositories/nutrition_repository.dart';

class NutritionRepositoryImpl implements NutritionRepository {
  NutritionRepositoryImpl(this._firestore);
  final FirestoreService _firestore;

  String _mealDoc(String uid, String mid) => 'users/$uid/meals/$mid';
  String _mealsCol(String uid) => 'users/$uid/meals';

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() f) async {
    try {
      return Right(await f());
    } catch (e) {
      return Left(ServerFailure('فشل في معالجة بيانات الوجبات: $e'));
    }
  }

  @override
  Future<Either<Failure, List<MealEntry>>> getMealsForDate(
    String userId,
    DateTime date,
  ) =>
      _guard(() async {
        final col = _firestore.collection(_mealsCol(userId));
        if (col == null) return <MealEntry>[];
        final start = DateTime(date.year, date.month, date.day);
        final end = start.add(const Duration(days: 1));
        final snap = await col
            .where('loggedAt',
                isGreaterThanOrEqualTo: start.toIso8601String(),
                isLessThan: end.toIso8601String())
            .get();
        return snap.docs
            .map((d) => MealEntry.fromMap(d.id, d.data()))
            .toList();
      });

  @override
  Future<Either<Failure, Unit>> addMeal(MealEntry meal) =>
      _guard(() async {
        await _firestore.setDoc(_mealDoc(meal.userId, meal.id), meal.toMap());
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> deleteMeal(String mealId, String userId) =>
      _guard(() async {
        await _firestore.deleteDoc(_mealDoc(userId, mealId));
        return unit;
      });
}
