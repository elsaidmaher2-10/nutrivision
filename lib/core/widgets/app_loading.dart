import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
    this.size = AppSizes.iconLg,
    this.strokeWidth = 3,
    this.color,
    this.backgroundColor,
    this.semanticLabel,
  });

  final double size;
  final double strokeWidth;
  final Color? color;
  final Color? backgroundColor;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppColors.primary;
    final effectiveBackgroundColor = backgroundColor ?? AppColors.primary.withValues(alpha: 0.1);

    return Semantics(
      label: semanticLabel ?? 'جاري التحميل',
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
          backgroundColor: effectiveBackgroundColor,
        ),
      ),
    );
  }
}

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.message,
    this.barrierColor = Colors.black26,
    this.loadingColor,
  });

  final bool isLoading;
  final Widget child;
  final String? message;
  final Color barrierColor;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          ModalBarrier(
            color: barrierColor,
            dismissible: false,
            semanticsLabel: 'تحميل',
          ),
        if (isLoading)
          Center(
            child: Container(
              padding: EdgeInsets.all(AppSizes.spacing2xl),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow,
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                    spreadRadius: -5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppLoading(color: loadingColor, size: AppSizes.iconXl),
                  if (message != null) ...[
                    SizedBox(height: AppSizes.spacingLg),
                    Text(
                      message!,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class AppLoadingButton extends StatelessWidget {
  const AppLoadingButton({
    super.key,
    this.size = AppSizes.iconMd,
    this.strokeWidth = 2,
    this.color,
  });

  final double size;
  final double strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.white),
      ),
    );
  }
}

class AppShimmer extends StatefulWidget {
  const AppShimmer({
    super.key,
    required this.child,
    this.baseColor = const Color(0xFFE2E9E3),
    this.highlightColor = const Color(0xFFF6FBF4),
    this.duration = const Duration(milliseconds: 1500),
    this.direction = ShimmerDirection.ltr,
  });

  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;
  final ShimmerDirection direction;

  @override
  State<AppShimmer> createState() => _AppShimmerState();
}

enum ShimmerDirection { ltr, rtl, ttb, btt }

class _AppShimmerState extends State<AppShimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            final double start;
            final double end;

            switch (widget.direction) {
              case ShimmerDirection.ltr:
                start = 0;
                end = bounds.width;
                break;
              case ShimmerDirection.rtl:
                start = bounds.width;
                end = 0;
                break;
              case ShimmerDirection.ttb:
                start = 0;
                end = bounds.height;
                break;
              case ShimmerDirection.btt:
                start = bounds.height;
                end = 0;
                break;
            }

            final double position = start + (end - start) * _animation.value;
            final double radius = bounds.shortestSide * 0.6;

            return LinearGradient(
              begin: widget.direction == ShimmerDirection.ltr || widget.direction == ShimmerDirection.rtl
                  ? Alignment.centerLeft
                  : Alignment.topCenter,
              end: widget.direction == ShimmerDirection.ltr || widget.direction == ShimmerDirection.rtl
                  ? Alignment.centerRight
                  : Alignment.bottomCenter,
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: const [0.0, 0.5, 1.0],
              transform: _GradientTransform(
                position: position,
                radius: radius,
                direction: widget.direction,
              ),
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}

class _GradientTransform extends GradientTransform {
  const _GradientTransform({
    required this.position,
    required this.radius,
    required this.direction,
  });

  final double position;
  final double radius;
  final ShimmerDirection direction;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    final double translateX;
    final double translateY;

    switch (direction) {
      case ShimmerDirection.ltr:
      case ShimmerDirection.rtl:
        translateX = position - bounds.center.dx;
        translateY = 0;
        break;
      case ShimmerDirection.ttb:
      case ShimmerDirection.btt:
        translateX = 0;
        translateY = position - bounds.center.dy;
        break;
    }

    return Matrix4.translationValues(translateX, translateY, 0);
  }
}

class AppSkeleton extends StatelessWidget {
  const AppSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius = AppSizes.radiusMd,
    this.baseColor,
    this.highlightColor,
  });

  final double? width;
  final double? height;
  final double borderRadius;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      baseColor: baseColor ?? AppColors.border,
      highlightColor: highlightColor ?? AppColors.surfaceLight,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: baseColor ?? AppColors.border,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class AppSkeletonText extends StatelessWidget {
  const AppSkeletonText({
    super.key,
    this.lines = 3,
    this.lineHeight = 20,
    this.spacing = 8,
    this.lastLineWidthFactor = 0.6,
    this.baseColor,
    this.highlightColor,
  });

  final int lines;
  final double lineHeight;
  final double spacing;
  final double lastLineWidthFactor;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(lines, (index) {
        final isLastLine = index == lines - 1;
        return Padding(
          padding: EdgeInsets.only(bottom: index == lines - 1 ? 0 : spacing),
          child: AppSkeleton(
            height: lineHeight,
            width: isLastLine ? null : double.infinity,
            baseColor: baseColor,
            highlightColor: highlightColor,
          ),
        );
      }),
    );
  }
}