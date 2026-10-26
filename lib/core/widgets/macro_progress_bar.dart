import 'package:flutter/material.dart';
import 'nutri_macro_bar.dart';

class MacroProgressBar extends StatelessWidget {
  const MacroProgressBar({
    required this.label,
    required this.consumed,
    required this.target,
    required this.color,
    super.key,
    this.unit = 'جم',
  });

  final String label;
  final double consumed;
  final double target;
  final Color color;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return NutriMacroBar(
      label: label,
      consumed: consumed,
      target: target,
      color: color,
      unit: unit,
    );
  }
}
