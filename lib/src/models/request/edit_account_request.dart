import 'dart:convert';

class EditAccountRequest {
  EditAccountRequest({
    required this.newPassword,
    required this.newName,
  });

  String newPassword;
  String newName;

  factory EditAccountRequest.fromRawJson(String str) =>
      EditAccountRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EditAccountRequest.fromJson(Map<String, dynamic> json) => EditAccountRequest(
    newPassword: json["newPassword"],
    newName: json["newName"],
  );

  Map<String, dynamic> toJson() => {
    "newPassword": newPassword,
    "newName": newName,
  };
}
