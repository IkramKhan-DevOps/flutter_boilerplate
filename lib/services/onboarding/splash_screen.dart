import 'package:flutter/material.dart';

import '../../core/configs/app_routes.dart';
import '../../core/constants/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLobby();
  }

  Future<void> _navigateToLobby() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(AppRoutes.onboardingScreen);
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
