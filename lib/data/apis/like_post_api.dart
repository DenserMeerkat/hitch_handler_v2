import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hitch_handler_v2/data/constants.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/data/services/http_service.dart';

Future<ResponseModel> likePost(String postId, String roll, String token) async {
  HttpService http = HttpService();
  late Response response;

  Object body = jsonEncode({
    "pid": postId,
  });

  try {
    response = await http.postRequestProtected(studentAddPostPath, body, token);
    if (response.statusCode == 200) {
      debugPrint(response.data.toString());
      ResponseModel responseModel = ResponseModel(
        statusCode: 200,
        message: "Post Liked Successfully",
      );
      debugPrint(responseModel.toString());
      return responseModel;
    } else {
      return ResponseModel(
          statusCode: response.statusCode ?? 400, message: "Error in Liking");
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
  return ResponseModel(statusCode: 400, message: "Unknown Error");
}
