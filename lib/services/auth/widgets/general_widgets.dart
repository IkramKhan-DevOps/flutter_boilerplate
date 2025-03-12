import 'package:flutter/material.dart';

import '../../../core/configs/app_routes.dart';
import '../../../core/network/api_urls.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, AppRoutes.webViewScreen,
              arguments: APIWebUrl.resetPassword),
      child: Align(
        alignment: Alignment.centerRight,
        child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Forgot Password?',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              TextSpan(
                text: ' Reset',
                style: TextStyle(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .secondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ])),
      ),
    );
  }
}
