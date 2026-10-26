import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_button.dart';
import '../../../../../core/widgets/nutri_text_field.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController(), _emailCtrl = TextEditingController(), _passCtrl = TextEditingController();
  bool _obscure = true, _terms = false;

  @override
  void dispose() {
    _nameCtrl.dispose(); _emailCtrl.dispose(); _passCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (!_terms) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('يجب الموافقة على الشروط', style: TextStyle(fontFamily: 'Cairo'))));
      return;
    }
    context.read<RegisterCubit>().register(name: _nameCtrl.text.trim(), email: _emailCtrl.text.trim(), password: _passCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم إنشاء الحساب بنجاح! 🎉', style: TextStyle(fontFamily: 'Cairo'))));
          context.go('/home');
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message, style: const TextStyle(fontFamily: 'Cairo')), backgroundColor: Colors.red));
        }
      },
      builder: (context, state) => Form(
        key: _formKey,
        child: Column(children: [
          NutriTextField(label: 'الاسم الكامل', controller: _nameCtrl, prefixIcon: Icons.person_outline_rounded, validator: (v) => (v?.isEmpty ?? true) ? 'أدخل اسمك' : null),
          const SizedBox(height: 12),
          NutriTextField(label: 'البريد الإلكتروني', controller: _emailCtrl, prefixIcon: Icons.email_outlined, keyboardType: TextInputType.emailAddress, validator: (v) => (v?.isEmpty ?? true) ? 'أدخل البريد الإلكتروني' : null),
          const SizedBox(height: 12),
          NutriTextField(label: 'كلمة المرور', controller: _passCtrl, prefixIcon: Icons.lock_outline_rounded, obscureText: _obscure, validator: (v) => (v?.length ?? 0) < 6 ? 'كلمة المرور قصيرة جداً' : null, suffixIcon: IconButton(icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: AppColors.outline), onPressed: () => setState(() => _obscure = !_obscure))),
          const SizedBox(height: 8),
          Row(children: [Checkbox(value: _terms, onChanged: (v) => setState(() => _terms = v ?? false), activeColor: AppColors.primary), const Expanded(child: Text('أوافق على الشروط والخصوصية', style: TextStyle(fontFamily: 'Cairo', fontSize: 12)))]),
          const SizedBox(height: 12),
          NutriButton(label: 'إنشاء الحساب', onPressed: _submit, isLoading: state is RegisterLoading),
        ]),
      ),
    );
  }
}
