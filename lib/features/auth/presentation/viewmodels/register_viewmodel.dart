import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_viewmodel.dart';
import '../../../../../../core/constants/app_strings.dart';

class RegisterViewModel extends AuthViewModel {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _agreeToTerms = false;

  bool get agreeToTerms => _agreeToTerms;

  void setAgreeToTerms(bool value) {
    _agreeToTerms = value;
    notifyListeners();
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'الاسم مطلوب';
    }
    if (value.trim().length < 2) {
      return 'الاسم يجب أن يكون حرفين على الأقل';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'بريد إلكتروني غير صحيح';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'تأكيد كلمة المرور مطلوب';
    }
    if (value != passwordController.text) {
      return 'كلمات المرور غير متطابقة';
    }
    return null;
  }

  bool isFormValid() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> register() async {
    if (!isFormValid()) return;
    if (!_agreeToTerms) {
      setError('يجب الموافقة على الشروط والأحكام');
      return;
    }

    setLoading(true);
    clearError();

    try {
      // TODO: Implement actual Firebase Auth registration
      // final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: emailController.text.trim(),
      //   password: passwordController.text,
      // );
      // await credential.user?.updateDisplayName(nameController.text.trim());

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Save auth state
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppStrings.isAuthenticatedKey, true);

      // Navigation will be handled by the view
    } catch (e) {
      setError('فشل إنشاء الحساب: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}