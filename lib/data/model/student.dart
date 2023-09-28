import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'roll')
  final String roll;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'dob')
  final DateTime dob;

  Student({
    required this.id,
    required this.roll,
    required this.name,
    this.email,
    this.phone,
    required this.dob,
  });

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
