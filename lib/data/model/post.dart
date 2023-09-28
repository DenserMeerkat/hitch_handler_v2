import 'package:hitch_handler_v2/data/model/comment.dart';
import 'package:hitch_handler_v2/data/model/enums.dart';
import 'package:hitch_handler_v2/data/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'desc')
  final String desc;
  @JsonKey(name: 'state')
  final State state;
  @JsonKey(name: 'author')
  final User author;
  @JsonKey(name: 'authorId')
  final String authorId;
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;
  @JsonKey(name: 'domain')
  final String? domain;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'likedBy')
  final List<User> likedBy;
  @JsonKey(name: 'archivedBy')
  final List<User> archivedBy;
  @JsonKey(name: 'comments')
  final List<Comment> comments;

  Post({
    required this.id,
    required this.title,
    required this.desc,
    required this.state,
    required this.author,
    required this.authorId,
    required this.createdAt,
    required this.updatedAt,
    this.domain,
    this.location,
    required this.likedBy,
    required this.archivedBy,
    required this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
