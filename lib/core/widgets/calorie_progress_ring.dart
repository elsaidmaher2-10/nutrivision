import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Circular progress ring visualizing consumed vs target calories.
class CalorieProgressRing extends StatelessWidget {
  const CalorieProgressRing({
    required this.consumedCalories,
    required this.targetCalories,
    super.key,
    this.size = 84.0,
    this.strokeWidth = 7.0,
  });

  final int consumedCalories;
  final int targetCalories;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final percentage = targetCalories > 0
        ? (consumedCalories / targetCalories).clamp(0.0, 1.0)
        : 0.0;
    final percentInt = (percentage * 100).toInt();

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _RingPainter(
              progress: percentage,
              backgroundColor: AppColors.surfaceContainer,
              progressColor: AppColors.primary,
              strokeWidth: strokeWidth,
            ),
          ),
          Text(
            '$percentInt%',
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
    required this.strokeWidth,
  });

  final double progress;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, bgPaint);

    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * progress;
    // Start from top (-pi / 2)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
