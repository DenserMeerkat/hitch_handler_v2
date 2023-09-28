// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      id: json['id'] as String,
      roll: json['roll'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      dob: DateTime.parse(json['dob'] as String),
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'roll': instance.roll,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'dob': instance.dob.toIso8601String(),
    };
