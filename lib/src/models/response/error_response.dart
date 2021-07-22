import 'dart:convert';

class ErrorResponse {
  ErrorResponse({
    required this.message,
    required this.code,
    required this.status
  });

  String message;
  String code;
  int status;

  factory ErrorResponse.fromRawJson(String str) =>
      ErrorResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
          message: json["message"],
          code: json["code"],
          status: json["status"]
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code" : code,
        "status" : status
      };
}
