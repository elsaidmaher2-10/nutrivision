import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

/// Forgot Password screen designed from NutriVision Stitch export (nutrivision_10)
class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _emailController = TextEditingController();
  bool _isSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSendResetLink() {
    if (_emailController.text.trim().isNotEmpty) {
      setState(() => _isSent = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.onSurface),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _ForgotPasswordHeader(),
              const SizedBox(height: 28),
              if (_isSent)
                const _SuccessSentBanner()
              else ...[
                _EmailField(controller: _emailController),
                const SizedBox(height: 24),
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _onSendResetLink,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.onPrimary,
                      elevation: 4,
                      shadowColor: AppColors.primary.withValues(alpha: 0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'إرسال تعليمات الاستعادة',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              Center(
                child: TextButton.icon(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back_rounded, size: 18, color: AppColors.primary),
                  label: const Text(
                    'العودة لتسجيل الدخول',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForgotPasswordHeader extends StatelessWidget {
  const _ForgotPasswordHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.softMint,
          ),
          child: const Icon(Icons.key_rounded, color: AppColors.primary, size: 28),
        ),
        const SizedBox(height: 20),
        const Text(
          'استعادة كلمة المرور',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppColors.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'أدخل بريدك الإلكتروني المسجل وسنرسل لك رابطاً لإعادة تعيين كلمة المرور بسهولة.',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'البريد الإلكتروني',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'example@domain.com',
            hintStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.outline),
            prefixIcon: const Icon(Icons.email_outlined, color: AppColors.primary),
            filled: true,
            fillColor: AppColors.surfaceWhite,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

class _SuccessSentBanner extends StatelessWidget {
  const _SuccessSentBanner();

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      backgroundColor: AppColors.softMint,
      borderColor: AppColors.primary.withValues(alpha: 0.3),
      padding: const EdgeInsets.all(20),
      child: const Row(
        children: [
          Icon(Icons.mark_email_read_rounded, color: AppColors.primary, size: 36),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تم إرسال التعليمات!',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.deepGreen,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'يرجى مراجعة صندوق الوارد الخاص بك والضغط على الرابط لإعادة التعيين.',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12,
                    color: AppColors.deepGreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
