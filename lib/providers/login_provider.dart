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
    debugPrint("Updating username to $userName");
    _userName = userName;
    notifyListeners();
  }

  void updatePassword(String password) {
    debugPrint("Updating Password to $password");
    _password = password;
    notifyListeners();
  }

  void updateCountryCode(String countryCode) {
    debugPrint("Updating Country Code to $countryCode");
    _countryCode = countryCode;
    notifyListeners();
  }

  void updateIsPhoneLogin(bool isPhone) {
    debugPrint("Updating isPhone to $isPhone");
    _isPhone = isPhone;
    notifyListeners();
  }
}
