import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_text_styles.dart';

enum AppButtonVariant { primary, secondary, outlined, text }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.variant = AppButtonVariant.primary,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.fullWidth = true,
    this.height,
    this.onLongPress,
    this.tooltip,
    this.semanticLabel,
  });

  final VoidCallback? onPressed;
  final String label;
  final AppButtonVariant variant;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool isLoading;
  final bool isDisabled;
  final bool fullWidth;
  final double? height;
  final VoidCallback? onLongPress;
  final String? tooltip;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final bool effectiveDisabled = isDisabled || isLoading || onPressed == null;

    Widget child = _buildChild(context);

    Widget button;
    switch (variant) {
      case AppButtonVariant.primary:
        button = ElevatedButton(
          onPressed: effectiveDisabled ? null : onPressed,
          onLongPress: onLongPress,
          style: _primaryButtonStyle(colorScheme).copyWith(
            minimumSize: WidgetStateProperty.resolveWith<Size?>(
              (states) => Size(fullWidth ? double.infinity : 0, height ?? AppSizes.buttonHeight),
            ),
          ),
          child: child,
        );
        break;
      case AppButtonVariant.secondary:
        button = OutlinedButton(
          onPressed: effectiveDisabled ? null : onPressed,
          onLongPress: onLongPress,
          style: _secondaryButtonStyle(colorScheme).copyWith(
            minimumSize: WidgetStateProperty.resolveWith<Size?>(
              (states) => Size(fullWidth ? double.infinity : 0, height ?? AppSizes.buttonHeight),
            ),
          ),
          child: child,
        );
        break;
      case AppButtonVariant.outlined:
        button = OutlinedButton(
          onPressed: effectiveDisabled ? null : onPressed,
          onLongPress: onLongPress,
          style: _outlinedButtonStyle(colorScheme).copyWith(
            minimumSize: WidgetStateProperty.resolveWith<Size?>(
              (states) => Size(fullWidth ? double.infinity : 0, height ?? AppSizes.buttonHeight),
            ),
          ),
          child: child,
        );
        break;
      case AppButtonVariant.text:
        button = TextButton(
          onPressed: effectiveDisabled ? null : onPressed,
          onLongPress: onLongPress,
          style: _textButtonStyle(colorScheme).copyWith(
            minimumSize: WidgetStateProperty.resolveWith<Size?>(
              (states) => Size(fullWidth ? double.infinity : 0, height ?? AppSizes.buttonHeightSm),
            ),
          ),
          child: child,
        );
        break;
    }

    if (tooltip != null) {
      button = Tooltip(message: tooltip!, child: button);
    }

    if (semanticLabel != null) {
      button = Semantics(label: semanticLabel, button: true, child: button);
    }

    return button;
  }

  Widget _buildChild(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: AppSizes.iconMd,
        height: AppSizes.iconMd,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == AppButtonVariant.primary || variant == AppButtonVariant.secondary
                ? AppColors.white
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }

    final List<Widget> children = [];

    if (leadingIcon != null) {
      children.add(leadingIcon!);
      children.add(SizedBox(width: AppSizes.spacingSm));
    }

    children.add(
      Text(
        label,
        style: _getTextStyle(context),
        textAlign: TextAlign.center,
      ),
    );

    if (trailingIcon != null) {
      children.add(SizedBox(width: AppSizes.spacingSm));
      children.add(trailingIcon!);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (variant) {
      case AppButtonVariant.primary:
        return AppTextStyles.buttonText;
      case AppButtonVariant.secondary:
        return AppTextStyles.buttonTextSecondary;
      case AppButtonVariant.outlined:
        return AppTextStyles.buttonTextSecondary;
      case AppButtonVariant.text:
        return AppTextStyles.labelLarge.copyWith(color: colorScheme.primary);
    }
  }

  ButtonStyle _primaryButtonStyle(ColorScheme colorScheme) {
    return ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      disabledBackgroundColor: colorScheme.primary.withValues(alpha: 0.38),
      disabledForegroundColor: colorScheme.onPrimary.withValues(alpha: 0.38),
      elevation: 0,
      shadowColor: colorScheme.primary.withValues(alpha: 0.3),
      padding: EdgeInsetsDirectional.symmetric(horizontal: AppSizes.spacingLg, vertical: AppSizes.spacingMd),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
      textStyle: AppTextStyles.buttonText,
    ).copyWith(
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.primary.withValues(alpha: 0.1);
          }
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.primary.withValues(alpha: 0.2);
          }
          return null;
        },
      ),
    );
  }

  ButtonStyle _secondaryButtonStyle(ColorScheme colorScheme) {
    return OutlinedButton.styleFrom(
      foregroundColor: colorScheme.primary,
      disabledForegroundColor: colorScheme.primary.withValues(alpha: 0.38),
      backgroundColor: AppColors.surfaceVariant,
      padding: EdgeInsetsDirectional.symmetric(horizontal: AppSizes.spacingLg, vertical: AppSizes.spacingMd),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
      textStyle: AppTextStyles.buttonTextSecondary,
      side: BorderSide(color: colorScheme.primary, width: 1.5),
    ).copyWith(
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.primary.withValues(alpha: 0.08);
          }
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.primary.withValues(alpha: 0.12);
          }
          return null;
        },
      ),
    );
  }

  ButtonStyle _outlinedButtonStyle(ColorScheme colorScheme) {
    return OutlinedButton.styleFrom(
      foregroundColor: colorScheme.primary,
      disabledForegroundColor: colorScheme.primary.withValues(alpha: 0.38),
      padding: EdgeInsetsDirectional.symmetric(horizontal: AppSizes.spacingLg, vertical: AppSizes.spacingMd),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
      textStyle: AppTextStyles.buttonTextSecondary,
      side: BorderSide(color: colorScheme.outline, width: 1.5),
      backgroundColor: Colors.transparent,
    ).copyWith(
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.primary.withValues(alpha: 0.04);
          }
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.primary.withValues(alpha: 0.08);
          }
          return null;
        },
      ),
    );
  }

  ButtonStyle _textButtonStyle(ColorScheme colorScheme) {
    return TextButton.styleFrom(
      foregroundColor: colorScheme.primary,
      disabledForegroundColor: colorScheme.primary.withValues(alpha: 0.38),
      padding: EdgeInsetsDirectional.symmetric(horizontal: AppSizes.spacingMd, vertical: AppSizes.spacingSm),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
      textStyle: AppTextStyles.labelLarge.copyWith(color: colorScheme.primary),
    ).copyWith(
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.primary.withValues(alpha: 0.08);
          }
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.primary.withValues(alpha: 0.12);
          }
          return null;
        },
      ),
    );
  }
}