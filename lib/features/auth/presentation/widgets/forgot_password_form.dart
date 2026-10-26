import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_button.dart';
import '../../../../../core/widgets/nutri_text_field.dart';
import '../cubit/forgot_password_cubit.dart';
import '../cubit/forgot_password_state.dart';
import 'forgot_password_success.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});
  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<ForgotPasswordCubit>().sendResetEmail(_emailCtrl.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message, style: const TextStyle(fontFamily: 'Cairo')), backgroundColor: Colors.red));
        }
      },
      builder: (context, state) {
        if (state is ForgotPasswordSuccessState) {
          return ForgotPasswordSuccess(email: state.email);
        }
        final isLoading = state is ForgotPasswordLoading;
        return Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Icon(Icons.lock_reset_rounded, size: 64, color: AppColors.primary),
            const SizedBox(height: 18),
            const Text('أدخل بريدك الإلكتروني وسنرسل لك رابط إعادة تعيين كلمة المرور.', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Cairo', fontSize: 14, color: AppColors.textSecondary)),
            const SizedBox(height: 22),
            NutriTextField(label: 'البريد الإلكتروني', controller: _emailCtrl, prefixIcon: Icons.email_outlined, keyboardType: TextInputType.emailAddress, validator: (v) => (v?.isEmpty ?? true) ? 'أدخل البريد الإلكتروني' : null),
            const SizedBox(height: 20),
            NutriButton(label: 'إرسال الرابط', onPressed: _submit, isLoading: isLoading),
            const SizedBox(height: 12),
            TextButton(onPressed: () => context.pop(), child: const Text('العودة لتسجيل الدخول', style: TextStyle(fontFamily: 'Cairo', color: AppColors.textSecondary))),
          ]),
        );
      },
    );
  }
}
