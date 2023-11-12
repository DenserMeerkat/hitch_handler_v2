import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hitch_handler_v2/data/constants.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/data/services/http_service.dart';

Future<FeedResponseModel> fetchFeed(String token, {int cursor = 0}) async {
  HttpService http = HttpService();
  late Response response;
  Map<String, dynamic>? queryParameters = {
    "cursor": cursor,
  };
  try {
    response = await http.getRequestProtected(
      studentFeedPath,
      token,
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      FeedResponseModel feedResponseModel = FeedResponseModel(
        statusCode: 200,
        message: "Fetched Successfully",
        feedData: List<FeedPostModel>.from(
            response.data["posts"].map((x) => FeedPostModel.fromJson(x))),
        cursor: response.data["nextCursor"],
      );
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

Future<FeedResponseModel> fetchFeedAdmin(String token, String domain,
    {int cursor = 0}) async {
  HttpService http = HttpService();
  late Response response;
  Map<String, dynamic>? queryParameters = {
    "cursor": cursor,
  };
  Object body = jsonEncode({
    "domain": domain,
  });
  try {
    response = await http.postRequestProtected(
      adminFeedPath,
      body,
      token,
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      FeedResponseModel feedResponseModel = FeedResponseModel(
        statusCode: 200,
        message: "Fetched Successfully",
        feedData: List<FeedPostModel>.from(
            response.data.map((x) => FeedPostModel.fromJson(x))),
      );
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
