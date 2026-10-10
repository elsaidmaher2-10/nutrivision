import 'package:flutter/material.dart';

abstract final class AppSizes {
  // Spacing
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 12.0;
  static const double spacingLg = 16.0;
  static const double spacingXl = 20.0;
  static const double spacing2xl = 24.0;
  static const double spacing3xl = 32.0;
  static const double spacing4xl = 40.0;
  static const double spacing5xl = 48.0;
  static const double spacing6xl = 64.0;

  // Padding
  static const EdgeInsets paddingXs = EdgeInsets.all(spacingXs);
  static const EdgeInsets paddingSm = EdgeInsets.all(spacingSm);
  static const EdgeInsets paddingMd = EdgeInsets.all(spacingMd);
  static const EdgeInsets paddingLg = EdgeInsets.all(spacingLg);
  static const EdgeInsets paddingXl = EdgeInsets.all(spacingXl);
  static const EdgeInsets padding2xl = EdgeInsets.all(spacing2xl);

  // Directional padding for RTL support
  static const EdgeInsetsDirectional paddingHorizontalMd = EdgeInsetsDirectional.symmetric(horizontal: spacingMd);
  static const EdgeInsetsDirectional paddingHorizontalLg = EdgeInsetsDirectional.symmetric(horizontal: spacingLg);
  static const EdgeInsetsDirectional paddingHorizontalXl = EdgeInsetsDirectional.symmetric(horizontal: spacingXl);
  static const EdgeInsetsDirectional paddingVerticalMd = EdgeInsetsDirectional.symmetric(vertical: spacingMd);
  static const EdgeInsetsDirectional paddingVerticalLg = EdgeInsetsDirectional.symmetric(vertical: spacingLg);

  // Screen margins
  static const double screenMargin = spacingXl;
  static const EdgeInsetsDirectional screenPadding = EdgeInsetsDirectional.symmetric(horizontal: screenMargin);

  // Border radius
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 9999.0;

  // Button sizes
  static const double buttonHeight = 56.0;
  static const double buttonHeightSm = 48.0;
  static const double buttonHeightLg = 60.0;

  // Input field sizes
  static const double inputHeight = 56.0;
  static const double inputHeightSm = 48.0;

  // Icon sizes
  static const double iconXs = 16.0;
  static const double iconSm = 20.0;
  static const double iconMd = 24.0;
  static const double iconLg = 28.0;
  static const double iconXl = 32.0;
  static const double icon2xl = 40.0;
  static const double icon3xl = 48.0;
  static const double icon4xl = 96.0;

  // Logo sizes
  static const double logoSm = 64.0;
  static const double logoMd = 96.0;
  static const double logoLg = 120.0;

  // Avatar sizes
  static const double avatarSm = 32.0;
  static const double avatarMd = 48.0;
  static const double avatarLg = 64.0;

  // Screen breakpoints
  static const double breakpointSm = 360.0;
  static const double breakpointMd = 600.0;
  static const double breakpointLg = 900.0;
  static const double breakpointXl = 1200.0;

  // Animation durations
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 250);
  static const Duration durationSlow = Duration(milliseconds: 350);
}