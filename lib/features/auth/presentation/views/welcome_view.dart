import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/router/route_names.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

/// Welcome / Landing screen designed from NutriVision Stitch export (nutrivision_11)
class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Hero Visual Card
              const _WelcomeHeroCard(),

              const SizedBox(height: 28),

              // Title and Description
              const _WelcomeHeaderSection(),

              const SizedBox(height: 28),

              // 3 Features Grid
              const _WelcomeFeatureGrid(),

              const SizedBox(height: 36),

              // Action Buttons
              _WelcomeActionButtons(
                onCreateAccount: () => context.push(RouteNames.register),
                onLogin: () => context.push(RouteNames.login),
              ),

              const SizedBox(height: 16),

              // Terms & Privacy Note
              const _TermsPrivacyFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeHeroCard extends StatelessWidget {
  const _WelcomeHeroCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF21865B),
            Color(0xFF15563D),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F21865B),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background ambient circles
          Positioned(
            top: -40,
            left: -40,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            right: -30,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.teal.withValues(alpha: 0.15),
              ),
            ),
          ),

          // Central Visual Icon
          const Center(
            child: Icon(
              Icons.eco_rounded,
              size: 96,
              color: Color(0x2EFFFFFF),
            ),
          ),

          // Top Badge
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(9999),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.verified, size: 16, color: AppColors.secondaryContainer),
                  SizedBox(width: 6),
                  Text(
                    'تغذية ذكية 100%',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Interactive Macro Pill
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.surfaceWhite.withValues(alpha: 0.95),
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1F000000),
                    blurRadius: 16,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.softMint,
                    ),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: AppColors.primary,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'سعراتك محسوبة بدقة',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.onSurface,
                          ),
                        ),
                        Text(
                          'حلل طبقك الآن بكاميرا هاتفك',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 11,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.softMint,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WelcomeHeaderSection extends StatelessWidget {
  const _WelcomeHeaderSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'رحلتك الصحية تبدأ هنا',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppColors.onSurface,
            height: 1.3,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'اكتشف تحليلاً دقيقاً لوجباتك، تتبع سعراتك بكل سهولة، واحصل على بدائل صحية ذكية تناسب أهدافك.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _WelcomeFeatureGrid extends StatelessWidget {
  const _WelcomeFeatureGrid();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _FeatureTile(
            icon: Icons.photo_camera_outlined,
            iconColor: AppColors.primary,
            bgColor: AppColors.softMint,
            title: 'تصوير الوجبة',
            subtitle: 'تحليل فوري',
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _FeatureTile(
            icon: Icons.insights_outlined,
            iconColor: AppColors.teal,
            bgColor: Color(0xFFE0F7F4),
            title: 'تتبع السعرات',
            subtitle: 'متابعة يومية',
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _FeatureTile(
            icon: Icons.restaurant_menu_outlined,
            iconColor: AppColors.orange,
            bgColor: Color(0xFFFFF3E0),
            title: 'بدائل صحية',
            subtitle: 'أطباق محلية',
          ),
        ),
      ],
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _WelcomeActionButtons extends StatelessWidget {
  const _WelcomeActionButtons({
    required this.onCreateAccount,
    required this.onLogin,
  });

  final VoidCallback onCreateAccount;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 56,
          child: ElevatedButton.icon(
            onPressed: onCreateAccount,
            icon: const Icon(Icons.person_add_alt_1_rounded, size: 20),
            label: const Text(
              'إنشاء حساب جديد',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.onPrimary,
              elevation: 4,
              shadowColor: AppColors.primary.withValues(alpha: 0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 56,
          child: OutlinedButton.icon(
            onPressed: onLogin,
            icon: const Icon(Icons.login_rounded, size: 20, color: AppColors.primary),
            label: const Text(
              'تسجيل الدخول',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.surfaceWhite,
              side: const BorderSide(color: AppColors.primary, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TermsPrivacyFooter extends StatelessWidget {
  const _TermsPrivacyFooter();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'بالتضامن مع أهدافك، فإنك توافق على شروط الاستخدام وسياسة الخصوصية',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 11,
        color: AppColors.textSecondary,
        height: 1.5,
      ),
    );
  }
}
