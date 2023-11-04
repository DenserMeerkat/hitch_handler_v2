import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed()
class UserModel with _$UserModel {
  const factory UserModel({
    required String name,
    required String email,
    required String phone,
    String? roll,
    @Default(UserEnum.student) UserEnum userType,
    @Default("") String domain,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
