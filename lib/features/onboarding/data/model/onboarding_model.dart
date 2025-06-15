class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: 'assets/images/jpg/Onboarding1.jpg',
      title: 'مرحبًا بك في MySuit',
      description: 'تأجير وبيع بدل بأفضل الأسعار وأعلى جودة.',
    ),
    OnboardingModel(
      image: 'assets/images/jpg/Onboarding2.jpeg',
      title: 'اختار ستايلك',
      description: 'مجموعة ضخمة من الموديلات تناسب جميع المناسبات.',
    ),
    OnboardingModel(
      image: 'assets/images/jpg/Onboarding3.jpeg',
      title: 'احجز بكل سهولة',
      description: 'سهولة في الاستخدام وسرعة في الحجز.',
    ),
  ];
}
