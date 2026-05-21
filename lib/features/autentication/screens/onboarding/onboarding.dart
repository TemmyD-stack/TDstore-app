import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/autentication/controllers.onboarding/onboarding_controller.dart';
import 'package:t_store/features/autentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:t_store/features/autentication/screens/onboarding/widgets/onboarding_next_btn.dart';
import 'package:t_store/features/autentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:t_store/features/autentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          // horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnboardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnboardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              )
            ],
          ),

          // skip btn
          OnboardingSkip(),

          // dot navigation smoothPageIndicator 
          OnboardingDotNavigation(),

          // circular btn
          OnboardingNextBtn()
        ],
      ),
    );
  }
}




