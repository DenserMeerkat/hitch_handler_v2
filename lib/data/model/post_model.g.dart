// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      title: json['title'] as String,
      desc: json['desc'] as String,
      roll: json['roll'] as String,
      domain: json['domain'] as String,
      location: json['location'] as String? ?? "",
      type: json['type'] as String? ?? "public",
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'desc': instance.desc,
      'roll': instance.roll,
      'domain': instance.domain,
      'location': instance.location,
      'type': instance.type,
    };
