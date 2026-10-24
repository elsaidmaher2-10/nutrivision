import 'package:flutter/material.dart';

/// App color palette defined in NutriVision Stitch DESIGN.md
abstract final class AppColors {
  // Brand Anchors
  static const Color primary = Color(0xFF21865B);
  static const Color primaryDark = Color(0xFF006B45);
  static const Color deepGreen = Color(0xFF15563D);
  static const Color primaryContainer = Color(0xFF21865B);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color textOnPrimary = onPrimary;

  // Secondary (Fresh Teal)
  static const Color secondary = Color(0xFF006A60);
  static const Color teal = Color(0xFF36AFA0);
  static const Color secondaryContainer = Color(0xFF85F6E5);
  static const Color onSecondaryContainer = Color(0xFF007166);
  static const Color accentTeal = secondaryContainer;

  // Tertiary (Energy Orange / Warm Ochre)
  static const Color tertiary = Color(0xFF894F05);
  static const Color orange = Color(0xFFF2A65A);
  static const Color tertiaryContainer = Color(0xFFA76720);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color accentOrange = orange;

  // Backgrounds & Surfaces (Warm Cream & Fresh White)
  static const Color background = Color(0xFFFAF8F1);
  static const Color warmCream = Color(0xFFFAF8F1);
  static const Color surface = Color(0xFFFAF8F1);
  static const Color surfaceLight = Color(0xFFF6FBF4);
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  static const Color surfaceContainer = Color(0xFFEAEFE9);
  static const Color surfaceVariant = Color(0xFFEAEFE9);
  static const Color surfaceContainerLow = Color(0xFFF0F5EF);
  static const Color surfaceContainerHigh = Color(0xFFE5E9E3);
  static const Color surfaceContainerHighest = Color(0xFFDFE4DE);
  static const Color softMint = Color(0xFFE5F4EA);
  static const Color white = Color(0xFFFFFFFF);

  // Neutrals & Text
  static const Color onSurface = Color(0xFF181D19);
  static const Color textOnSurface = onSurface;
  static const Color textPrimary = Color(0xFF20352B);
  static const Color onSurfaceVariant = Color(0xFF3E4942);
  static const Color textSecondary = Color(0xFF718078);
  static const Color textHint = onSurfaceVariant;
  static const Color textMuted = outline;
  static const Color outline = Color(0xFF6E7A71);
  static const Color outlineVariant = Color(0xFFBEC9C0);
  static const Color border = Color(0xFFE2E9E3);

  // Alerts & Errors
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onError = Color(0xFFFFFFFF);

  // Ambient Shadows
  static const Color ambientShadow = Color(0x0F21865B); // rgba(33, 134, 91, 0.06)
}
