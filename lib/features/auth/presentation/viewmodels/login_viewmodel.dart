import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_viewmodel.dart';
import '../../../../../../core/constants/app_strings.dart';

class LoginViewModel extends AuthViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _rememberMe = false;

  bool get rememberMe => _rememberMe;

  void setRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
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
    if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }
    return null;
  }

  bool isFormValid() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> login() async {
    if (!isFormValid()) return;

    setLoading(true);
    clearError();

    try {
      // TODO: Implement actual Firebase Auth login
      // final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: emailController.text.trim(),
      //   password: passwordController.text,
      // );

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Save remember me preference
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('remember_me', _rememberMe);
      await prefs.setBool(AppStrings.isAuthenticatedKey, true);

      // Navigation will be handled by the view
    } catch (e) {
      setError('فشل تسجيل الدخول: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}