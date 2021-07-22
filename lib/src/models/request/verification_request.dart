import 'dart:convert';

class VerificationRequest {
  VerificationRequest({
    required this.email,
    required this.authCode,
  });

  String email;
  String authCode;

  factory VerificationRequest.fromRawJson(String str) =>
      VerificationRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerificationRequest.fromJson(Map<String, dynamic> json) =>
      VerificationRequest(
          email: json["email"],
          authCode: json["authCode"],

      );

  Map<String, dynamic> toJson() => {
    "email": email,
    "authCode": authCode,
  };
}
