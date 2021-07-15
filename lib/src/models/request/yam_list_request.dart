

import 'dart:convert';

class YamListRequest {
  YamListRequest({
    // required this.region,
    // required this.category,
    // required this.tags,
    // required this.searchName,
    required this.mode

  });

  // String region;
  // String category;
  // List<String> tags;
  // String searchName;
  int mode;

  factory YamListRequest.fromRawJson(String str) =>
  YamListRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory YamListRequest.fromJson(Map<String, dynamic> json) => YamListRequest(
    // region: json["region"],
    // category: json["category"],
    // tags: json["tags"],
    // searchName: json["searchName"],
    mode: json["mode"]

  );

  Map<String, dynamic> toJson() => {
    // "region": region,
    // "category": category,
    // "tags" : tags,
    // "searchName" : searchName,
    "mode" : mode
  };
}


