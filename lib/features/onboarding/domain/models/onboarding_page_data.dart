class OnboardingPageData {
  const OnboardingPageData({
    required this.title,
    required this.description,
    required this.featureTitle,
    required this.featureSubtitle,
    this.icon,
  });

  final String title;
  final String description;
  final String featureTitle;
  final String featureSubtitle;
  final dynamic icon;
}
