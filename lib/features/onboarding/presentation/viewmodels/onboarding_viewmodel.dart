import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingViewModel extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentPage = 0;
  bool _isLastPage = false;

  int get currentPage => _currentPage;
  bool get isLastPage => _isLastPage;

  static const int totalPages = 3;

  final List<OnboardingPageData> pages = [
    OnboardingPageData(
      title: 'ابدأ رحلتك نحو حياة صحية',
      description: 'اكتشف تحليلاً دقيقاً لوجباتك، تتبع سعراتك بكل سهولة، واحصل على بدائل صحية ذكية تناسب أهدافك.',
      illustrationAsset: 'assets/images/onboarding_1.png',
      featureTitle: 'بدائل صحية',
      featureSubtitle: 'أطباق محلية',
    ),
    OnboardingPageData(
      title: 'اعرف قيمة وجباتك الغذائية بسهولة',
      description: 'التقط صورة لوجبتك ودع الذكاء الاصطناعي يحلل السعرات والمغذيات الكبيرة بدقة فائقة في ثوانٍ.',
      illustrationAsset: 'assets/images/onboarding_2.png',
      featureTitle: 'تتبع السعرات',
      featureSubtitle: 'متابعة يومية',
    ),
    OnboardingPageData(
      title: 'تابع تقدمك وحقق أهدافك',
      description: 'مراقبة يومية لاستهلاكك الغذائي مع تقارير ذكية ونصائح مخصصة لمساعدتك على الوصول لوزنك المثالي.',
      illustrationAsset: 'assets/images/onboarding_3.png',
      featureTitle: 'تصوير الوجبة',
      featureSubtitle: 'تحليل فوري',
    ),
  ];

  void onPageChanged(int page) {
    _currentPage = page;
    _isLastPage = page == totalPages - 1;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skip() {
    pageController.jumpToPage(totalPages - 1);
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class OnboardingPageData {
  final String title;
  final String description;
  final String illustrationAsset;
  final String featureTitle;
  final String featureSubtitle;

  const OnboardingPageData({
    required this.title,
    required this.description,
    required this.illustrationAsset,
    required this.featureTitle,
    required this.featureSubtitle,
  });
}