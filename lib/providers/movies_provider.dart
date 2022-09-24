import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_catalog_app/models/movie_model.dart';
import 'package:movie_catalog_app/models/movie_response.dart';

import '../enviroment.dart';

class MoviesProvider extends ChangeNotifier {
  static final _baseUrl = baseUrl;
  static final _apiKey = apiKey;

  List<MovieModel> popularMovies = [];

  MoviesProvider() {
    getAllMovies();
  }

  Future<dynamic> getAllMovies() async {
    var url = Uri.parse('$_baseUrl/3/movie/popular?api_key=$_apiKey');
    final response = await http.get(url);
    final pupularMovieResponse = MovieResponse.fromJson(response.body);
    popularMovies = pupularMovieResponse.results;
    notifyListeners();

    return popularMovies;
  }
}
