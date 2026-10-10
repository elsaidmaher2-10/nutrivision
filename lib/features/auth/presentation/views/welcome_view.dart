import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/router/route_names.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_scaffold.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppAuthScaffold(
      backgroundColor: AppColors.surfaceLight,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Hero illustration area
          _buildHeroSection(context),

          SizedBox(height: AppSizes.spacing3xl),

          // Text content
          _buildTextContent(context),

          SizedBox(height: AppSizes.spacing2xl),

          // Feature highlights
          _buildFeatureHighlights(context),

          SizedBox(height: AppSizes.spacing3xl),

          // Action buttons
          _buildActionButtons(context),

          SizedBox(height: AppSizes.spacingLg),

          // Terms and conditions
          _buildTermsFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return AspectRatio(
      aspectRatio: 390 / 256,
      child: Stack(
        children: [
          // Background illustration placeholder
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.softMint,
                  AppColors.surfaceLight,
                  AppColors.warmCream,
                ],
              ),
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.06),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Decorative circles
                Positioned(
                  top: -80,
                  right: -80,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withValues(alpha: 0.1),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -100,
                  left: -100,
                  child: Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.teal.withValues(alpha: 0.1),
                    ),
                  ),
                ),
                // Gradient scrim
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.surfaceLight.withValues(alpha: 0.9),
                        AppColors.surfaceLight.withValues(alpha: 0.2),
                        AppColors.surfaceLight.withValues(alpha: 0.0),
                        AppColors.surfaceLight.withValues(alpha: 0.9),
                      ],
                      stops: const [0.0, 0.3, 0.6, 1.0],
                    ),
                  ),
                ),
                // Floating badge
                Positioned(
                  top: AppSizes.spacingLg,
                  right: AppSizes.spacingLg,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.spacingMd,
                      vertical: AppSizes.spacingXs,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLight.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppStrings.welcomeBadge,
                          style: AppTextStyles.badgeText.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(width: AppSizes.spacingXs),
                        Icon(
                          Icons.verified,
                          size: AppSizes.iconXs,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                // Floating macro pill
                Positioned(
                  bottom: AppSizes.spacingLg,
                  left: AppSizes.spacingLg,
                  right: AppSizes.spacingLg,
                  child: Container(
                    padding: EdgeInsets.all(AppSizes.spacingMd),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLight.withValues(alpha: 0.95),
                      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.accentTeal,
                            borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.local_fire_department,
                              color: AppColors.deepGreen,
                              size: AppSizes.iconMd,
                            ),
                          ),
                        ),
                        SizedBox(width: AppSizes.spacingMd),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.welcomeFloatingTitle,
                                style: AppTextStyles.titleMedium.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                AppStrings.welcomeFloatingSubtitle,
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.overlayGreen.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.primary,
                              size: AppSizes.iconSm,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Padding(
      padding: AppSizes.paddingHorizontalMd,
      child: Column(
        children: [
          Text(
            AppStrings.welcomeTitle,
            style: AppTextStyles.heading1.copyWith(
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.spacingLg),
          Text(
            AppStrings.welcomeDescription,
            style: AppTextStyles.subtitle.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureHighlights(BuildContext context) {
    return Padding(
      padding: AppSizes.paddingHorizontalMd,
      child: Row(
        children: [
          _buildFeatureItem(
            context,
            icon: Icons.restaurant_menu,
            iconColor: AppColors.primary,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            title: 'بدائل صحية',
            subtitle: 'أطباق محلية',
          ),
          SizedBox(width: AppSizes.spacingMd),
          _buildFeatureItem(
            context,
            icon: Icons.local_fire_department,
            iconColor: AppColors.teal,
            backgroundColor: AppColors.teal.withValues(alpha: 0.1),
            title: 'تتبع السعرات',
            subtitle: 'متابعة يومية',
          ),
          SizedBox(width: AppSizes.spacingMd),
          _buildFeatureItem(
            context,
            icon: Icons.camera_alt,
            iconColor: AppColors.orange,
            backgroundColor: AppColors.orange.withValues(alpha: 0.1),
            title: 'تصوير الوجبة',
            subtitle: 'تحليل فوري',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required String title,
    required String subtitle,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(AppSizes.spacingMd),
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        ),
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(AppSizes.radiusFull),
              ),
              child: Center(
                child: Icon(icon, color: iconColor, size: AppSizes.iconLg),
              ),
            ),
            SizedBox(height: AppSizes.spacingMd),
            Text(
              title,
              style: AppTextStyles.featureTitle.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.spacingXs),
            Text(
              subtitle,
              style: AppTextStyles.featureSubtitle.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: AppSizes.paddingHorizontalMd,
      child: Column(
        children: [
          // Primary button - Create Account
          AppButton(
            variant: AppButtonVariant.primary,
            label: AppStrings.welcomeCreateAccount,
            onPressed: () => context.push(RouteNames.register),
            trailingIcon: Icon(
              Icons.arrow_forward_ios,
              size: AppSizes.iconSm,
              color: AppColors.white,
            ),
          ),

          SizedBox(height: AppSizes.spacingLg),

          // Secondary button - Login
          AppButton(
            variant: AppButtonVariant.secondary,
            label: AppStrings.welcomeLogin,
            onPressed: () => context.push(RouteNames.login),
            trailingIcon: Icon(
              Icons.arrow_forward_ios,
              size: AppSizes.iconSm,
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTermsFooter(BuildContext context) {
    return Padding(
      padding: AppSizes.paddingHorizontalMd,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textMuted,
            height: 1.5,
          ),
          children: [
            TextSpan(text: AppStrings.welcomeTermsPrefix),
            TextSpan(
              text: AppStrings.welcomePrivacy,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primaryDark,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryDark,
              ),
            ),
            TextSpan(text: AppStrings.welcomeAnd),
            TextSpan(
              text: AppStrings.welcomeTerms,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primaryDark,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}