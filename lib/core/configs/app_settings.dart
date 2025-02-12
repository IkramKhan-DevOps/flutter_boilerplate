import 'dart:io';

class AppSettings {
  static const version = '1.0.0';
  static const codeVersion = '1';
  static const appName = 'Confidence System (CI)';
  static const appDescription = 'A prototype for Confidence Index (CI) system';

  static String getPlatform(){
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'ios';
    } else if (Platform.isMacOS) {
      return 'macos';
    } else if (Platform.isWindows) {
      return 'windows';
    } else if (Platform.isLinux) {
      return 'linux';
    } else {
      return 'other';
    }
  }

}