import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_button.dart';
import '../../../../../core/widgets/nutri_text_field.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController(), _passCtrl = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailCtrl.dispose(); _passCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<LoginCubit>().login(email: _emailCtrl.text.trim(), password: _passCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم تسجيل الدخول بنجاح! 👋', style: TextStyle(fontFamily: 'Cairo'))));
          context.go('/home');
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message, style: const TextStyle(fontFamily: 'Cairo')), backgroundColor: Colors.red));
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;
        return Form(
          key: _formKey,
          child: Column(children: [
            NutriTextField(label: 'البريد الإلكتروني', controller: _emailCtrl, prefixIcon: Icons.email_outlined, keyboardType: TextInputType.emailAddress, validator: (v) => (v?.isEmpty ?? true) ? 'أدخل البريد الإلكتروني' : null),
            const SizedBox(height: 14),
            NutriTextField(
              label: 'كلمة المرور', controller: _passCtrl, prefixIcon: Icons.lock_outline_rounded, obscureText: _obscure,
              validator: (v) => (v?.length ?? 0) < 6 ? 'كلمة المرور قصيرة جداً' : null,
              suffixIcon: IconButton(icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: AppColors.outline), onPressed: () => setState(() => _obscure = !_obscure)),
            ),
            Align(alignment: AlignmentDirectional.centerEnd, child: TextButton(onPressed: () => context.push('/forgot-password'), child: const Text('نسيت كلمة المرور؟', style: TextStyle(fontFamily: 'Cairo', color: AppColors.primary, fontSize: 13)))),
            const SizedBox(height: 8),
            NutriButton(label: 'تسجيل الدخول', onPressed: _submit, isLoading: isLoading),
          ]),
        );
      },
    );
  }
}
