import 'package:flutter/material.dart';
import 'nutri_calorie_ring.dart';

class CalorieProgressRing extends StatelessWidget {
  const CalorieProgressRing({
    required this.consumedCalories,
    required this.targetCalories,
    super.key,
    this.size = 84.0,
    this.strokeWidth = 7.0,
  });

  final int consumedCalories;
  final int targetCalories;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return NutriCalorieRing(
      consumed: consumedCalories,
      target: targetCalories,
      size: size,
      strokeWidth: strokeWidth,
    );
  }
}
