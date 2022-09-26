import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_catalog_app/models/genre_model.dart';
import 'package:movie_catalog_app/models/genre_response.dart';

import '../enviroment.dart';
import 'db_provider.dart';

class GenreProvider extends ChangeNotifier {
  static final _baseUrl = baseUrl;
  static final _apiKey = apiKey;

  List<GenreModel> genres = [];

  GenreProvider() {
    getAllGenres();
  }

  Future<dynamic> getAllGenres() async {
    try {
      var url = Uri.parse('$_baseUrl/3/genre/movie/list?api_key=$_apiKey');
      final response = await http.get(url);
      final genresResponse = GenreResponse.fromJson(response.body);
      genres = genresResponse.genres;

      switch (response.statusCode) {
        case 200:
          print('in 200 case gnere');
          DBProvider.db.deleteAllGenres();
          genres.forEach((genre) {
            DBProvider.db.createGenre(genre);
            print('Inserting $genre');
          });

          return genres;

        default:
          return DBProvider.db.getAllGenres();
      }
    } catch (e) {
      print("hi from catch on get all genres provider");
      return DBProvider.db.getAllGenres();
    }

    // notifyListeners();

    // return genres;
  }
}
