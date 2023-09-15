import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  static String currentTheme = 'dark';

  static String getThemeMode() => currentTheme;

  ThemeMode get themeMode {
    if (currentTheme == 'light') {
      return ThemeMode.light;
    } else if (currentTheme == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }
}
