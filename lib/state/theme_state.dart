import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  ThemeData darkHackerNewsTheme = ThemeData.dark();
  ThemeData hackerNewsTheme = ThemeData(
    primaryColor: Color(0xFFF6F6EF), //#F6F6EF Add 0xFF in front of hex
    canvasColor: Color(0xFFFF6600),
    accentColor: Color(0xFF843C0B),
    scaffoldBackgroundColor: Color(0xFFF6F6EF).withOpacity(0.9),
  );

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