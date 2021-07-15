import 'dart:convert';

class LoginResponse {
  LoginResponse({
    required this.message,
    required this.code,
    required this.status
  });

  String message;
  String code;
  int status;

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        code : json["code"],
        status: json["status"]
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code" : code,
        "status" : status
      };
}
