import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/data/services/http_service.dart';

Future<ResponseModel> addPost(PostModel post, String token) async {
  String path = "student/create_post";

  HttpService http = HttpService();
  late Response response;

  Object body = post.toJson();

  debugPrint(body.toString());
  try {
    response = await http.postRequestProtected(path, body, token);
    if (response.statusCode == 200) {
      debugPrint(response.data.toString());
      ResponseModel responseModel = ResponseModel(
        statusCode: 200,
        message: "Post Added Successfully",
      );
      debugPrint(responseModel.toString());
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
