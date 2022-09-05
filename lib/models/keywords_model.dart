import 'dart:convert';

List<KeywordsModel> keywordsModelFromJson(String str) =>
    List<KeywordsModel>.from(
        json.decode(str).map((x) => KeywordsModel.fromJson(x)));

String keywordsModelToJson(List<KeywordsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KeywordsModel {
  KeywordsModel({
    this.id,
    this.userId,
    required this.keyword,
  });

  int? id;
  int? userId;
  String keyword;

  factory KeywordsModel.fromJson(Map<String, dynamic> json) => KeywordsModel(
        id: json["id"],
        userId: json["user_id"],
        keyword: json["keyword"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "keyword": keyword,
      };
}
