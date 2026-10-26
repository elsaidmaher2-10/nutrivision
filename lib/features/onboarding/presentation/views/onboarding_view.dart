import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';
import '../viewmodels/onboarding_viewmodel.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/onboarding_navigation.dart';
import '../widgets/onboarding_page_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _vm = OnboardingViewModel();

  @override
  void initState() {
    super.initState();
    _vm.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _vm.pageController,
                itemCount: _vm.pages.length,
                onPageChanged: _vm.onPageChanged,
                itemBuilder: (_, i) => OnboardingPageView(pageData: _vm.pages[i]),
              ),
            ),
            OnboardingIndicator(currentPage: _vm.currentPage, totalPages: _vm.pages.length),
            OnboardingNavigation(
              isLastPage: _vm.isLastPage,
              onNext: () {
                if (_vm.isLastPage) {
                  context.go('/welcome');
                } else {
                  _vm.nextPage();
                }
              },
              onSkip: () => context.go('/welcome'),
            ),
          ],
        ),
      ),
    );
  }
}
