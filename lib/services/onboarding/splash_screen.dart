import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/configs/app_routes.dart';
import '../../core/constants/image_constants.dart';
import '../../core/storage/auth_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _handleStartup();
  }

  void _handleStartup() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isOnboardingCompleted = prefs.getBool('onboarding') ?? false;


    if (isOnboardingCompleted) {
      AuthToken.checkLoginStatus(context);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // IMAGE
              Image.asset(ImageConstants.logo, width: 100),
              const SizedBox(
                height: 20,
              ),

              // NAME AND DESCRIPTION
              Text(
                'EXARTH',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                ),
              ),
              Text(
                '_ Flutter boilerplate for app startup _',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[500],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
