import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';

class ForgotPasswordSuccess extends StatelessWidget {
  const ForgotPasswordSuccess({required this.email, super.key});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 72),
        const SizedBox(height: 24),
        const Text(
          'تم الإرسال بنجاح!',
          style: TextStyle(fontFamily: 'Cairo', fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.onSurface),
        ),
        const SizedBox(height: 12),
        Text(
          'تم إرسال رابط استعادة كلمة المرور إلى\n$email',
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'Cairo', fontSize: 14, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
