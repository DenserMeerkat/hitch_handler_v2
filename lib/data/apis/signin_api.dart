import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/data/services/http_service.dart';

Future<UserResponseModel> loginStudent(String username, String password) async {
  String path = "student/login/";

  HttpService http = HttpService();
  late Response response;

  String email = "";
  String phone = "";
  String roll = "";
  if (username.isValidEmail()) {
    email = username;
  } else if (username.isValidRoll()) {
    roll = username;
  } else if (username.isValidMobile()) {
    phone = username;
  } else {
    return UserResponseModel(statusCode: 400, message: "Invalid Username");
  }

  Object body = jsonEncode({
    "roll": roll,
    "email": email,
    "phone": phone,
    "password": password,
  });
  debugPrint(body.toString());
  try {
    response = await http.postRequest(path, body);
    if (response.statusCode == 200) {
      debugPrint(response.data.toString());
      UserResponseModel userResponseModel = UserResponseModel(
        statusCode: 200,
        message: "Login Successful",
        userData: UserModel.fromJson(response.data["data"]),
        token: response.data["token"],
      );
      debugPrint(userResponseModel.toString());
      return userResponseModel;
    } else {
      return UserResponseModel(
          statusCode: response.statusCode ?? 400, message: "Login Error");
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
  return UserResponseModel(statusCode: 400, message: "Unknown Error");
}

Future<UserResponseModel> loginAdmin(String username, String password) async {
  String path = "admin/login/";

  HttpService http = HttpService();
  late Response response;

  String email = "";
  String phone = "";
  if (username.isValidEmail()) {
    email = username;
  } else if (username.isValidMobile()) {
    phone = username;
  } else {
    return UserResponseModel(statusCode: 400, message: "Invalid Username");
  }

  Object body = jsonEncode({
    "email": email,
    "phone": phone,
    "password": password,
  });
  debugPrint(body.toString());
  try {
    response = await http.postRequest(path, body);
    if (response.statusCode == 200) {
      debugPrint(response.data.toString());
      UserModel userModel = UserModel.fromJson(response.data["data"]);
      userModel = userModel.copyWith(userType: UserEnum.admin);
      UserResponseModel userResponseModel = UserResponseModel(
        statusCode: 200,
        message: "Login Successful",
        userData: userModel,
        token: response.data["token"],
      );
      debugPrint(userResponseModel.toString());
      return userResponseModel;
    } else {
      return UserResponseModel(
          statusCode: response.statusCode ?? 400, message: "Login Error");
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
  return UserResponseModel(statusCode: 400, message: "Unknown Error");
}
