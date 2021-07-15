import 'dart:convert';

class RestaurantListRequest {
  RestaurantListRequest({
    required this.mode,
    required this.x,
    required this.y
  });

  String mode;
  String x;
  String y;


  factory RestaurantListRequest.fromRawJson(String str) =>
      RestaurantListRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RestaurantListRequest.fromJson(Map<String, dynamic> json) =>
      RestaurantListRequest(
        mode: json["mode"],
        x: json["x"],
        y: json["y"]
      );

  Map<String, dynamic> toJson() => {
    "mode": mode,
    "x": x,
    "y": y
  };
}
