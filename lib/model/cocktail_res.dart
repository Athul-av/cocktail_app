// To parse this JSON data, do


import 'dart:convert';

Cocktails cocktailsFromJson(String str) => Cocktails.fromJson(json.decode(str));

String cocktailsToJson(Cocktails data) => json.encode(data.toJson());

class Cocktails {
    List<Map<String, String?>>? drinks;

    Cocktails({
        this.drinks,
    });

    factory Cocktails.fromJson(Map<String, dynamic> json) => Cocktails(
        drinks: json["drinks"] == null ? [] : List<Map<String, String?>>.from(json["drinks"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "drinks": drinks == null ? [] : List<dynamic>.from(drinks!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}
