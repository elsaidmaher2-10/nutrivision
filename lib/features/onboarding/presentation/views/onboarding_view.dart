import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/router/route_names.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

/// Onboarding Walkthrough designed from NutriVision Stitch export (nutrivision_4)
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const List<_OnboardingItem> _items = [
    _OnboardingItem(
      title: 'تتبع السعرات بكل سهولة',
      description: 'سجل وجباتك اليومية بدقة وتعرف على السعرات الحرارية والعناصر الغذائية بلمسة واحدة.',
      icon: Icons.local_fire_department_rounded,
      badgeText: 'تتبع يومي دقيق',
      iconColor: AppColors.primary,
      bgColor: AppColors.softMint,
    ),
    _OnboardingItem(
      title: 'تحليل الوجبات بالذكاء الاصطناعي',
      description: 'فقط قم بتصوير طبقك، وسيقوم النظام بتحليله فوراً وتقدير السعرات والمكونات بدقة عالية.',
      icon: Icons.auto_awesome_rounded,
      badgeText: 'تحليل فوري بالذكاء الاصطناعي',
      iconColor: AppColors.teal,
      bgColor: Color(0xFFE0F7F4),
    ),
    _OnboardingItem(
      title: 'البدائل الصحية والأهداف',
      description: 'احصل على اقتراحات لخيارات طعام صحية تناسب ثقافتك الغذائية وتساعدك في تحقيق هدفك اليومي.',
      icon: Icons.eco_rounded,
      badgeText: 'بدائل صحية ومخصصة',
      iconColor: AppColors.orange,
      bgColor: Color(0xFFFFF3E0),
    ),
  ];

  void _onNext() {
    if (_currentPage < _items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(RouteNames.home);
    }
  }

  void _onSkip() {
    context.go(RouteNames.home);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _currentPage == _items.length - 1;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            children: [
              // Top Bar with Skip and Dots Indicator
              _OnboardingTopBar(
                currentPage: _currentPage,
                totalCount: _items.length,
                onSkip: _onSkip,
              ),

              const SizedBox(height: 20),

              // Page Content Carousel
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (page) => setState(() => _currentPage = page),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return _OnboardingSlideWidget(item: item);
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Bottom Action Button
              _OnboardingBottomAction(
                isLast: isLast,
                onPressed: _onNext,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingItem {
  const _OnboardingItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.badgeText,
    required this.iconColor,
    required this.bgColor,
  });

  final String title;
  final String description;
  final IconData icon;
  final String badgeText;
  final Color iconColor;
  final Color bgColor;
}

class _OnboardingTopBar extends StatelessWidget {
  const _OnboardingTopBar({
    required this.currentPage,
    required this.totalCount,
    required this.onSkip,
  });

  final int currentPage;
  final int totalCount;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onSkip,
          child: const Text(
            'تخطي',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Row(
          children: List.generate(totalCount, (index) {
            final isActive = index == currentPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.outlineVariant,
                borderRadius: BorderRadius.circular(9999),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _OnboardingSlideWidget extends StatelessWidget {
  const _OnboardingSlideWidget({required this.item});

  final _OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Hero Visual Card
        NutriCard(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          borderRadius: BorderRadius.circular(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.bgColor,
                ),
                child: Icon(item.icon, size: 52, color: item.iconColor),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(9999),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.auto_awesome, size: 14, color: item.iconColor),
                    const SizedBox(width: 6),
                    Text(
                      item.badgeText,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 36),

        // Text Section
        Text(
          item.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            item.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}

class _OnboardingBottomAction extends StatelessWidget {
  const _OnboardingBottomAction({
    required this.isLast,
    required this.onPressed,
  });

  final bool isLast;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          elevation: 4,
          shadowColor: AppColors.primary.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isLast ? 'ابدأ رحلتك الآن' : 'التالي',
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              isLast ? Icons.check_circle_outline_rounded : Icons.arrow_forward_rounded,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
