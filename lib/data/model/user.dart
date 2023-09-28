import 'package:hitch_handler_v2/data/model/comment.dart';
import 'package:hitch_handler_v2/data/model/enums.dart';
import 'package:hitch_handler_v2/data/model/post.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'roll')
  final String roll;
  @JsonKey(name: 'dob')
  final DateTime dob;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'type')
  final Role type;
  @JsonKey(name: 'domain')
  final String? domain;
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;
  @JsonKey(name: 'posts')
  final List<Post> posts;
  @JsonKey(name: 'likedPosts')
  final List<Post> likedPosts;
  @JsonKey(name: 'archives')
  final List<Post> archives;
  @JsonKey(name: 'comments')
  final List<Comment> comments;

  User({
    required this.id,
    required this.roll,
    required this.dob,
    this.email,
    this.phone,
    this.name,
    required this.password,
    required this.type,
    this.domain,
    required this.createdAt,
    required this.updatedAt,
    required this.posts,
    required this.likedPosts,
    required this.archives,
    required this.comments,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
