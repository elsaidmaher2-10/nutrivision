import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract final class AppTextStyles {
  static const String arabicFontFamily = 'Cairo';

  static TextStyle cairo({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColors.onSurface,
    double? height,
  }) =>
      GoogleFonts.cairo(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );

  static TextStyle get headlineLarge =>
      cairo(fontSize: 28, fontWeight: FontWeight.w800);
  static TextStyle get headlineMedium =>
      cairo(fontSize: 22, fontWeight: FontWeight.w700);
  static TextStyle get headlineSmall =>
      cairo(fontSize: 18, fontWeight: FontWeight.w700);

  static TextStyle get titleLarge =>
      cairo(fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle get titleMedium =>
      cairo(fontSize: 14, fontWeight: FontWeight.w600);

  static TextStyle get bodyLarge =>
      cairo(fontSize: 15, fontWeight: FontWeight.w500);
  static TextStyle get bodyMedium =>
      cairo(fontSize: 13, color: AppColors.textSecondary);
  static TextStyle get bodySmall =>
      cairo(fontSize: 11, color: AppColors.textSecondary);

  static TextStyle get labelLarge =>
      cairo(fontSize: 14, fontWeight: FontWeight.w700);
}
