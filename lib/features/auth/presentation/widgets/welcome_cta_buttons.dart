import 'package:flutter/material.dart';
import '../../../../../core/widgets/nutri_button.dart';

class WelcomeCtaButtons extends StatelessWidget {
  const WelcomeCtaButtons({
    required this.onCreateAccount,
    required this.onLogin,
    super.key,
  });

  final VoidCallback onCreateAccount;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NutriButton(
          label: 'إنشاء حساب مجاني',
          onPressed: onCreateAccount,
          icon: Icons.rocket_launch_rounded,
        ),
        const SizedBox(height: 12),
        NutriButton(
          label: 'تسجيل الدخول',
          onPressed: onLogin,
          isOutlined: true,
        ),
      ],
    );
  }
}
