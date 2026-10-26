import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../app/router/route_names.dart';

class SplashViewModel extends ChangeNotifier {
  bool _isInitialized = false;
  bool _onboardingCompleted = false;
  bool _isAuthenticated = false;

  bool get isInitialized => _isInitialized;
  bool get onboardingCompleted => _onboardingCompleted;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;
      _isAuthenticated = prefs.getBool('is_authenticated') ?? false;
      _isInitialized = true;
      notifyListeners();
    } catch (_) {
      _isInitialized = true;
      notifyListeners();
    }
  }

  String getNextRoute() {
    if (!_onboardingCompleted) return RouteNames.welcome;
    if (!_isAuthenticated) return RouteNames.welcome;
    return RouteNames.home;
  }
}
