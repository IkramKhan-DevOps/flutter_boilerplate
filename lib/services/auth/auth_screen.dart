import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/core/constants/image_constants.dart';
import 'package:line_icons/line_icons.dart';

import '../../core/configs/app_colors.dart';
import '../../core/configs/app_routes.dart';
import '../../core/network/api_urls.dart';
import '../../core/widgets/bottom_sheet_widgets.dart';
import '../../core/widgets/button_widgets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isTablet = size.width > 450;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    ColorScheme colors = Theme.of(context).colorScheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
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
            width: isTablet
                ? isPortrait
                    ? size.width * 0.8
                    : size.width * 0.4
                : size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.asset(
                      ImageConstants.logo, height: 100, width: 100,
                    ),
                  ),

                  // COLUMN (T, T, S, R(L, R))
                  SizedBox(
                    height: size.height * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Align to bottom
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            'Lets get started with flutter boilerplate',
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w600,
                              fontSize: 34,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(height: 10),
                          AppPrimaryButton(
                            onPressed: ()=> Navigator.pushNamed(context, AppRoutes.loginScreen),
                            child: ButtonIconLabel(
                              icon: LineIcons.doorOpen,
                              title: 'Login',
                            ),
                          ),
                          SizedBox(height: 10,),
                          AppPrimaryButton(
                            onPressed: ()=> Navigator.pushNamed(context, AppRoutes.signupScreen),
                            outlinedButton: true,
                            child: ButtonIconLabel(
                              icon: LineIcons.userPlus,
                              title: 'Register Now',
                            ),
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
