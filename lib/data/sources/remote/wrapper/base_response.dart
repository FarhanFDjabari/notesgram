class BaseResponse {
  int status;
  String message;
  String domain;

  BaseResponse({
    required this.status,
    required this.message,
    required this.domain,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        status: json["statusCode"],
        message: json["message"],
        domain: json["domain"],
      );

  Map<dynamic, dynamic> toJson() => <String, dynamic>{
        'statusCode': this.status,
        'message': this.message,
      };
}
