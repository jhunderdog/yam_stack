import 'dart:convert';

class LoginResponse {
  LoginResponse({
    required this.message,
    required this.code,
    required this.accessToken,
    required this.refreshToken,
    required this.status
  });

  String message;
  String code;
  String accessToken;
  String refreshToken;
  int status;

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        code : json["code"],
        status: json["status"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"]
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code" : code,
        "status" : status,
        "accessToken" : accessToken,
        "refreshToken" : refreshToken
      };
}
