import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:hitch_handler_v2/theme/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _selectedColorKey = 'colorScheme';
  static const String _selectedThemeModeKey = 'themeMode';
  static const String _lightBlendLevelKey = 'lightBlend';
  static const String _darkBlendLevelKey = 'darkBlend';
  static const String _trueDarkKey = 'trueDark';
  SharedPreferences? prefs;
  late bool _doneLoading;
  late FlexScheme _selectedColorScheme;
  late ThemeMode _selectedThemeMode;
  late double _lightBlendLevel;
  late double _darkBlendLevel;
  late bool _trueDark;

  ThemeProvider() {
    _selectedColorScheme = FlexScheme.materialBaseline;
    _selectedThemeMode = ThemeMode.dark;
    _doneLoading = false;
    _lightBlendLevel = 40;
    _darkBlendLevel = 10;
    _trueDark = false;
    _loadFromPrefs();
  }

  bool get doneLoading => _doneLoading;

  FlexScheme get selectedColorScheme => _selectedColorScheme;

  ThemeMode get selectedThemeMode => _selectedThemeMode;

  double get lightBlendLevel => _lightBlendLevel;

  double get darkBlendLevel => _darkBlendLevel;

  bool get trueDark => _trueDark;

  set doneLoading(bool value) {
    _doneLoading = value;
    notifyListeners();
  }

  _initPrefs() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  void _loadFromPrefs() async {
    await _initPrefs();
    _selectedColorScheme = getFlexScheme(
        prefs!.getString(_selectedColorKey) ?? 'materialBaseline');
    _selectedThemeMode =
        getThemeMode(prefs!.getString(_selectedThemeModeKey) ?? 'dark');
    _lightBlendLevel = prefs!.getDouble(_lightBlendLevelKey) ?? 40;
    _darkBlendLevel = prefs!.getDouble(_darkBlendLevelKey) ?? 10;

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
      debugPrint('Loaded theme: ${_selectedColorScheme.name} '
          'and themeMode: $_selectedThemeMode');
      notifyListeners();
      _saveColorSchemeToPrefs();
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
      notifyListeners();
      _saveThemeModeToPrefs();
    }
  }

  void _saveLightBlendLevelToPrefs() async {
    await _initPrefs();
    prefs!.setDouble(_lightBlendLevelKey, _lightBlendLevel);
  }

  void updateLightBlendLevel(double blendLevel) {
    if (_lightBlendLevel != blendLevel) {
      _lightBlendLevel = blendLevel;
      notifyListeners();
      _saveLightBlendLevelToPrefs();
    }
  }

  void _saveDarkBlendLevelToPrefs() async {
    await _initPrefs();
    prefs!.setDouble(_darkBlendLevelKey, _darkBlendLevel);
  }

  void updateDarkBlendLevel(double blendLevel) {
    if (_darkBlendLevel != blendLevel) {
      _darkBlendLevel = blendLevel;
      _saveDarkBlendLevelToPrefs();
      notifyListeners();
    }
  }

  void _saveTrueDarkToPrefs() async {
    await _initPrefs();
    prefs!.setBool(_trueDarkKey, _trueDark);
  }

  void updateTrueDark(bool value) {
    if (_trueDark != value) {
      _trueDark = value;
      _saveTrueDarkToPrefs();
      notifyListeners();
    }
  }
}
