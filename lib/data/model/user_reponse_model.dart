import 'package:hitch_handler_v2/data/model/user_model.dart';

class UserResponseModel {
  UserResponseModel({
    required this.statusCode,
    required this.message,
    this.userData,
    this.token,
  });

  int statusCode;
  String message;
  UserModel? userData;
  String? token;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        statusCode: json["statusCode"],
        message: json["message"],
        userData: UserModel.fromJson(json["userData"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "userData": userData?.toJson(),
        "token": token,
      };
  @override
  String toString() {
    return 'UserResponseModel{statusCode: $statusCode, message: $message, userData: $userData, token: $token}';
  }
}
