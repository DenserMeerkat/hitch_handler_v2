import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:hitch_handler_v2/data/services/http_service.dart';

Future<String> loginStudent(String username, String password) async {
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
    return "Invalid Username";
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
      return "user found";
    } else {
      return "${response.statusCode}";
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
  return "error occurred";
}

Future<String> loginAdmin(String username, String password) async {
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
    return "Invalid Username";
  }

  Object body = jsonEncode({
    "email": email,
    "phone": phone,
    "password": password,
  });

  try {
    response = await http.postRequest(path, body);
    if (response.statusCode == 200) {
      debugPrint(response.data.toString());
      return "user found";
    } else {
      return "${response.statusCode}";
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
  return "error occurred";
}
