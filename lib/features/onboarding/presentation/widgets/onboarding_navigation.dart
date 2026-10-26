import 'package:flutter/material.dart';
import '../../../../../core/widgets/nutri_button.dart';

class OnboardingNavigation extends StatelessWidget {
  const OnboardingNavigation({
    required this.isLastPage,
    required this.onNext,
    required this.onSkip,
    super.key,
  });

  final bool isLastPage;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          NutriButton(
            label: isLastPage ? 'ابدأ الآن' : 'التالي',
            onPressed: onNext,
          ),
          if (!isLastPage) ...[
            const SizedBox(height: 8),
            TextButton(
              onPressed: onSkip,
              child: const Text(
                'تخطي',
                style: TextStyle(fontFamily: 'Cairo', color: Colors.grey),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
