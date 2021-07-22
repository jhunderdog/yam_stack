
import 'dart:convert';

class RefreshTokenRequest {
  RefreshTokenRequest({
    required this.refreshToken
  });

  String refreshToken;

  factory RefreshTokenRequest.fromRawJson(String str) =>
      RefreshTokenRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) => RefreshTokenRequest(
      refreshToken: json["refreshToken"]
  );

  Map<String, dynamic> toJson() => {
    "refreshToken": refreshToken,
  };
}