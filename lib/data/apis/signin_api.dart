import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hitch_handler_v2/data/constants.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hitch_handler_v2/app/utils/string_extenstions.dart';
import 'package:hitch_handler_v2/data/services/http_service.dart';

Future<String> loginUser(String username, String password) async {
  String path = "/protected/api/v1/authenticate/signin";

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
  }

  Object body = jsonEncode({
    "roll": roll,
    "email": email,
    "phone": phone,
    "password": password,
  });

  try {
    response = await http.postRequest(path, body);
    if (response.statusCode == 200) {
      return "user found";
    } else {
      return "${response.statusCode}";
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
  return "error occurred";
}

Future<String> loginUser1(String username, String password) async {
  String path = "/protected/api/v1/authenticate/signin";

  String email = "";
  String phone = "";
  String roll = "";
  if (username.isValidEmail()) {
    email = username;
  } else if (username.isValidRoll()) {
    roll = username;
  } else if (username.isValidMobile()) {
    phone = username;
  }

  Object body = jsonEncode({
    "roll": roll,
    "email": email,
    "phone": phone,
    "password": password,
  });

  try {
    http.Response response = await http.post(
      Uri.parse('$baseURL$path'),
      headers: {
        "content-type": "application/json",
        "x-service-application": "hitch-handler",
        "api-key": dotenv.env['API_KEY'] ?? "API_KEY not found",
      },
      body: body,
    );
    if (response.statusCode == 200) {
      return "user found";
    } else {
      return "${response.statusCode} ${response.body}";
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
  return "error occurred";
}
