///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class YamEditRequest {
/*
{
  "id": 140,
  "foods": [
    "추가음식"
  ],
  "tags": [
    "수정태그"
  ],
  "memo": "얌 수정"
}
*/

  int? id;
  List<String?>? foods;
  List<String?>? tags;
  String? memo;

  YamEditRequest({
    this.id,
    this.foods,
    this.tags,
    this.memo,
  });
  YamEditRequest.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    if (json["foods"] != null) {
      final v = json["foods"];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      foods = arr0;
    }
    if (json["tags"] != null) {
      final v = json["tags"];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      tags = arr0;
    }
    memo = json["memo"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    if (foods != null) {
      final v = foods;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data["foods"] = arr0;
    }
    if (tags != null) {
      final v = tags;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data["tags"] = arr0;
    }
    data["memo"] = memo;
    return data;
  }
}
