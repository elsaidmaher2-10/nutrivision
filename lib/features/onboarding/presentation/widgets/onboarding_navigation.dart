import 'package:flutter/material.dart';

import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/widgets/app_button.dart';
import '../viewmodels/onboarding_viewmodel.dart';

class OnboardingNavigation extends StatelessWidget {
  const OnboardingNavigation({
    super.key,
    required this.viewModel,
    this.onNext,
    this.onBack,
    this.onGetStarted,
  });

  final OnboardingViewModel viewModel;
  final VoidCallback? onNext;
  final VoidCallback? onBack;
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
          // Navigation buttons
          Row(
            children: [
              // Back button (only on non-first pages)
              if (viewModel.currentPage > 0)
                Expanded(
                  child: AppButton(
                    variant: AppButtonVariant.outlined,
                    label: AppStrings.onboardingBack,
                    onPressed: onBack ?? () => viewModel.previousPage(),
                    leadingIcon: Icon(
                      Icons.arrow_back_ios_new,
                      size: AppSizes.iconSm,
                    ),
                    fullWidth: true,
                  ),
                )
              else
                const Expanded(child: SizedBox.shrink()),

              // Next / Get Started button
              if (!isLastPage)
                Expanded(
                  flex: viewModel.currentPage > 0 ? 1 : 3,
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
