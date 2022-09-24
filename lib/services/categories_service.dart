import 'dart:convert';
import 'package:movie_catalog_app/enviroment.dart';
import 'package:movie_catalog_app/models/categorie_model.dart';
import 'package:http/http.dart' as http;

class CategoriesService {
  static final _baseUrl = baseUrl;
  static final _apiKey = apiKey;

  /// getAll  Categories
  /// @CategorieModel
  /// @Return: Future<List<CategorieModel>>
  // Future<List<CategorieModel>>
  void getAllCategories() async {
    // List<CategorieModel> test = [
    //   {"id": 1, "categoriey": "arroz"}
    // ] as List<CategorieModel>;

    var url = Uri.http(_baseUrl, '/genre/movie/list?', {'api_key': _apiKey});

    final response = await http.get(url);
    if (response.statusCode != 200) return print('error');
    print("response-------------------------${response.body}");
    Map data = jsonDecode(response.body);
    print("data-------------------------$data");

    // List<CategorieModel> categorieModel = List<CategorieModel>.from(json
    //     .decode(data)
    //     .map((x) => CategorieModel.fromJson(x)));
    // return response.body;
  }
}
