import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/meal_entry.dart';
import '../../../../core/services/user_session_service.dart';
import '../../../nutrition/domain/repositories/nutrition_repository.dart';
import 'home_sample_meals.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo, this._session) : super(const HomeInitial());

  final NutritionRepository _repo;
  final UserSessionService _session;

  Future<void> loadTodayMeals() async {
    emit(const HomeLoading());
    final uid = _session.userId ?? 'guest_user';
    final result = await _repo.getMealsForDate(uid, DateTime.now());

    result.fold(
      (_) => _emitData(HomeSampleMeals.samples),
      (meals) => _emitData(meals.isEmpty ? HomeSampleMeals.samples : meals),
    );
  }

  void _emitData(List<MealEntry> meals) {
    int totalCal = 0;
    double p = 0, c = 0, f = 0;
    for (final m in meals) {
      totalCal += m.calories;
      p += m.proteinG;
      c += m.carbsG;
      f += m.fatG;
    }
    emit(HomeLoaded(
      meals: meals,
      consumedCalories: totalCal,
      targetCalories: 2000,
      proteinG: p,
      carbsG: c,
      fatG: f,
    ));
  }
}
