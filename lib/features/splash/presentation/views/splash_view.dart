import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/router/route_names.dart';
import '../../../../../core/constants/app_colors.dart';

/// Splash Screen designed from NutriVision Stitch export (nutrivision_12)
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _timer = Timer(const Duration(milliseconds: 2800), () {
      if (mounted) {
        context.go(RouteNames.welcome);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Stack(
        children: [
          // Background ambient blurs
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.teal.withValues(alpha: 0.15),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: 0.25),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top Pill Badge
                  const _TopBadgePill(),

                  // Central Brand & Logo Area
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: const _PulsingLogoWidget(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'NutriVision',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                          color: AppColors.onPrimary,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'تغذيتك الذكية بلمسة عربية',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.softMint,
                        ),
                      ),
                    ],
                  ),

                  // Bottom Loading Status
                  const _BottomLoadingSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBadgePill extends StatelessWidget {
  const _TopBadgePill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.eco, size: 16, color: AppColors.softMint),
          SizedBox(width: 8),
          Text(
            'طبيعي 100% • ذكي',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _PulsingLogoWidget extends StatelessWidget {
  const _PulsingLogoWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 104,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surfaceWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Center(
        child: Icon(
          Icons.restaurant,
          size: 54,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class _BottomLoadingSection extends StatelessWidget {
  const _BottomLoadingSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 140,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9999),
            child: const LinearProgressIndicator(
              minHeight: 4,
              backgroundColor: Color(0x33FFFFFF),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.softMint),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'جاري تحضير خطتك الصحية...',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 13,
            color: Color(0xCCFFFFFF),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
