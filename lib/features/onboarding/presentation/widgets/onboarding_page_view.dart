import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../viewmodels/onboarding_viewmodel.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.pageData,
    required this.index,
    required this.totalPages,
  });

  final OnboardingPageData pageData;
  final int index;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: AppSizes.screenPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top spacer and illustration
                    Column(
                      children: [
                        SizedBox(height: AppSizes.spacing2xl),
                        _buildIllustration(context),
                      ],
                    ),

                    // Content area (centered vertically when there's space)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: AppSizes.spacing3xl),

                        // Title
                        Text(
                          pageData.title,
                          style: AppTextStyles.heading1.copyWith(
                            color: AppColors.textPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: AppSizes.spacingLg),

                        // Description
                        Text(
                          pageData.description,
                          style: AppTextStyles.subtitle.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: AppSizes.spacing3xl),

                        // Feature highlight
                        _buildFeatureHighlight(context),

                        SizedBox(height: AppSizes.spacing3xl),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIllustration(BuildContext context) {
    // Since we don't have actual images, we'll create a decorative placeholder
    // In production, replace with actual Image.asset(pageData.illustrationAsset)
    return Container(
      width: double.infinity,
      height: 280,
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
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
            spreadRadius: -5,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative elements
          Positioned(
            top: -40,
            right: -40,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: 0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            left: -60,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.teal.withValues(alpha: 0.1),
              ),
            ),
          ),
          // Main illustration icon
          Center(child: _getIllustrationIcon()),
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
                    _getPageBadgeText(),
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
        ],
      ),
    );
  }

  Widget _getIllustrationIcon() {
    switch (index) {
      case 0:
        return Icon(
          Icons.eco_outlined,
          size: 120,
          color: AppColors.primary.withValues(alpha: 0.3),
        );
      case 1:
        return Icon(
          Icons.camera_alt_outlined,
          size: 120,
          color: AppColors.teal.withValues(alpha: 0.3),
        );
      case 2:
        return Icon(
          Icons.track_changes_outlined,
          size: 120,
          color: AppColors.orange.withValues(alpha: 0.3),
        );
      default:
        return Icon(
          Icons.eco_outlined,
          size: 120,
          color: AppColors.primary.withValues(alpha: 0.3),
        );
    }
  }

  String _getPageBadgeText() {
    switch (index) {
      case 0:
        return 'صحي 100%';
      case 1:
        return 'تحليل ذكي';
      case 2:
        return 'تتبع دقيق';
      default:
        return 'نوتري فيجن';
    }
  }

  Widget _buildFeatureHighlight(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.spacingLg),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: _getFeatureColor().withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(AppSizes.radiusFull),
            ),
            child: Center(child: _getFeatureIcon()),
          ),
          SizedBox(width: AppSizes.spacingLg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pageData.featureTitle,
                  style: AppTextStyles.featureTitle.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: AppSizes.spacingXs),
                Text(
                  pageData.featureSubtitle,
                  style: AppTextStyles.featureSubtitle.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getFeatureColor() {
    switch (index) {
      case 0:
        return AppColors.primary;
      case 1:
        return AppColors.teal;
      case 2:
        return AppColors.orange;
      default:
        return AppColors.primary;
    }
  }

  Widget _getFeatureIcon() {
    switch (index) {
      case 0:
        return Icon(
          Icons.restaurant_menu,
          color: AppColors.primary,
          size: AppSizes.iconLg,
        );
      case 1:
        return Icon(
          Icons.camera_alt,
          color: AppColors.teal,
          size: AppSizes.iconLg,
        );
      case 2:
        return Icon(
          Icons.track_changes,
          color: AppColors.orange,
          size: AppSizes.iconLg,
        );
      default:
        return Icon(Icons.eco, color: AppColors.primary, size: AppSizes.iconLg);
    }
  }
}
