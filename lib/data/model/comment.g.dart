// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as String,
      message: json['message'] as String,
      state: $enumDecodeNullable(_$StateEnumMap, json['state']),
      author: User.fromJson(json['author'] as Map<String, dynamic>),
      authorId: json['authorId'] as String,
      postId: json['postId'] as String,
      post: Post.fromJson(json['post'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'state': _$StateEnumMap[instance.state],
      'author': instance.author,
      'authorId': instance.authorId,
      'postId': instance.postId,
      'post': instance.post,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$StateEnumMap = {
  State.review: 'review',
  State.working: 'working',
  State.finished: 'finished',
  State.closed: 'closed',
};
