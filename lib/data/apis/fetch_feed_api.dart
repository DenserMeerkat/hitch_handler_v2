import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/data/services/http_service.dart';

Future<FeedResponseModel> fetchFeed(String token) async {
  String path = "student/view_public/";

  HttpService http = HttpService();
  late Response response;

  try {
    response = await http.getRequestProtected(path, token);
    if (response.statusCode == 200) {
      debugPrint(response.data.toString());
      FeedResponseModel feedResponseModel = FeedResponseModel(
        statusCode: 200,
        message: "Fetched Successfully",
        feedData: List<FeedPostModel>.from(
            response.data.map((x) => FeedPostModel.fromJson(x))),
      );
      debugPrint(feedResponseModel.toString());
      return feedResponseModel;
    } else {
      return FeedResponseModel(
          statusCode: response.statusCode ?? 400, message: "Fetch Error");
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
  return FeedResponseModel(statusCode: 400, message: "Unknown Error");
}
