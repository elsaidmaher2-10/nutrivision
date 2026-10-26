import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NutriCalorieRing extends StatelessWidget {
  const NutriCalorieRing({
    required this.consumed,
    required this.target,
    super.key,
    this.size = 84.0,
    this.strokeWidth = 7.0,
  });

  final int consumed;
  final int target;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final pct = target > 0 ? (consumed / target).clamp(0.0, 1.0) : 0.0;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _RingPainter(progress: pct, strokeWidth: strokeWidth),
          ),
          Text(
            '${(pct * 100).toInt()}%',
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
  const _RingPainter({required this.progress, required this.strokeWidth});
  final double progress;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final r = (size.width - strokeWidth) / 2;
    canvas.drawCircle(c, r, Paint()..color = AppColors.surfaceContainer..style = PaintingStyle.stroke..strokeWidth = strokeWidth);
    canvas.drawArc(Rect.fromCircle(center: c, radius: r), -math.pi / 2, 2 * math.pi * progress, false,
      Paint()..color = AppColors.primary..style = PaintingStyle.stroke..strokeWidth = strokeWidth..strokeCap = StrokeCap.round);
  }

  @override
  bool shouldRepaint(covariant _RingPainter old) => old.progress != progress;
}
