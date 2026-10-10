import 'package:flutter/material.dart';

import 'auth_viewmodel.dart';
import '../../../../../../core/constants/app_strings.dart';

class ForgotPasswordViewModel extends AuthViewModel {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'بريد إلكتروني غير صحيح';
    }
    return null;
  }

  bool isFormValid() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> sendResetLink() async {
    if (!isFormValid()) return;

    setLoading(true);
    clearError();

    try {
      // TODO: Implement actual Firebase Auth password reset
      // await FirebaseAuth.instance.sendPasswordResetEmail(
      //   email: emailController.text.trim(),
      // );

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Success - navigation back to login will be handled by view
    } catch (e) {
      setError('فشل إرسال رابط الاستعادة: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}