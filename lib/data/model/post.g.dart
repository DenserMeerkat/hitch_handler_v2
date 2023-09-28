// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String,
      state: $enumDecode(_$StateEnumMap, json['state']),
      author: User.fromJson(json['author'] as Map<String, dynamic>),
      authorId: json['authorId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      domain: json['domain'] as String?,
      location: json['location'] as String?,
      likedBy: (json['likedBy'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      archivedBy: (json['archivedBy'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'state': _$StateEnumMap[instance.state]!,
      'author': instance.author,
      'authorId': instance.authorId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'domain': instance.domain,
      'location': instance.location,
      'likedBy': instance.likedBy,
      'archivedBy': instance.archivedBy,
      'comments': instance.comments,
    };

const _$StateEnumMap = {
  State.review: 'review',
  State.working: 'working',
  State.finished: 'finished',
  State.closed: 'closed',
};
