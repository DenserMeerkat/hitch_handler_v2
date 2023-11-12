// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      roll: json['roll'] as String?,
      liked:
          (json['liked'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      bookmarked: (json['bookmarked'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      userType: $enumDecodeNullable(_$UserEnumEnumMap, json['userType']) ??
          UserEnum.student,
      domain: json['domain'] as String? ?? "",
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'roll': instance.roll,
      'liked': instance.liked,
      'bookmarked': instance.bookmarked,
      'userType': _$UserEnumEnumMap[instance.userType]!,
      'domain': instance.domain,
    };

const _$UserEnumEnumMap = {
  UserEnum.student: 'student',
  UserEnum.admin: 'admin',
};
