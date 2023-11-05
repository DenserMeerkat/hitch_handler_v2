import 'package:hitch_handler_v2/data/model/feed_post_model.dart';

class FeedResponseModel {
  FeedResponseModel({
    required this.statusCode,
    required this.message,
    this.feedData,
  });

  int statusCode;
  String message;
  List<FeedPostModel>? feedData;

  factory FeedResponseModel.fromJson(Map<String, dynamic> json) =>
      FeedResponseModel(
        statusCode: json["statusCode"],
        message: json["message"],
        feedData: List<FeedPostModel>.from(
            json["feedData"].map((x) => FeedPostModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "feedData": List<dynamic>.from(feedData!.map((x) => x.toJson())),
      };
  @override
  String toString() {
    return 'FeedResponseModel{statusCode: $statusCode, message: $message, feedData: $feedData}';
  }
}
