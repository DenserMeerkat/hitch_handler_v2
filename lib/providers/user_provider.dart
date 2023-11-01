import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  final String jwtTokenKey = "jwt_token";
  final String userModelKey = "user_model";
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  String? _jwtToken;
  UserModel? _userModel;

  UserProvider() {
    loadJwtFromStorage();
    loadUserModelFromStorage();
  }

  String? get jwtToken => _jwtToken;
  UserModel? get userModel => _userModel;

  Future<void> loadJwtFromStorage() async {
    try {
      _jwtToken = await _secureStorage.read(key: jwtTokenKey);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> loadUserModelFromStorage() async {
    try {
      final userModelJson = await _secureStorage.read(key: userModelKey);
      if (userModelJson != null) {
        _userModel = UserModel.fromJson(json.decode(userModelJson));
      }
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> saveToStorage(String? token, UserModel? userModel) async {
    _jwtToken = token;
    _userModel = userModel;
    try {
      if (token != null) {
        await _secureStorage.write(key: jwtTokenKey, value: token);
        if (userModel != null) {
          final userModelJson = json.encode(userModel.toJson());
          await _secureStorage.write(key: userModelKey, value: userModelJson);
        }
      } else {
        await _secureStorage.delete(key: jwtTokenKey);
        await _secureStorage.delete(key: userModelKey);
      }
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> logout() async {
    await saveToStorage(null, null);
  }
}
