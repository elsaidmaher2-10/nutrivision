import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/widgets/app_button.dart';
import '../viewmodels/onboarding_viewmodel.dart';
import 'onboarding_indicator.dart';

class OnboardingNavigation extends StatelessWidget {
  const OnboardingNavigation({
    super.key,
    required this.viewModel,
    this.onSkip,
    this.onNext,
    this.onGetStarted,
  });

  final OnboardingViewModel viewModel;
  final VoidCallback? onSkip;
  final VoidCallback? onNext;
  final VoidCallback? onGetStarted;

  @override
  Widget build(BuildContext context) {
    final isLastPage = viewModel.isLastPage;

    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSizes.screenMargin,
        end: AppSizes.screenMargin,
        top: AppSizes.spacingLg,
        bottom: AppSizes.spacingXl,
      ),
      child: Column(
        children: [
          // Page indicator
          OnboardingIndicator(
            currentPage: viewModel.currentPage,
            totalPages: OnboardingViewModel.totalPages,
          ),

          SizedBox(height: AppSizes.spacing2xl),

          // Navigation buttons
          Row(
            children: [
              // Skip button (only on non-last pages)
              if (!isLastPage)
                Expanded(
                  child: AppButton(
                    variant: AppButtonVariant.text,
                    label: AppStrings.onboardingSkip,
                    onPressed: onSkip ?? viewModel.completeOnboarding,
                    fullWidth: false,
                  ),
                )
              else
                const Expanded(child: SizedBox.shrink()),

              // Back button (only on non-first pages)
              if (viewModel.currentPage > 0)
                Expanded(
                  child: AppButton(
                    variant: AppButtonVariant.outlined,
                    label: AppStrings.onboardingBack,
                    onPressed: () => viewModel.previousPage(),
                    leadingIcon: Icon(
                      Icons.arrow_back_ios_new,
                      size: AppSizes.iconSm,
                    ),
                    fullWidth: true,
                  ),
                )
              else if (!isLastPage)
                const Expanded(child: SizedBox.shrink())
              else
                const SizedBox.shrink(),

              // Next / Get Started button
              if (!isLastPage)
                Expanded(
                  flex: viewModel.currentPage > 0 ? 1 : 2,
                  child: AppButton(
                    variant: AppButtonVariant.primary,
                    label: AppStrings.onboardingNext,
                    onPressed: onNext ?? viewModel.nextPage,
                    trailingIcon: Icon(
                      Icons.arrow_forward_ios,
                      size: AppSizes.iconSm,
                    ),
                    fullWidth: true,
                  ),
                )
              else
                Expanded(
                  child: AppButton(
                    variant: AppButtonVariant.primary,
                    label: AppStrings.onboardingGetStarted,
                    onPressed: onGetStarted ?? viewModel.completeOnboarding,
                    trailingIcon: Icon(
                      Icons.arrow_forward_ios,
                      size: AppSizes.iconSm,
                    ),
                    fullWidth: true,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}