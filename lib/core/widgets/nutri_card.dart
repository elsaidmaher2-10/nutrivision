import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Elevated card with organic green ambient shadow from NutriVision DESIGN.md
class NutriCard extends StatelessWidget {
  const NutriCard({
    required this.child,
    super.key,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor = AppColors.surfaceWhite,
    this.borderColor,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Color backgroundColor;
  final Color? borderColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(16.0);

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: effectiveBorderRadius,
        border: Border.all(
          color: borderColor ?? AppColors.border.withValues(alpha: 0.5),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F21865B), // 0 4px 20px rgba(33, 134, 91, 0.06)
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: effectiveBorderRadius,
        child: InkWell(
          borderRadius: effectiveBorderRadius as BorderRadius?,
          onTap: onTap,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
