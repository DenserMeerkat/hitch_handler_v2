import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hitch_handler_v2/data/constants.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/data/services/http_service.dart';

Future<ResponseModel> addPost(PostModel post, String token) async {
  HttpService http = HttpService();
  late Response response;

  Object body = post.toJson();

  try {
    response = await http.postRequestProtected(studentAddPostPath, body, token);
    if (response.statusCode == 200) {
      ResponseModel responseModel = ResponseModel(
        statusCode: 200,
        message: "Post Added Successfully",
      );
      return responseModel;
    } else {
      return ResponseModel(
          statusCode: response.statusCode ?? 400, message: "Error in Posting");
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
  return ResponseModel(statusCode: 400, message: "Unknown Error");
}
