import 'dart:convert';

import 'package:movie_catalog_app/models/genre_model.dart';

class GenreResponse {
  GenreResponse({
    required this.genres,
  });

  List<GenreModel> genres;

  factory GenreResponse.fromJson(String str) =>
      GenreResponse.fromMap(json.decode(str));

  factory GenreResponse.fromMap(Map<String, dynamic> json) => GenreResponse(
        genres: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromMap(x))),
      );
}
