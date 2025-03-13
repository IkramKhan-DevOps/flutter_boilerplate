import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../configs/app_settings.dart';

class FlushMessage {
  static Flushbar flushBar(BuildContext context, String message,
      [String tag = 'success']) {
    Color color = Colors.black87;
    Icon icon = const Icon(Icons.question_mark_rounded, color: Colors.white);

    switch (tag) {
      case 'danger':
        color = Colors.redAccent;
        icon = const Icon(Icons.error, color: Colors.white);
        break;

      case 'info':
        color = Colors.blueAccent;
        icon = const Icon(Icons.info, color: Colors.white);
        break;

      case 'warning':
        color = Colors.deepOrangeAccent;
        icon = const Icon(Icons.warning, color: Colors.white);
        break;

      case 'success':
        color = Colors.green;
        icon = const Icon(Icons.check_circle, color: Colors.white);
        break;

      default:
        break;
    }

    return Flushbar(
      icon: icon,
      flushbarPosition: FlushbarPosition.TOP,
      message: message.toString(),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: color,
    )..show(context);
  }
}

class Toast {
  static ToastificationType getToastType(String tag) {
    ToastificationType toastType = ToastificationType.success;

    switch (tag) {
      case 'danger':
      case 'error':
        toastType = ToastificationType.error;
        break;

      case 'info':
        toastType = ToastificationType.info;
        break;

      case 'warning':
        toastType = ToastificationType.warning;
        break;

      case 'success':
        toastType = ToastificationType.success;
        break;

      default:
        toastType = ToastificationType.success;
        break;
    }

    return toastType;
  }

  static void show(BuildContext context, String message,
      [String tag = 'success', heading = '${AppSettings.appName} Says!']) {
    ColorScheme colors = Theme.of(context).colorScheme;

    toastification.show(
      context: context,
      type: Toast.getToastType(tag),
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
      title: Text(
        heading,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      description: RichText(
        text: TextSpan(
          text: message,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: colors.secondary,
            fontSize: 14,
          ),
        ),
      ),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      showIcon: false,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.none,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => () {},
        onCloseButtonTap: (toastItem) {},
        onAutoCompleteCompleted: (toastItem) {},
        onDismissed: (toastItem) => () {},
      ),
    );
  }
}