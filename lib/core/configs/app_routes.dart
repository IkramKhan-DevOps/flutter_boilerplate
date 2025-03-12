import 'package:flutter/material.dart';
import '../../services/onboarding/onboarding_screen.dart';
import '../../services/onboarding/splash_screen.dart';
import '../widgets/web_view_screen.dart';

class AppRoutes {

  // WELCOME
  static const String onboardingScreen = '/onboarding_screen';
  static const String splashScreen = '/splash_screen';


  // OTHER
  static const String webViewScreen = '/web_view_screen';

  static Map<String, WidgetBuilder> routes = {

    splashScreen: (context) => const SplashScreen(),
    onboardingScreen: (context) => const OnboardingScreen(),

    webViewScreen: (context) => const WebViewScreen(),

  };
}