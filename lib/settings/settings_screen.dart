import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/storage/auth_storage.dart';
import 'package:flutter_boilerplate/settings/widgets/settings_widgets.dart';
import 'package:line_icons/line_icons.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/theme_provider.dart';
import '../core/configs/app_routes.dart';
import '../core/network/api_urls.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeChangeNotifier);

    // Initialize settings values
    final bool isThemeDark = themeNotifier.isThemeDark;
    final ColorScheme colors = Theme.of(context).colorScheme;
    var size = MediaQuery.of(context).size;
    bool isTablet = size.width > 450;

    return Scaffold(
      bottomNavigationBar: const VersionWidget(),
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20 + 50,
          bottom: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SETTINGS TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(''),
                  const Text(
                    "SETTINGS",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      AuthToken.logoutUser(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: colors.primary.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Icon(
                        LineIcons.doorOpen,
                        color: colors.secondary,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // LINKS
              SizedBox(
                width: isTablet ? size.width * 0.5 : size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    _buildSettingItem(
                      context,
                      icon: LineIcons.user,
                      title: 'My Profile',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.profileChangeScreen,
                        );
                      },
                    ),
                    _buildSettingItem(
                      context,
                      icon: LineIcons.lock,
                      title: 'Password Change',
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.passwordChangeScreen);
                      },
                    ),
                    _buildSettingItem(
                      context,
                      icon: LineIcons.phone,
                      title: 'Support',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.webViewScreen,
                            arguments: APIWebUrl.contactUs);
                      },
                    ),
                    // _buildSwitchItem(
                    //   context,
                    //   value: isThemeDark,
                    //   icon: LineIcons.brush,
                    //   title: 'Dark Mode',
                    //   onTap: () {
                    //     if (isThemeDark) {
                    //       themeNotifier.setLightTheme();
                    //     } else {
                    //       themeNotifier.setDarkTheme();
                    //     }
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Function to build each setting item
Widget _buildSettingItem(
  BuildContext context, {
  required IconData icon,
  required String title,
  String? trailing,
  required VoidCallback onTap,
}) {
  final ColorScheme myColors = Theme.of(context).colorScheme;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: ListTile(
      tileColor: myColors.secondary.withOpacity(0.05),
      selectedTileColor: myColors.primary.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: myColors.secondary,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Container(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          LineIcons.arrowRight,
          color: myColors.secondary.withOpacity(0.5),
        ),
      ),
      onTap: onTap,
    ),
  );
}

Widget _buildSwitchItem(
  BuildContext context, {
  required IconData icon,
  required String title,
  required bool value,
  required VoidCallback onTap,
}) {
  final ColorScheme myColors = Theme.of(context).colorScheme;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: ListTile(
      tileColor: Colors.grey[900],
      selectedTileColor: myColors.primary.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: myColors.secondary,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: (newValue) {
          onTap();
        },
        activeColor: myColors.primary,
      ),
    ),
  );
}
