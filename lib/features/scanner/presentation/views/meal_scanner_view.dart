import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';

/// Smart AI Meal Scanner View designed from NutriVision Stitch export (nutrivision_14)
class MealScannerView extends StatefulWidget {
  const MealScannerView({super.key});

  @override
  State<MealScannerView> createState() => _MealScannerViewState();
}

class _MealScannerViewState extends State<MealScannerView> with SingleTickerProviderStateMixin {
  late AnimationController _scanController;
  bool _flashOn = false;
  bool _isAnalyzing = false;

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _scanController.dispose();
    super.dispose();
  }

  void _onCapture() {
    setState(() => _isAnalyzing = true);
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        setState(() => _isAnalyzing = false);
        context.push('/meal-details', extra: 'طبق كشري مصري متوسط');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Simulated Camera Background
          const _CameraBackgroundPattern(),

          // Camera Frame Viewfinder with Scanning Line
          SafeArea(
            child: Column(
              children: [
                _ScannerTopBar(
                  flashOn: _flashOn,
                  onToggleFlash: () => setState(() => _flashOn = !_flashOn),
                  onClose: () => context.pop(),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: _ScannerViewfinderFrame(
                      animation: _scanController,
                      isAnalyzing: _isAnalyzing,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _ScannerBottomControls(
                  isAnalyzing: _isAnalyzing,
                  onCapture: _onCapture,
                  onGalleryPick: _onCapture,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CameraBackgroundPattern extends StatelessWidget {
  const _CameraBackgroundPattern();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF141915),
            Color(0xFF0A0F0B),
          ],
        ),
      ),
      child: Center(
        child: Icon(
          Icons.restaurant_rounded,
          size: 160,
          color: Colors.white.withValues(alpha: 0.04),
        ),
      ),
    );
  }
}

class _ScannerTopBar extends StatelessWidget {
  const _ScannerTopBar({
    required this.flashOn,
    required this.onToggleFlash,
    required this.onClose,
  });

  final bool flashOn;
  final VoidCallback onToggleFlash;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close_rounded, color: Colors.white, size: 28),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(9999),
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.auto_awesome, color: AppColors.secondaryContainer, size: 16),
                SizedBox(width: 8),
                Text(
                  'تحليل الوجبة الذكي',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onToggleFlash,
            icon: Icon(
              flashOn ? Icons.flash_on_rounded : Icons.flash_off_rounded,
              color: flashOn ? AppColors.orange : Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScannerViewfinderFrame extends StatelessWidget {
  const _ScannerViewfinderFrame({
    required this.animation,
    required this.isAnalyzing,
  });

  final Animation<double> animation;
  final bool isAnalyzing;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Stack(
        children: [
          // Corner brackets
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isAnalyzing ? AppColors.teal : AppColors.primary,
                width: 2.5,
              ),
            ),
          ),

          // Scanning Line
          if (!isAnalyzing)
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Align(
                  alignment: Alignment(0, (animation.value * 2) - 1),
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.8),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          AppColors.primary.withValues(alpha: 0.9),
                          AppColors.secondaryContainer,
                          AppColors.primary.withValues(alpha: 0.9),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

          // Analyzing loader overlay
          if (isAnalyzing)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: AppColors.secondaryContainer,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'جاري التحليل والتعرف على المكونات...',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Hint Pill
          if (!isAnalyzing)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: const Text(
                  'ضع الطبق داخل الإطار لالتقاط المكونات بدقة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ScannerBottomControls extends StatelessWidget {
  const _ScannerBottomControls({
    required this.isAnalyzing,
    required this.onCapture,
    required this.onGalleryPick,
  });

  final bool isAnalyzing;
  final VoidCallback onCapture;
  final VoidCallback onGalleryPick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Gallery pick button
          IconButton(
            onPressed: isAnalyzing ? null : onGalleryPick,
            icon: const Icon(Icons.photo_library_outlined, color: Colors.white, size: 30),
            tooltip: 'معرض الصور',
          ),

          // Central Shutter Button
          GestureDetector(
            onTap: isAnalyzing ? null : onCapture,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
              ),
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: const Center(
                  child: Icon(Icons.camera_alt, color: Colors.white, size: 32),
                ),
              ),
            ),
          ),

          // Tips / Switch Camera
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.flip_camera_ios_outlined, color: Colors.white, size: 28),
            tooltip: 'تبديل الكاميرا',
          ),
        ],
      ),
    );
  }
}
