import 'dart:convert';

List<Places> placesFromJson(String str) =>
    List<Places>.from(json.decode(str).map((x) => Places.fromJson(x)));

String placesToJson(List<Places> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Places {
  List<String> spaceList = List<String>.filled(500, "0", growable: true);
  int id;
  String title;

  String displayName;
  String meta;
  String discription;

  Places({
    required this.spaceList,
    required this.id,
    required this.title,
    required this.displayName,
    required this.meta,
    required this.discription,
  });

  factory Places.fromJson(Map<String, dynamic> json) => Places(
        spaceList: ["spaceList"],
        id: json["id"],
        title: json["title"],
        displayName: json["displayName"],
        meta: json["meta"],
        discription: json["discription"],
      );

  Map<String, dynamic> toJson() => {
        "spaceList": spaceList,
        "id": id,
        "title": title,
        "displayName": displayName,
        "meta": meta,
        "discription": discription,
      };

  fromJson(Map<String, Object?> c) {}
}
