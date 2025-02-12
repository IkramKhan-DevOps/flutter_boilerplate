import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../configs/app_colors.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Safely retrieve the argument (the URL)
    final String? url = ModalRoute.of(context)?.settings.arguments as String?;

    // Check if URL is provided
    if (url == null || url.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          backgroundColor: Colors.red,
        ),
        body: const Center(
          child: Text('No URL provided.'),
        ),
      );
    }

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LineIcons.arrowLeft, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Boilerplate',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'You are using web version of boilerplate.',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }
}
