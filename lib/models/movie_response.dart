import 'dart:convert';
import 'movie_model.dart';

class MovieResponse {
  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<MovieModel> results;
  int totalPages;
  int totalResults;

  factory MovieResponse.fromJson(String str) =>
      MovieResponse.fromMap(json.decode(str));

  factory MovieResponse.fromMap(Map<String, dynamic> json) => MovieResponse(
        page: json["page"],
        results: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
