import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'ليس لديك حساب؟',
          style: TextStyle(fontFamily: 'Cairo', color: AppColors.textSecondary, fontSize: 14),
        ),
        TextButton(
          onPressed: () => context.push('/register'),
          child: const Text(
            'إنشاء حساب',
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
