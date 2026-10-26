import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'لديك حساب بالفعل؟',
          style: TextStyle(fontFamily: 'Cairo', color: AppColors.textSecondary, fontSize: 14),
        ),
        TextButton(
          onPressed: () => context.pop(),
          child: const Text(
            'تسجيل الدخول',
            style: TextStyle(
              fontFamily: 'Cairo',
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
