import 'package:flutter/material.dart';
import '../../domain/models/onboarding_page_data.dart';

class OnboardingViewModel extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentPage = 0;

  int get currentPage => _currentPage;
  bool get isLastPage => _currentPage == pages.length - 1;

  final List<OnboardingPageData> pages = const [
    OnboardingPageData(
      title: 'ابدأ رحلتك نحو حياة صحية',
      description: 'اكتشف تحليلاً دقيقاً لوجباتك، تتبع سعراتك بكل سهولة، واحصل على بدائل صحية ذكية تناسب أهدافك.',
      featureTitle: 'بدائل صحية',
      featureSubtitle: 'أطباق محلية',
    ),
    OnboardingPageData(
      title: 'اعرف قيمة وجباتك الغذائية بسهولة',
      description: 'التقط صورة لوجبتك ودع الذكاء الاصطناعي يحلل السعرات والمغذيات الكبيرة بدقة فائقة في ثوانٍ.',
      featureTitle: 'تتبع السعرات',
      featureSubtitle: 'متابعة يومية',
    ),
    OnboardingPageData(
      title: 'تابع تقدمك وحقق أهدافك',
      description: 'مراقبة يومية لاستهلاكك الغذائي مع تقارير ذكية ونصائح مخصصة لمساعدتك على الوصول لوزنك المثالي.',
      featureTitle: 'تصوير الوجبة',
      featureSubtitle: 'تحليل فوري',
    ),
  ];

  void onPageChanged(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
