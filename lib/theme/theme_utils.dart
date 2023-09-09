import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

Future<String> getCurrentTheme() {
  return SharedPreferences.getInstance().then((prefs) {
    return prefs.getString('themeMode') ?? 'dark';
  });
}

bool isDark(BuildContext context) {
  return Theme.of(context).colorScheme.brightness == Brightness.dark;
}

void setThemeMode(String themeMode, Function()? onSet) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('themeMode', themeMode);
  onSet?.call();
}

ThemeMode getThemeMode(String themeName) {
  switch (themeName) {
    case 'system':
      return ThemeMode.system;
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    default:
      return ThemeMode.dark;
  }
}

int getThemeIndex(String themeMode) {
  switch (themeMode) {
    case 'system':
      return 0;
    case 'light':
      return 1;
    case 'dark':
      return 2;
    default:
      return 2;
  }
}

String getThemeFromIndex(int index) {
  switch (index) {
    case 0:
      return 'system';
    case 1:
      return 'light';
    case 2:
      return 'dark';
    default:
      return 'system';
  }
}
