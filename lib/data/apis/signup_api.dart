import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hitch_handler_v2/data/constants.dart';
import 'package:hitch_handler_v2/data/services/http_service.dart';

Future<String> getUser(String roll, String dob) async {
  String path = "/protected/api/v1/authenticate/signup/";

  List<String> date = dob.split('-');
  String formattedDate = '${date[2]}-${date[1]}-${date[0]}';
  HttpService http = HttpService();
  late Response response;

  try {
    response = await http.getRequest('$path$roll/$formattedDate');
    if (kDebugMode) {
      debugPrint(response.data.toString());
    }
    if (response.statusCode == 200) {
      return "user found";
    } else {
      return "user not found";
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
  return "error occurred";
}

Future<String> getUser1(String roll, String dob) async {
  String path = "/protected/api/v1/authenticate/signup/";

  late http.Response response;

  List<String> date = dob.split('-');
  String formattedDate = '${date[2]}-${date[1]}-${date[0]}';
  try {
    response = await http.get(
      Uri.parse('$baseURL$path$roll/$formattedDate'),
      headers: {
        "content-type": "application/json",
        "x-service-application": "hitch-handler",
        "api-key": dotenv.env['API_KEY'] ?? "API_KEY not found",
      },
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
