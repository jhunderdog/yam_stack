

import 'dart:convert';


class ReviewDeleteRequest {
  ReviewDeleteRequest({
    required this.review_id
  });

  String review_id;


  factory ReviewDeleteRequest.fromRawJson(String str) =>
      ReviewDeleteRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReviewDeleteRequest.fromJson(Map<String, dynamic> json) =>
      ReviewDeleteRequest(
        review_id: json["review_id"],

      );

  Map<String, dynamic> toJson() => {
    "review_id": review_id,

  };
}
