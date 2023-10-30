import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String _userName = "";
  String _password = "";
  bool _isPhone = false;
  String _countryCode = "+91";
  bool _isLoading = false;
  bool _isAdminLogin = false;

  String get userName => _userName;
  String get password => _password;
  String get countryCode => _countryCode;
  bool get isPhoneLogin => _isPhone;
  bool get isLoading => _isLoading;
  bool get isAdminLogin => _isAdminLogin;

  void updateIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void updateIsAdminLogin(bool isAdmin) {
    _isAdminLogin = isAdmin;
    notifyListeners();
  }

  void updateUsername(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  void updateCountryCode(String countryCode) {
    _countryCode = countryCode;
    notifyListeners();
  }

  void updateIsPhoneLogin(bool isPhone) {
    _isPhone = isPhone;
    notifyListeners();
  }

  void reset() {
    _userName = "";
    _password = "";
    _isPhone = false;
    _countryCode = "+91";
    _isLoading = false;
    _isAdminLogin = false;
    notifyListeners();
  }
}
