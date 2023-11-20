// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedPostModelImpl _$$FeedPostModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedPostModelImpl(
      postid: json['postid'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String,
      roll: json['roll'] as String,
      domain: json['domain'] as String,
      likes: json['likes'] as int,
      liked: (json['liked'] as List<dynamic>).map((e) => e as String).toList(),
      location: json['location'] as String? ?? "",
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      currentstatus: json['currentstatus'] as String? ?? "INPROGRESS",
      type: json['type'] as String? ?? "public",
    );

Map<String, dynamic> _$$FeedPostModelImplToJson(_$FeedPostModelImpl instance) =>
    <String, dynamic>{
      'postid': instance.postid,
      'title': instance.title,
      'desc': instance.desc,
      'roll': instance.roll,
      'domain': instance.domain,
      'likes': instance.likes,
      'liked': instance.liked,
      'location': instance.location,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'currentstatus': instance.currentstatus,
      'type': instance.type,
    };
