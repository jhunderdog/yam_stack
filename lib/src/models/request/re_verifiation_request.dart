
import 'dart:convert';

class ReVerificationRequest {
  ReVerificationRequest({
    required this.email
  });

  String email;

  factory ReVerificationRequest.fromRawJson(String str) =>
      ReVerificationRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReVerificationRequest.fromJson(Map<String, dynamic> json) => ReVerificationRequest(
    email: json["email"]
  );

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}
