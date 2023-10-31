import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtProvider extends ChangeNotifier {
  final String jwtTokenKey = "jwt_token";
  final String userTypeKey = "user_type";
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  String? _jwtToken;
  String? _userType;

  JwtProvider() {
    loadJwtFromStorage();
  }

  String? get jwtToken => _jwtToken;
  String? get userType => _userType;

  Future<void> loadJwtFromStorage() async {
    try {
      _jwtToken = await _secureStorage.read(key: jwtTokenKey);
      _userType = await _secureStorage.read(key: userTypeKey);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> saveJwtToStorage(String? token, String? userType) async {
    _jwtToken = token;
    try {
      if (token != null) {
        await _secureStorage.write(key: jwtTokenKey, value: token);
        await _secureStorage.write(key: userTypeKey, value: userType!);
      } else {
        await _secureStorage.delete(key: jwtTokenKey);
        await _secureStorage.delete(key: userTypeKey);
      }
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> clearJwt() async {
    await saveJwtToStorage(null, null);
  }
}
