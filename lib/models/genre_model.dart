import 'dart:convert';

class GenreModel {
  GenreModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory GenreModel.fromJson(String str) =>
      GenreModel.fromMap(json.decode(str));

  factory GenreModel.fromMap(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
