import 'package:hitch_handler_v2/data/model/enums.dart';
import 'package:hitch_handler_v2/data/model/post.dart';
import 'package:hitch_handler_v2/data/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'state')
  final State? state;
  @JsonKey(name: 'author')
  final User author;
  @JsonKey(name: 'authorId')
  final String authorId;
  @JsonKey(name: 'postId')
  final String postId;
  @JsonKey(name: 'post')
  final Post post;
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  Comment({
    required this.id,
    required this.message,
    this.state,
    required this.author,
    required this.authorId,
    required this.postId,
    required this.post,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
