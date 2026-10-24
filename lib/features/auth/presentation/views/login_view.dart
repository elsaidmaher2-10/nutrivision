import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/router/route_names.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

/// Login Screen designed from NutriVision Stitch export (nutrivision_1)
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    context.go(RouteNames.home);
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
              const _LoginHeader(),
              const SizedBox(height: 32),
              _EmailInputField(controller: _emailController),
              const SizedBox(height: 18),
              _PasswordInputField(
                controller: _passwordController,
                obscurePassword: _obscurePassword,
                onToggleVisibility: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
              ),
              const SizedBox(height: 14),
              _RememberAndForgotRow(
                rememberMe: _rememberMe,
                onRememberChanged: (val) {
                  setState(() => _rememberMe = val ?? false);
                },
                onForgotPassword: () {
                  context.push(RouteNames.forgotPassword);
                },
              ),
              const SizedBox(height: 28),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: _onLogin,
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
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const _OrDivider(),
              const SizedBox(height: 24),
              const _SocialLoginRow(),
              const SizedBox(height: 32),
              _RegisterPromptRow(
                onRegister: () => context.push(RouteNames.register),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

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
          child: const Icon(Icons.lock_outline_rounded, color: AppColors.primary, size: 28),
        ),
        const SizedBox(height: 20),
        const Text(
          'تسجيل الدخول',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppColors.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'مرحباً بعودتك! تابع رحلتك نحو صحة أفضل وتغذية متوازنة.',
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

class _EmailInputField extends StatelessWidget {
  const _EmailInputField({required this.controller});

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

class _PasswordInputField extends StatelessWidget {
  const _PasswordInputField({
    required this.controller,
    required this.obscurePassword,
    required this.onToggleVisibility,
  });

  final TextEditingController controller;
  final bool obscurePassword;
  final VoidCallback onToggleVisibility;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'كلمة المرور',
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
          obscureText: obscurePassword,
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.outline),
            prefixIcon: const Icon(Icons.lock_outline, color: AppColors.primary),
            suffixIcon: IconButton(
              icon: Icon(
                obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                color: AppColors.outline,
              ),
              onPressed: onToggleVisibility,
            ),
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

class _RememberAndForgotRow extends StatelessWidget {
  const _RememberAndForgotRow({
    required this.rememberMe,
    required this.onRememberChanged,
    required this.onForgotPassword,
  });

  final bool rememberMe;
  final ValueChanged<bool?> onRememberChanged;
  final VoidCallback onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              activeColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              onChanged: onRememberChanged,
            ),
            const Text(
              'تذكرني',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 13,
                color: AppColors.onSurface,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: onForgotPassword,
          child: const Text(
            'نسيت كلمة المرور؟',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: AppColors.border)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'أو المتابعة عبر',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Expanded(child: Divider(color: AppColors.border)),
      ],
    );
  }
}

class _SocialLoginRow extends StatelessWidget {
  const _SocialLoginRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NutriCard(
            padding: const EdgeInsets.symmetric(vertical: 14),
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.g_mobiledata_rounded, size: 28, color: Colors.red),
                SizedBox(width: 8),
                Text(
                  'Google',
                  style: TextStyle(fontFamily: 'Cairo', fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: NutriCard(
            padding: const EdgeInsets.symmetric(vertical: 14),
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.apple_rounded, size: 24, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  'Apple',
                  style: TextStyle(fontFamily: 'Cairo', fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _RegisterPromptRow extends StatelessWidget {
  const _RegisterPromptRow({required this.onRegister});

  final VoidCallback onRegister;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'ليس لديك حساب بعد؟ ',
          style: TextStyle(fontFamily: 'Cairo', fontSize: 14, color: AppColors.textSecondary),
        ),
        GestureDetector(
          onTap: onRegister,
          child: const Text(
            'إنشاء حساب جديد',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
