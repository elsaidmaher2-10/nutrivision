import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/app_strings.dart';

class SplashViewModel extends ChangeNotifier {
  bool _isInitialized = false;
  bool _onboardingCompleted = false;
  bool _isAuthenticated = false;
  String? _error;

  bool get isInitialized => _isInitialized;
  bool get onboardingCompleted => _onboardingCompleted;
  bool get isAuthenticated => _isAuthenticated;
  String? get error => _error;

  Future<void> initialize() async {
    try {
      await _checkOnboardingStatus();
      await _checkAuthStatus();
      await Future.delayed(const Duration(milliseconds: 1500));
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isInitialized = true;
      notifyListeners();
    }
  }

  Future<void> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _onboardingCompleted =
        prefs.getBool(AppStrings.onboardingCompletedKey) ?? false;
  }

  Future<void> _checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getBool(AppStrings.isAuthenticatedKey) ?? false;
  }

  String getNextRoute() {
    if (!_onboardingCompleted) {
      return AppStrings.onboardingRoute;
    }
    if (!_isAuthenticated) {
      return AppStrings.welcomeRoute;
    }
    return AppStrings.homeRoute;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
