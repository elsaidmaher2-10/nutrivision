import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';
import '../widgets/welcome_hero_section.dart';
import '../widgets/welcome_features_grid.dart';
import '../widgets/welcome_cta_buttons.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const WelcomeHeroSection(),
              const SizedBox(height: 32),
              const WelcomeFeaturesGrid(),
              const SizedBox(height: 40),
              WelcomeCtaButtons(
                onCreateAccount: () => context.push('/register'),
                onLogin: () => context.push('/login'),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
