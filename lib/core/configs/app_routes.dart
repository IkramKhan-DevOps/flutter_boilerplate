import 'package:flutter/material.dart';
import '../widgets/web_view_screen.dart';

class AppRoutes {

  static const String recordingCompletedScreen = '/recording_completed_screen';


  // OTHER
  static const String webViewScreen = '/web_view_screen';

  static Map<String, WidgetBuilder> routes = {

    webViewScreen: (context) => const WebViewScreen(),
  };
}