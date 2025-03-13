import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/providers/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/configs/app_routes.dart';
import 'core/configs/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(
    const ProviderScope(
      child: OrientationLockWrapper(),
    ),
  );
}

class OrientationLockWrapper extends StatelessWidget {
  const OrientationLockWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600; // Threshold for tablet

        if (isTablet) {
          // Allow both portrait and landscape orientations for tablets
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        } else {
          // Lock to portrait for mobile
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
        }

        return const ProviderScope(
          child: MyApp(),
        );
      },
    );
  }
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isThemeDark = ref.watch(themeChangeNotifier);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EXARTH',
      theme: isThemeDark.isThemeDark ? AppThemes.darkTheme : AppThemes.lightTheme,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}