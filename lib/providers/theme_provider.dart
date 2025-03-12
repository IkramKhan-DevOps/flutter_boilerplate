

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeChangeNotifier = ChangeNotifierProvider(
  (ref) => AppThemeState(),
);

class AppThemeState extends ChangeNotifier{
  bool isThemeDark = false;

  AppThemeState(){
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isThemeDark = prefs.getBool('isThemeDark') ?? true;
    notifyListeners();
  }

  Future<void> _saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isThemeDark', isThemeDark);
  }

  void setLightTheme() {
    isThemeDark = false;
    _saveTheme();
    notifyListeners();
  }

  void setDarkTheme() {
    isThemeDark = true;
    _saveTheme();
    notifyListeners();
  }

}