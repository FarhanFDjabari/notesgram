class BaseResponse {
  int status;
  String message;

  BaseResponse({
    required this.status,
    required this.message,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        status: json["statusCode"],
        message: json["message"],
      );

  Map<dynamic, dynamic> toJson() => <String, dynamic>{
        'statusCode': status,
        'message': message,
      };
}
