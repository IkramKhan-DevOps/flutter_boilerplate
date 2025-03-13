import 'package:flutter/material.dart';
import '../../dashboard/dashboard_screen.dart';
import '../../products/products_screen.dart';
import '../../services/auth/auth_screen.dart';
import '../../services/auth/login_screen.dart';
import '../../services/auth/signup_screen.dart';
import '../../services/bnb/home_screen.dart';
import '../../services/onboarding/onboarding_screen.dart';
import '../../services/onboarding/splash_screen.dart';
import '../../settings/settings_screen.dart';
import '../widgets/web_view_screen.dart';

class AppRoutes {

  // WELCOME
  static const String onboardingScreen = '/onboarding_screen';
  static const String splashScreen = '/splash_screen';

  // AUTH
  static const String loginScreen = '/login_screen';
  static const String authScreen = '/auth_screen';
  static const String signupScreen = '/signup_screen';

  // HOME
  static const String homeScreen = '/home_screen';
  static const String productsScreen = '/products_screen';
  static const String dashboardScreen = '/dashboard_screen';
  static const String settingsScreen = '/settings_screen';


  // OTHER
  static const String webViewScreen = '/web_view_screen';

  static Map<String, WidgetBuilder> routes = {

    splashScreen: (context) => const SplashScreen(),
    onboardingScreen: (context) => const OnboardingScreen(),

    authScreen: (context) => const AuthScreen(),
    loginScreen: (context) => LoginScreen(),
    signupScreen: (context) => SignupScreen(),

    homeScreen: (context) => const HomeScreen(),
    productsScreen: (context) => const ProductsScreen(),
    dashboardScreen: (context) => const DashboardScreen(),
    settingsScreen: (context) => const SettingsScreen(),

    webViewScreen: (context) => const WebViewScreen(),

  };
}