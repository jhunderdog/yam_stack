///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class ReviewResponse {
/*
{
  "id": 1,
  "visitTime": "2021-07-16",
  "genTime": "2021-07-16",
  "imagePath": "",
  "comment": "맛집임 추천!",
  "company": "FRIEND",
  "mealTime": null,
  "likeCount": 1,
  "nickName": "test",
  "restaurantName": "맛집",
  "iliked": true,
  "shared": true
}
*/

  int? id;
  String? visitTime;
  String? genTime;
  String? imagePath;
  String? comment;
  String? company;
  String? mealTime;
  int? likeCount;
  String? nickName;
  String? restaurantName;
  bool? iliked;
  bool? shared;

  ReviewResponse({
    this.id,
    this.visitTime,
    this.genTime,
    this.imagePath,
    this.comment,
    this.company,
    this.mealTime,
    this.likeCount,
    this.nickName,
    this.restaurantName,
    this.iliked,
    this.shared,
  });
  ReviewResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    visitTime = json["visitTime"]?.toString();
    genTime = json["genTime"]?.toString();
    imagePath = json["imagePath"]?.toString();
    comment = json["comment"]?.toString();
    company = json["company"]?.toString();
    mealTime = json["mealTime"]?.toString();
    likeCount = json["likeCount"]?.toInt();
    nickName = json["nickName"]?.toString();
    restaurantName = json["restaurantName"]?.toString();
    iliked = json["iliked"];
    shared = json["shared"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["visitTime"] = visitTime;
    data["genTime"] = genTime;
    data["imagePath"] = imagePath;
    data["comment"] = comment;
    data["company"] = company;
    data["mealTime"] = mealTime;
    data["likeCount"] = likeCount;
    data["nickName"] = nickName;
    data["restaurantName"] = restaurantName;
    data["iliked"] = iliked;
    data["shared"] = shared;
    return data;
  }
}