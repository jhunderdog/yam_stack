import 'dart:convert';

class RegisterResponse {
  RegisterResponse({
    required this.message,
    required this.code,
    required this.status
  });

  String message;
  String code;
  int status;

  factory RegisterResponse.fromRawJson(String str) =>
      RegisterResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        message: json["message"],
        code: json["code"],
          status : json["status"]
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "status" : status
      };
}
