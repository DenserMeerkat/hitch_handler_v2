class ResponseModel {
  ResponseModel({
    required this.statusCode,
    required this.message,
  });

  int statusCode;
  String message;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
      };
  @override
  String toString() {
    return 'ResponseModel{statusCode: $statusCode, message: $message}';
  }
}
