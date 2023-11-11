import 'package:hitch_handler_v2/data/model/feed_post_model.dart';

class FeedResponseModel {
  FeedResponseModel({
    required this.statusCode,
    required this.message,
    this.feedData,
    this.cursor,
  });

  int statusCode;
  String message;
  List<FeedPostModel>? feedData;
  int? cursor;

  factory FeedResponseModel.fromJson(Map<String, dynamic> json) =>
      FeedResponseModel(
        statusCode: json["statusCode"],
        message: json["message"],
        feedData: List<FeedPostModel>.from(
            json["feedData"].map((x) => FeedPostModel.fromJson(x))),
        cursor: json["cursor"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "statusCode": statusCode,
      "message": message,
      "feedData": List<dynamic>.from(feedData!.map((x) => x.toJson())),
    };
    if (cursor != null) {
      data["cursor"] = cursor;
    }
    return data;
  }

  @override
  String toString() {
    return 'FeedResponseModel{statusCode: $statusCode, message: $message, feedData: $feedData, cursor: $cursor}';
  }
}
