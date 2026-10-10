import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData get lightTheme {
    final ColorScheme colorScheme = ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.softMint,
      onPrimaryContainer: AppColors.deepGreen,
      secondary: AppColors.teal,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.softMint,
      onSecondaryContainer: AppColors.deepGreen,
      tertiary: AppColors.orange,
      onTertiary: AppColors.white,
      tertiaryContainer: const Color(0xFFFFF3E0),
      onTertiaryContainer: const Color(0xFFE65100),
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: const Color(0xFFFFEBEE),
      onErrorContainer: const Color(0xFFB71C1C),
      surface: AppColors.white,
      onSurface: AppColors.textPrimary,
      surfaceContainerHighest: AppColors.surfaceVariant,
      onSurfaceVariant: AppColors.textSecondary,
      outline: AppColors.border,
      outlineVariant: AppColors.border,
      shadow: AppColors.textPrimary.withOpacity(0.1),
      scrim: AppColors.textPrimary.withOpacity(0.5),
      inverseSurface: AppColors.textPrimary,
      onInverseSurface: AppColors.white,
      inversePrimary: AppColors.teal,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: GoogleFonts.cairo().fontFamily,
      textTheme: _textTheme,
      scaffoldBackgroundColor: AppColors.surfaceLight,
      appBarTheme: _appBarTheme(colorScheme),
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      textButtonTheme: _textButtonTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      cardTheme: _cardTheme(colorScheme),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(colorScheme),
      navigationBarTheme: _navigationBarTheme(colorScheme),
      tabBarTheme: _tabBarTheme(colorScheme),
      chipTheme: _chipTheme(colorScheme),
      dividerTheme: _dividerTheme(colorScheme),
      listTileTheme: _listTileTheme(colorScheme),
      dialogTheme: _dialogTheme(colorScheme),
      bottomSheetTheme: _bottomSheetTheme(colorScheme),
      snackBarTheme: _snackBarTheme(colorScheme),
      floatingActionButtonTheme: _floatingActionButtonTheme(colorScheme),
      progressIndicatorTheme: _progressIndicatorTheme(colorScheme),
      checkboxTheme: _checkboxTheme(colorScheme),
      radioTheme: _radioTheme(colorScheme),
      switchTheme: _switchTheme(colorScheme),
      sliderTheme: _sliderTheme(colorScheme),
      tooltipTheme: _tooltipTheme(colorScheme),
    );
  }

  static TextTheme _textTheme = TextTheme(
    displayLarge: AppTextStyles.displayLarge,
    displayMedium: AppTextStyles.displayMedium,
    displaySmall: AppTextStyles.displaySmall,
    headlineLarge: AppTextStyles.headlineLarge,
    headlineMedium: AppTextStyles.headlineMedium,
    headlineSmall: AppTextStyles.headlineSmall,
    titleLarge: AppTextStyles.titleLarge,
    titleMedium: AppTextStyles.titleMedium,
    titleSmall: AppTextStyles.titleSmall,
    bodyLarge: AppTextStyles.bodyLarge,
    bodyMedium: AppTextStyles.bodyMedium,
    bodySmall: AppTextStyles.bodySmall,
    labelLarge: AppTextStyles.labelLarge,
    labelMedium: AppTextStyles.labelMedium,
    labelSmall: AppTextStyles.labelSmall,
  );

  static AppBarTheme _appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.titleLarge.copyWith(color: colorScheme.onSurface),
      iconTheme: IconThemeData(color: colorScheme.onSurface, size: AppSizes.iconMd),
      actionsIconTheme: IconThemeData(color: colorScheme.onSurface, size: AppSizes.iconMd),
      toolbarHeight: kToolbarHeight,
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        disabledBackgroundColor: colorScheme.primary.withOpacity(0.38),
        disabledForegroundColor: colorScheme.onPrimary.withOpacity(0.38),
        elevation: 0,
        shadowColor: colorScheme.primary.withOpacity(0.3),
        minimumSize: Size(double.infinity, AppSizes.buttonHeight),
        padding: EdgeInsetsDirectional.symmetric(horizontal: AppSizes.spacingLg, vertical: AppSizes.spacingMd),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
        textStyle: AppTextStyles.buttonText,
        side: BorderSide.none,
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.primary.withOpacity(0.1);
            }
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.primary.withOpacity(0.2);
            }
            return null;
          },
        ),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        disabledForegroundColor: colorScheme.primary.withOpacity(0.38),
        minimumSize: Size(double.infinity, AppSizes.buttonHeight),
        padding: EdgeInsetsDirectional.symmetric(horizontal: AppSizes.spacingLg, vertical: AppSizes.spacingMd),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
        textStyle: AppTextStyles.buttonTextSecondary,
        side: BorderSide(color: colorScheme.primary, width: 1.5),
        backgroundColor: Colors.transparent,
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.primary.withOpacity(0.08);
            }
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.primary.withOpacity(0.12);
            }
            return null;
          },
        ),
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.primary,
        disabledForegroundColor: colorScheme.primary.withOpacity(0.38),
        minimumSize: Size(64, AppSizes.buttonHeightSm),
        padding: EdgeInsetsDirectional.symmetric(horizontal: AppSizes.spacingMd, vertical: AppSizes.spacingSm),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
        textStyle: AppTextStyles.labelLarge.copyWith(color: colorScheme.primary),
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.primary.withOpacity(0.08);
            }
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.primary.withOpacity(0.12);
            }
            return null;
          },
        ),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surface,
      contentPadding: EdgeInsetsDirectional.symmetric(horizontal: AppSizes.spacingLg, vertical: AppSizes.spacingMd),
      border: _inputBorder(colorScheme.outline),
      enabledBorder: _inputBorder(colorScheme.outline),
      focusedBorder: _inputBorder(colorScheme.primary, width: 2),
      errorBorder: _inputBorder(colorScheme.error),
      focusedErrorBorder: _inputBorder(colorScheme.error, width: 2),
      disabledBorder: _inputBorder(colorScheme.outlineVariant),
      labelStyle: AppTextStyles.inputLabel.copyWith(color: colorScheme.onSurfaceVariant),
      hintStyle: AppTextStyles.inputHint.copyWith(color: colorScheme.onSurfaceVariant.withOpacity(0.6)),
      floatingLabelStyle: AppTextStyles.inputLabel.copyWith(color: colorScheme.primary),
      errorStyle: AppTextStyles.errorText,
      helperStyle: AppTextStyles.bodySmall.copyWith(color: colorScheme.onSurfaceVariant),
      counterStyle: AppTextStyles.bodySmall.copyWith(color: colorScheme.onSurfaceVariant),
      prefixIconColor: colorScheme.onSurfaceVariant,
      suffixIconColor: colorScheme.onSurfaceVariant,
      iconColor: colorScheme.onSurfaceVariant,
      hoverColor: colorScheme.primary.withOpacity(0.04),
      focusColor: colorScheme.primary.withOpacity(0.08),
      errorMaxLines: 3,
      alignLabelWithHint: false,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
    );
  }

  static OutlineInputBorder _inputBorder(Color color, {double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  static CardThemeData _cardTheme(ColorScheme colorScheme) {
    return CardThemeData(
      color: colorScheme.surface,
      surfaceTintColor: colorScheme.surfaceTint,
      shadowColor: colorScheme.shadow,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusLg)),
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
    );
  }

  static BottomNavigationBarThemeData _bottomNavigationBarTheme(ColorScheme colorScheme) {
    return BottomNavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurfaceVariant,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: AppTextStyles.labelSmall,
      unselectedLabelStyle: AppTextStyles.labelSmall,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    );
  }

  static NavigationBarThemeData _navigationBarTheme(ColorScheme colorScheme) {
    return NavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surfaceTint,
      indicatorColor: colorScheme.primaryContainer,
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextStyles.labelSmall.copyWith(color: colorScheme.onPrimaryContainer);
          }
          return AppTextStyles.labelSmall.copyWith(color: colorScheme.onSurfaceVariant);
        },
      ),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: colorScheme.onPrimaryContainer, size: AppSizes.iconMd);
          }
          return IconThemeData(color: colorScheme.onSurfaceVariant, size: AppSizes.iconMd);
        },
      ),
      height: 72,
      elevation: 8,
    );
  }

  static TabBarThemeData _tabBarTheme(ColorScheme colorScheme) {
    return TabBarThemeData(
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      indicatorColor: colorScheme.primary,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: AppTextStyles.titleMedium,
      unselectedLabelStyle: AppTextStyles.titleMedium,
      dividerColor: Colors.transparent,
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.primary.withOpacity(0.08);
          }
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.primary.withOpacity(0.12);
          }
          return null;
        },
      ),
    );
  }

  static ChipThemeData _chipTheme(ColorScheme colorScheme) {
    return ChipThemeData(
      backgroundColor: colorScheme.surfaceContainerHighest,
      disabledColor: colorScheme.surfaceContainerHighest.withOpacity(0.38),
      selectedColor: colorScheme.primaryContainer,
      secondarySelectedColor: colorScheme.secondaryContainer,
      padding: EdgeInsetsDirectional.symmetric(horizontal: AppSizes.spacingMd, vertical: AppSizes.spacingXs),
      labelStyle: AppTextStyles.labelMedium.copyWith(color: colorScheme.onSurface),
      secondaryLabelStyle: AppTextStyles.labelMedium.copyWith(color: colorScheme.onSecondaryContainer),
      brightness: Brightness.light,
      elevation: 0,
      pressElevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusFull)),
      side: BorderSide(color: colorScheme.outlineVariant),
      selectedShadowColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }

  static DividerThemeData _dividerTheme(ColorScheme colorScheme) {
    return DividerThemeData(
      color: colorScheme.outlineVariant,
      thickness: 1,
      space: 1,
      indent: 0,
      endIndent: 0,
    );
  }

  static ListTileThemeData _listTileTheme(ColorScheme colorScheme) {
    return ListTileThemeData(
      contentPadding: EdgeInsetsDirectional.symmetric(horizontal: AppSizes.spacingLg, vertical: AppSizes.spacingSm),
      titleTextStyle: AppTextStyles.bodyLarge.copyWith(color: colorScheme.onSurface),
      subtitleTextStyle: AppTextStyles.bodyMedium.copyWith(color: colorScheme.onSurfaceVariant),
      leadingAndTrailingTextStyle: AppTextStyles.bodyMedium.copyWith(color: colorScheme.onSurfaceVariant),
      iconColor: colorScheme.onSurfaceVariant,
      textColor: colorScheme.onSurface,
      selectedColor: colorScheme.primaryContainer,
      tileColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
      horizontalTitleGap: AppSizes.spacingMd,
      minVerticalPadding: AppSizes.spacingSm,
      dense: false,
    );
  }

  static DialogThemeData _dialogTheme(ColorScheme colorScheme) {
    return DialogThemeData(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surfaceTint,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusLg)),
      titleTextStyle: AppTextStyles.titleLarge.copyWith(color: colorScheme.onSurface),
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(color: colorScheme.onSurface),
      alignment: Alignment.center,
    );
  }

  static BottomSheetThemeData _bottomSheetTheme(ColorScheme colorScheme) {
    return BottomSheetThemeData(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surfaceTint,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusXl)),
      ),
      modalBackgroundColor: colorScheme.surface,
      clipBehavior: Clip.antiAlias,
      constraints: const BoxConstraints(minWidth: double.infinity),
    );
  }

  static SnackBarThemeData _snackBarTheme(ColorScheme colorScheme) {
    return SnackBarThemeData(
      backgroundColor: colorScheme.inverseSurface,
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(color: colorScheme.onInverseSurface),
      actionTextColor: colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
      behavior: SnackBarBehavior.floating,
      elevation: 6,
      dismissDirection: DismissDirection.horizontal,
      showCloseIcon: false,
      closeIconColor: colorScheme.onInverseSurface,
    );
  }

  static FloatingActionButtonThemeData _floatingActionButtonTheme(ColorScheme colorScheme) {
    return FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 4,
      focusElevation: 6,
      hoverElevation: 6,
      highlightElevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusFull)),
      extendedTextStyle: AppTextStyles.labelLarge.copyWith(color: colorScheme.onPrimary),
      extendedIconLabelSpacing: AppSizes.spacingSm,
    );
  }

  static ProgressIndicatorThemeData _progressIndicatorTheme(ColorScheme colorScheme) {
    return ProgressIndicatorThemeData(
      color: colorScheme.primary,
      linearTrackColor: colorScheme.primaryContainer,
      circularTrackColor: colorScheme.primaryContainer,
      refreshBackgroundColor: colorScheme.surfaceContainerHighest,
    );
  }

  static CheckboxThemeData _checkboxTheme(ColorScheme colorScheme) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        },
      ),
      checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.primary.withOpacity(0.08);
          }
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.primary.withOpacity(0.12);
          }
          return null;
        },
      ),
      side: BorderSide(color: colorScheme.outline, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusSm)),
      splashRadius: 24,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }

  static RadioThemeData _radioTheme(ColorScheme colorScheme) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurfaceVariant;
        },
      ),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.primary.withOpacity(0.08);
          }
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.primary.withOpacity(0.12);
          }
          return null;
        },
      ),
      splashRadius: 24,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }

  static SwitchThemeData _switchTheme(ColorScheme colorScheme) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.outline;
        },
      ),
      trackColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary.withOpacity(0.5);
          }
          return colorScheme.surfaceContainerHighest;
        },
      ),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.primary.withOpacity(0.08);
          }
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.primary.withOpacity(0.12);
          }
          return null;
        },
      ),
      splashRadius: 24,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.outline;
        },
      ),
      trackOutlineWidth: WidgetStateProperty.all(0),
    );
  }

  static SliderThemeData _sliderTheme(ColorScheme colorScheme) {
    return SliderThemeData(
      activeTrackColor: colorScheme.primary,
      inactiveTrackColor: colorScheme.primaryContainer,
      thumbColor: colorScheme.primary,
      overlayColor: colorScheme.primary.withOpacity(0.12),
      valueIndicatorColor: colorScheme.primary,
      valueIndicatorTextStyle: AppTextStyles.labelSmall.copyWith(color: colorScheme.onPrimary),
      activeTickMarkColor: colorScheme.primary,
      inactiveTickMarkColor: colorScheme.outlineVariant,
      disabledActiveTrackColor: colorScheme.primary.withOpacity(0.38),
      disabledInactiveTrackColor: colorScheme.primaryContainer.withOpacity(0.38),
      disabledThumbColor: colorScheme.onSurface.withOpacity(0.38),
      disabledActiveTickMarkColor: colorScheme.primary.withOpacity(0.38),
      disabledInactiveTickMarkColor: colorScheme.outlineVariant.withOpacity(0.38),
      trackHeight: 4,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      showValueIndicator: ShowValueIndicator.onlyForDiscrete,
      // enableSidePadding is not available in newer Flutter versions
    );
  }

  static TooltipThemeData _tooltipTheme(ColorScheme colorScheme) {
    return TooltipThemeData(
      decoration: BoxDecoration(
        color: colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      textStyle: AppTextStyles.labelSmall.copyWith(color: colorScheme.onInverseSurface),
      padding: EdgeInsetsDirectional.symmetric(horizontal: AppSizes.spacingMd, vertical: AppSizes.spacingSm),
      margin: EdgeInsets.zero,
      verticalOffset: 8,
      preferBelow: true,
      excludeFromSemantics: false,
      waitDuration: const Duration(milliseconds: 500),
      showDuration: const Duration(seconds: 3),
    );
  }
}