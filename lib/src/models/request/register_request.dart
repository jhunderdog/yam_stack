import 'dart:convert';

class RegisterRequest {
  RegisterRequest({
    required this.email,
    required this.password,
    required this.name
  });

  String email;
  String password;
  String name;

  factory RegisterRequest.fromRawJson(String str) =>
      RegisterRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        email: json["email"],
        password: json["password"],
          name : json["name"]
      );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "name" : name
  };
}
