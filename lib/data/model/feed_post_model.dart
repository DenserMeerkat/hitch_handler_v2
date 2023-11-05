import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_post_model.freezed.dart';
part 'feed_post_model.g.dart';

@Freezed()
class FeedPostModel with _$FeedPostModel {
  const factory FeedPostModel({
    required String postid,
    required String title,
    required String desc,
    required String roll,
    required String domain,
    @Default("") String location,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default("INPROGRESS") String currentstatus,
    @Default("public") String type,
  }) = _FeedPostModel;

  factory FeedPostModel.fromJson(Map<String, Object?> json) =>
      _$FeedPostModelFromJson(json);
}
