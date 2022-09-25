import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_catalog_app/models/genre_model.dart';
import 'package:movie_catalog_app/models/genre_response.dart';

import '../enviroment.dart';

class GenreProvider extends ChangeNotifier {
  static final _baseUrl = baseUrl;
  static final _apiKey = apiKey;

  List<GenreModel> genres = [];

  GenreProvider() {
    getAllGenres();
  }

  Future<dynamic> getAllGenres() async {
    var url = Uri.parse('$_baseUrl/3/genre/movie/list?api_key=$_apiKey');
    final response = await http.get(url);
    final genresResponse = GenreResponse.fromJson(response.body);
    genres = genresResponse.genres;
    notifyListeners();

    return genres;
  }
}
