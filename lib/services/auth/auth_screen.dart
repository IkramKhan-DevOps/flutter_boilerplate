import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';

import '../../core/configs/app_colors.dart';
import '../../core/configs/app_routes.dart';
import '../../core/network/api_urls.dart';
import '../../core/widgets/app_bar_widgets.dart';
import '../../core/widgets/bottom_sheet_widgets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isTablet = size.width > 450;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: const AppBarAuth(),
        backgroundColor: AppColors.primary,
        bottomSheet: TermsBottomSheetWidget(
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.webViewScreen,
            arguments: APIWebUrl.termsAndConditions,
          ),
          leftText: 'By continuing, you agree to our ',
          rightText: 'Terms of Service',
          foregroundColor: AppColors.white,
        ),
        body: Center(
          child: SizedBox(
            width: isTablet ? isPortrait ? size.width * 0.8 : size.width * 0.4 : size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //LOGO
                  SizedBox(
                    height: size.height * 0.4,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                      ),
                    ),
                  ),

                  // COLUMN (T, T, S, R(L, R))
                  SizedBox(
                    height: size.height * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end, // Align to bottom
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'GET STARTED!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primarySecond,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Precision hand scan for a Firearm match.',
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w600,
                              fontSize: 34,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: (){},
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 12),
                                  elevation: 0,
                                  backgroundColor: Colors.black54,
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      LineIcons.plusSquare,
                                      size: 20,
                                      color: AppColors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Registration',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: (){},
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 12),
                                  elevation: 0,
                                  backgroundColor: Colors.black87,
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      LineIcons.doorOpen,
                                      size: 20,
                                      color: AppColors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
