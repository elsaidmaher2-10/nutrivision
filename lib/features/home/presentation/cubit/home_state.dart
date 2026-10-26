import 'package:equatable/equatable.dart';
import '../../../../core/models/meal_entry.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeLoaded extends HomeState {
  const HomeLoaded({
    required this.meals,
    required this.consumedCalories,
    required this.targetCalories,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
  });

  final List<MealEntry> meals;
  final int consumedCalories;
  final int targetCalories;
  final double proteinG;
  final double carbsG;
  final double fatG;

  @override
  List<Object?> get props =>
      [meals, consumedCalories, targetCalories, proteinG, carbsG, fatG];
}

final class HomeFailure extends HomeState {
  const HomeFailure(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
