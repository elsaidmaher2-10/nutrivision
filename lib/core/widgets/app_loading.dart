import 'package:flutter/material.dart';
import 'nutri_loading.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, this.size = 40, this.message});

  final double size;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return NutriLoading(size: size, message: message);
  }
}
