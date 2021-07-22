import 'dart:convert';

class PasswdCheckRequest {
  PasswdCheckRequest({
    required this.password,
  });

  String password;

  factory PasswdCheckRequest.fromRawJson(String str) =>
      PasswdCheckRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PasswdCheckRequest.fromJson(Map<String, dynamic> json) =>
      PasswdCheckRequest(
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
      };
}
