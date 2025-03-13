
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/configs/app_colors.dart';
import '../../core/constants/image_constants.dart';
import '../../core/storage/auth_storage.dart';
import '../../core/widgets/button_widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = OnboardingItems();
  final pageController = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // BOTTOM SHEET
      bottomSheet: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20),
        child: isLastPage
            ? getStartedButton()
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              icon: Icon(
                LineIcons.arrowRight,
                color: Colors.grey[200],
                size: 20,
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: controller.items.length,
              onDotClicked: (index) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                );
              },
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey.shade400,
                activeDotColor: AppColors.primary,
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 4,
                spacing: 4,
              ),
            ),
            TextButton(
              onPressed: () {
                pageController.jumpToPage(controller.items.length - 1);
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),

      // PAGE VIEW
      body: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            isLastPage = index == controller.items.length - 1;
          });
        },
        itemCount: controller.items.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 50,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  controller.items[index].image,
                  height: 400,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  controller.items[index].title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[200],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    controller.items[index].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget getStartedButton() {
    return AppPrimaryButton(
      onPressed: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('onboarding', true);

        if (!mounted) return;
        await AuthToken.checkLoginStatus(context);
      },
      title: 'Get Started',
    );
  }

}


class OnboardingInfo {
  final String title;
  final String description;
  final String image;

  OnboardingInfo({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
      title: 'Ready to GO!',
      description:
      'Ready to start mobile application template, with all configurations and settings.',
      image: LottieConstant.completed,
    ),
    OnboardingInfo(
      title: 'Themes Setup.',
      description:
      'Preconfigured light and dark themes with the ability to customize primary and secondary colors.',
      image: LottieConstant.ai,
    ),
    OnboardingInfo(
      title: 'Stable Widgets.',
      description:
      'Already build widgets for your application, with the ability to customize and create new ones.',
      image: LottieConstant.notFound,
    ),
    OnboardingInfo(
      title: 'Stable Network.',
      description:
      'API\'s and Network added to application for app usage and data fetching.',
      image: LottieConstant.loading,
    ),
    OnboardingInfo(
      title: 'Let’s Get Started!',
      description:
      'With fully configured boilerplate for your app!',
      image: LottieConstant.world,
    ),
  ];
}
