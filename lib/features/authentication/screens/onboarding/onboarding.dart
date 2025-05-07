import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:testing_asg1/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:testing_asg1/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:testing_asg1/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:testing_asg1/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:testing_asg1/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';


import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/text_strings.dart';



class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Page 
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
               // image: Lottie.asset('assets/images/animations/searching.json'),
                image:Transform.scale(
                  scale: 2.0,
                  child: Lottie.asset('assets/images/animations/searching.json'),
                ),
                
                title: TTexts.onBoardingTitle1, 
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: Transform.scale(
                  scale: 2.0,
                  child: Lottie.asset('assets/images/animations/payment.json'),
                ),
                //image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2, 
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: Transform.scale(
                  scale: 2.0,
                  child: Lottie.asset('assets/images/animations/delivery.json'),
                ),
                //image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3, 
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button 
          const OnBoardingSkip(),
          
          /// Dot Navigation SmoothPageIndicator 
          const OnBoardingDotNavigation(),
          
          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}




