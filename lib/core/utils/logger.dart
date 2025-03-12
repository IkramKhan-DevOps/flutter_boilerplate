// log_util.dart
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLog {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
  );

  static void d(String message) {
    if (kDebugMode) {
      _logger.d(message);
    }
  }

  static void i(String message) {
    if (kDebugMode) {
      _logger.i(message);
    }
  }

  static void w(String message) {
    if (kDebugMode) {
      _logger.w(message);
    }
  }

  static void e(String message) {
    if (kDebugMode) {
      _logger.e(message);
    }
  }
}

class AppPrint {
  static void print(String message) {
    if (kDebugMode) {
      debugPrint(message);
    }
  }
}