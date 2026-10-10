import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = AppSizes.logoMd,
    this.showText = true,
    this.textStyle,
    this.color,
    this.semanticLabel,
  });

  final double size;
  final bool showText;
  final TextStyle? textStyle;
  final Color? color;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppColors.primary;
    final theme = Theme.of(context);

    final Widget logoIcon = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: -4,
          ),
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
            spreadRadius: -6,
          ),
        ],
        border: Border.all(color: AppColors.surfaceLight, width: 4),
      ),
      child: Center(
        child: Icon(
          Icons.eco_outlined,
          size: size * 0.4,
          color: effectiveColor,
        ),
      ),
    );

    if (!showText) {
      return Semantics(
        label: semanticLabel ?? 'NutriVision Logo',
        image: true,
        child: logoIcon,
      );
    }

    return Semantics(
      label: semanticLabel ?? 'NutriVision Logo',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          logoIcon,
          SizedBox(height: AppSizes.spacingMd),
          Text(
            'NutriVision',
            style: textStyle ??
                theme.textTheme.headlineLarge?.copyWith(
                  color: effectiveColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.9,
                ),
          ),
          SizedBox(height: AppSizes.spacingXs),
          Text(
            'نوتري فيجن',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColors.teal,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class AppLogoSmall extends StatelessWidget {
  const AppLogoSmall({
    super.key,
    this.size = AppSizes.logoSm,
    this.color,
    this.semanticLabel,
  });

  final double size;
  final Color? color;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppColors.primary;

    return Semantics(
      label: semanticLabel ?? 'NutriVision Logo',
      image: true,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(AppSizes.radiusFull),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.15),
              blurRadius: 15,
              offset: const Offset(0, 6),
              spreadRadius: -3,
            ),
          ],
          border: Border.all(color: AppColors.surfaceLight, width: 3),
        ),
        child: Center(
          child: Icon(
            Icons.eco_outlined,
            size: size * 0.45,
            color: effectiveColor,
          ),
        ),
      ),
    );
  }
}

class AppLogoAnimated extends StatefulWidget {
  const AppLogoAnimated({
    super.key,
    this.size = AppSizes.logoMd,
    this.duration = AppSizes.durationSlow,
    this.color,
  });

  final double size;
  final Duration duration;
  final Color? color;

  @override
  State<AppLogoAnimated> createState() => _AppLogoAnimatedState();
}

class _AppLogoAnimatedState extends State<AppLogoAnimated> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveColor = widget.color ?? AppColors.primary;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                    spreadRadius: -4,
                  ),
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                    spreadRadius: -6,
                  ),
                ],
                border: Border.all(color: AppColors.surfaceLight, width: 4),
              ),
              child: Center(
                child: Icon(
                  Icons.eco_outlined,
                  size: widget.size * 0.4,
                  color: effectiveColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}