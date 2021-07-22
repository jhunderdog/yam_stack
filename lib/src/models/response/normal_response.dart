import 'dart:convert';

class normalResponse {
  normalResponse({
    required this.message,
    required this.code,
    required this.status
  });

  String message;
  String code;
  int status;


  factory normalResponse.fromRawJson(String str) =>
      normalResponse.fromJson(json.decode(str));


  String toRawJson() => json.encode(toJson());

  factory normalResponse.fromJson(Map<String, dynamic> json) =>
      normalResponse(
          message: json["message"],
        code: json["code"],
        status: json["status"]
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
    "status": status
  };
}
