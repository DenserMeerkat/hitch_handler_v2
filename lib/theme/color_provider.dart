import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:hitch_handler_v2/theme/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _selectedColorKey = 'colorScheme';
  static const String _selectedThemeModeKey = 'themeMode';
  SharedPreferences? prefs;
  late FlexScheme _selectedColorScheme;
  late ThemeMode _selectedThemeMode;

  ThemeProvider() {
    _selectedColorScheme = FlexScheme.greenM3;
    _selectedThemeMode = ThemeMode.dark;
    _loadFromPrefs();
  }

  FlexScheme get selectedColorScheme => _selectedColorScheme;

  ThemeMode get selectedThemeMode => _selectedThemeMode;

  _initPrefs() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  void _loadFromPrefs() async {
    await _initPrefs();
    _selectedColorScheme =
        getFlexScheme(prefs!.getString(_selectedColorKey) ?? 'greenM3');
    _selectedThemeMode =
        getThemeMode(prefs!.getString(_selectedThemeModeKey) ?? 'dark');

    debugPrint('Loaded theme: ${_selectedColorScheme.name} '
        'and themeMode: $_selectedThemeMode');
    notifyListeners();
  }

  void _saveColorSchemeToPrefs() async {
    await _initPrefs();
    debugPrint('Loaded theme: ${_selectedColorScheme.name} '
        'and themeMode: $_selectedThemeMode');
    prefs!.setString(_selectedColorKey, _selectedColorScheme.name);
  }

  void updateSelectedColorScheme(FlexScheme colorScheme) {
    if (_selectedColorScheme != colorScheme) {
      _selectedColorScheme = colorScheme;
      _saveColorSchemeToPrefs();
      debugPrint('Loaded theme: ${_selectedColorScheme.name} '
          'and themeMode: $_selectedThemeMode');
      notifyListeners();
    }
  }

  void _saveThemeModeToPrefs() async {
    await _initPrefs();
    prefs!
        .setString(_selectedThemeModeKey, getThemeModeName(_selectedThemeMode));
  }

  void updateSelectedThemeMode(ThemeMode themeMode) {
    if (_selectedThemeMode != themeMode) {
      _selectedThemeMode = themeMode;
      _saveThemeModeToPrefs();
      notifyListeners();
    }
  }
}
