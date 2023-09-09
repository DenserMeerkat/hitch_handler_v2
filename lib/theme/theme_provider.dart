import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late String themeMode;

  ThemeProvider() {
    _init();
  }

  Future<void> _init() async {
    // ignore: unused_local_variable
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notifyListeners();
  }

  Future<String> get getThemeMode async {
    final prefs = await SharedPreferences.getInstance();
    themeMode = prefs.getString('themeMode') ?? 'dark';
    return themeMode;
  }

  Future<void> setThemeMode(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', theme).then((value) => null);
    notifyListeners();
  }
}
