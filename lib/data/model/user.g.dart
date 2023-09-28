// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      roll: json['roll'] as String,
      dob: DateTime.parse(json['dob'] as String),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      password: json['password'] as String,
      type: $enumDecode(_$RoleEnumMap, json['type']),
      domain: json['domain'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      posts: (json['posts'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      likedPosts: (json['likedPosts'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      archives: (json['archives'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'roll': instance.roll,
      'dob': instance.dob.toIso8601String(),
      'email': instance.email,
      'phone': instance.phone,
      'name': instance.name,
      'password': instance.password,
      'type': _$RoleEnumMap[instance.type]!,
      'domain': instance.domain,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'posts': instance.posts,
      'likedPosts': instance.likedPosts,
      'archives': instance.archives,
      'comments': instance.comments,
    };

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.user: 'user',
  Role.moderator: 'moderator',
};
