import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';

class ScannerFrameOverlay extends StatelessWidget {
  const ScannerFrameOverlay({required this.scanProgress, super.key});

  final double scanProgress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 2.5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned(
            top: scanProgress * 260,
            left: 0,
            right: 0,
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.primary,
                boxShadow: [
                  BoxShadow(color: AppColors.primary.withValues(alpha: 0.8), blurRadius: 10, spreadRadius: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
