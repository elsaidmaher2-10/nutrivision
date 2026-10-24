import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTextStyles {
  // Arabic font - Cairo
  static const String arabicFontFamily = 'Cairo';

  // Base text style with Arabic font
  static TextStyle _base({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.cairo(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // Display styles
  static TextStyle get displayLarge => _base(
    fontSize: 57,
    fontWeight: FontWeight.w700,
    color: AppColors.textOnSurface,
    height: 1.12,
    letterSpacing: -0.25,
  );

  static TextStyle get displayMedium => _base(
    fontSize: 45,
    fontWeight: FontWeight.w700,
    color: AppColors.textOnSurface,
    height: 1.16,
    letterSpacing: 0,
  );

  static TextStyle get displaySmall => _base(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColors.textOnSurface,
    height: 1.22,
    letterSpacing: 0,
  );

  // Headline styles
  static TextStyle get headlineLarge => _base(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.textOnSurface,
    height: 1.25,
    letterSpacing: 0,
  );

  static TextStyle get headlineMedium => _base(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textOnSurface,
    height: 1.29,
    letterSpacing: 0,
  );

  static TextStyle get headlineSmall => _base(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textOnSurface,
    height: 1.33,
    letterSpacing: 0,
  );

  // Title styles
  static TextStyle get titleLarge => _base(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnSurface,
    height: 1.27,
    letterSpacing: 0,
  );

  static TextStyle get titleMedium => _base(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnSurface,
    height: 1.5,
    letterSpacing: 0.15,
  );

  static TextStyle get titleSmall => _base(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnSurface,
    height: 1.43,
    letterSpacing: 0.1,
  );

  // Body styles
  static TextStyle get bodyLarge => _base(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textOnSurface,
    height: 1.5,
    letterSpacing: 0.15,
  );

  static TextStyle get bodyMedium => _base(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textOnSurface,
    height: 1.43,
    letterSpacing: 0.25,
  );

  static TextStyle get bodySmall => _base(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textOnSurface,
    height: 1.33,
    letterSpacing: 0.4,
  );

  // Label styles
  static TextStyle get labelLarge => _base(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textOnSurface,
    height: 1.43,
    letterSpacing: 0.1,
  );

  static TextStyle get labelMedium => _base(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textOnSurface,
    height: 1.33,
    letterSpacing: 0.5,
  );

  static TextStyle get labelSmall => _base(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.textOnSurface,
    height: 1.45,
    letterSpacing: 0.5,
  );

  // Custom styles for the app (matching Figma designs)
  static TextStyle get heading1 => _base(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColors.textOnSurface,
    height: 1.11,
    letterSpacing: -0.9,
  );

  static TextStyle get heading1White => _base(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    height: 1.11,
    letterSpacing: -0.9,
  );

  static TextStyle get heading2 => _base(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textOnSurface,
    height: 1.5,
  );

  static TextStyle get heading2Teal => _base(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.teal,
    height: 1.5,
  );

  static TextStyle get subtitle => _base(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textHint,
    height: 1.625,
    letterSpacing: 0.4,
  );

  static TextStyle get subtitleWhite => _base(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    height: 1.5,
    letterSpacing: 0.4,
  );

  static TextStyle get buttonText => _base(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    height: 1.5,
  );

  static TextStyle get buttonTextSecondary => _base(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryDark,
    height: 1.5,
  );

  static TextStyle get linkText => _base(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryDark,
    height: 1.33,
    letterSpacing: 0,
  );

  static TextStyle get caption => _base(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.33,
  );

  static TextStyle get captionWhite => _base(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.white.withValues(alpha: 0.5),
    height: 1.33,
  );

  // Input field styles
  static TextStyle get inputText => _base(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textOnSurface,
    height: 1.5,
  );

  static TextStyle get inputHint => _base(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static TextStyle get inputLabel => _base(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textOnSurface,
    height: 1.71,
  );

  static TextStyle get errorText => _base(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
    height: 1.33,
  );

  // Feature card styles
  static TextStyle get featureTitle => _base(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textOnSurface,
    height: 1.33,
  );

  static TextStyle get featureSubtitle => _base(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textHint,
    height: 1.33,
  );

  // Badge styles
  static TextStyle get badgeText => _base(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textOnSurface,
    height: 1.33,
  );
}