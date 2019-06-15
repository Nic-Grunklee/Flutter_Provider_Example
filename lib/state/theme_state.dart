import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  ThemeData darkHackerNewsTheme = ThemeData.dark();
  ThemeData hackerNewsTheme = ThemeData.light();

  ThemeData _themeData;
  bool isDark = false;

  ThemeState() {
    _themeData = hackerNewsTheme;
  }

  ThemeData getTheme () => _themeData;

  setTheme() {
    if (!isDark) {
      _themeData = darkHackerNewsTheme;
    } else {
      _themeData = hackerNewsTheme;
    }

    isDark = !isDark;
    notifyListeners();
  }
}