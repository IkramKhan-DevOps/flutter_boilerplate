
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/configs/app_settings.dart';

import '../../../core/configs/app_routes.dart';
import '../../../core/network/api_urls.dart';

class VersionWidget extends StatelessWidget {
  const VersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10, right: 10, bottom: 10, top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.webViewScreen,
                arguments: APIWebUrl.privacyPolicy,
              );
            },
            child: Text(
              'Privacy Policy',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
              ),
            ),
          ),

          Text(
            ' | ',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 14,
            ),
          ),

          const Text(
            'v${AppSettings.version} (${AppSettings.codeVersion})',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            ' | ',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 14,
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.webViewScreen,
                arguments: APIWebUrl.termsAndConditions,
              );
            },
            child: Text(
              'Terms of Service',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

