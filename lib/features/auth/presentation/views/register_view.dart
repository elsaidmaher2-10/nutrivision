import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/router/route_names.dart';
import '../../../../../core/constants/app_colors.dart';

/// Register Screen designed from NutriVision Stitch export (nutrivision_7)
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _agreeTerms = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onRegister() {
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
              const _RegisterHeader(),
              const SizedBox(height: 28),
              _TextInputField(
                label: 'الاسم بالكامل',
                hint: 'مثال: سارة أحمد',
                icon: Icons.person_outline_rounded,
                controller: _nameController,
              ),
              const SizedBox(height: 16),
              _TextInputField(
                label: 'البريد الإلكتروني',
                hint: 'example@domain.com',
                icon: Icons.email_outlined,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              _PasswordInputField(
                controller: _passwordController,
                obscurePassword: _obscurePassword,
                onToggleVisibility: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
              ),
              const SizedBox(height: 16),
              _TermsCheckboxRow(
                agreeTerms: _agreeTerms,
                onChanged: (val) => setState(() => _agreeTerms = val ?? false),
              ),
              const SizedBox(height: 28),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: _agreeTerms ? _onRegister : null,
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
                    'إنشاء حساب جديد',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _LoginPromptRow(
                onLogin: () => context.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterHeader extends StatelessWidget {
  const _RegisterHeader();

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
          child: const Icon(Icons.person_add_alt_1_outlined, color: AppColors.primary, size: 28),
        ),
        const SizedBox(height: 20),
        const Text(
          'إنشاء حساب جديد',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppColors.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'انضم إلى مجتمع NutriVision واستمتع بتجربة تغذية ذكية وصحية.',
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

class _TextInputField extends StatelessWidget {
  const _TextInputField({
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.keyboardType,
  });

  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.outline),
            prefixIcon: Icon(icon, color: AppColors.primary),
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
            hintText: '8 خانات على الأقل',
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

class _TermsCheckboxRow extends StatelessWidget {
  const _TermsCheckboxRow({
    required this.agreeTerms,
    required this.onChanged,
  });

  final bool agreeTerms;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: agreeTerms,
          activeColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onChanged: onChanged,
        ),
        const Expanded(
          child: Text(
            'أوافق على شروط الخدمة وسياسة الخصوصية',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 12,
              color: AppColors.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginPromptRow extends StatelessWidget {
  const _LoginPromptRow({required this.onLogin});

  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'لديك حساب بالفعل؟ ',
          style: TextStyle(fontFamily: 'Cairo', fontSize: 14, color: AppColors.textSecondary),
        ),
        GestureDetector(
          onTap: onLogin,
          child: const Text(
            'تسجيل الدخول',
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
