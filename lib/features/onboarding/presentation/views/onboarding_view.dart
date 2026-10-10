import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../app/router/route_names.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../viewmodels/onboarding_viewmodel.dart';
import '../widgets/onboarding_page_view.dart';
import '../widgets/onboarding_navigation.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardingViewModel>(
      create: (_) => OnboardingViewModel(),
      child: const _OnboardingViewContent(),
    );
  }
}

class _OnboardingViewContent extends StatefulWidget {
  const _OnboardingViewContent();

  @override
  State<_OnboardingViewContent> createState() => _OnboardingViewContentState();
}

class _OnboardingViewContentState extends State<_OnboardingViewContent> {
  @override
  void initState() {
    super.initState();
    // Listen for onboarding completion
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<OnboardingViewModel>();
      viewModel.addListener(_onViewModelChanged);
    });
  }

  void _onViewModelChanged() {
    final viewModel = context.read<OnboardingViewModel>();
    if (viewModel.isLastPage && viewModel.currentPage == OnboardingViewModel.totalPages - 1) {
      // Check if user just completed onboarding (by pressing Get Started)
      // The navigation handles this
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingViewModel>(
      builder: (context, viewModel, child) {
        return AppScaffold(
          backgroundColor: AppColors.surfaceLight,
          body: Stack(
            children: [
              // PageView
              PageView.builder(
                controller: viewModel.pageController,
                onPageChanged: viewModel.onPageChanged,
                itemCount: OnboardingViewModel.totalPages,
                itemBuilder: (context, index) {
                  return OnboardingPageView(
                    pageData: viewModel.pages[index],
                    index: index,
                    totalPages: OnboardingViewModel.totalPages,
                  );
                },
              ),

              // Navigation overlay
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: OnboardingNavigation(
                  viewModel: viewModel,
                  onSkip: () => _completeOnboarding(context),
                  onNext: () => viewModel.nextPage(),
                  onGetStarted: () => _completeOnboarding(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _completeOnboarding(BuildContext context) async {
    final viewModel = context.read<OnboardingViewModel>();
    await viewModel.completeOnboarding();
    if (context.mounted) {
      context.go(RouteNames.welcome);
    }
  }
}