import 'package:flutter/material.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/local_storage/secure_storage.dart';
import 'package:my_suit/core/routing/routes.dart';
import 'package:my_suit/core/theming/color_manager.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/features/onboarding/data/model/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: OnboardingModel.onboardingList.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                final onboarding = OnboardingModel.onboardingList[index];
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(onboarding.image, fit: BoxFit.cover),
                    ),

                    Positioned.fill(
                      child: Container(color: Colors.black.withOpacity(0.3)),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 40.0,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () async {
                                await SecureCache.saveBool(
                                  key: 'onBoarding',
                                  value: true,
                                );
                                context.pushNamedAndRemoveUntil(
                                  Routes.login,
                                  predicate: (route) => false,
                                );
                              },
                              child: Text(
                                'تخطي',
                                style: Styles.font18W400.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            onboarding.title,
                            style: Styles.font30W500.copyWith(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          15.0.height,
                          Text(
                            onboarding.description,
                            style: Styles.font16W400.copyWith(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),

            Positioned(
              bottom: 40,
              left: 24,
              right: 24,
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: OnboardingModel.onboardingList.length,
                    effect: const WormEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.white38,
                      dotHeight: 12,
                      dotWidth: 12,
                    ),
                    onDotClicked: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  20.0.height,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 100,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () async {
                      if (_currentPage ==
                          OnboardingModel.onboardingList.length - 1) {
                        await SecureCache.saveBool(
                          key: 'onBoarding',
                          value: true,
                        );
                        context.pushNamedAndRemoveUntil(
                          Routes.login,
                          predicate: (route) => false,
                        );
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == OnboardingModel.onboardingList.length - 1
                          ? "انهاء"
                          : "التالي",
                      style: Styles.font18W400.copyWith(
                        color: ColorManager.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
