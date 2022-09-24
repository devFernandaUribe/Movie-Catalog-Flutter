import 'package:flutter/material.dart';
import 'package:movie_catalog_app/models/movie_model.dart';

class SingleMovie extends StatelessWidget {
  final MovieModel movie;
  const SingleMovie({super.key, required this.movie});

  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ListTile(
          leading: Text("Title"),
          title: Text(movie.title),
        ),
        ListTile(
          leading: Text("Overview"),
          title: Text(movie.overview),
        ),
        ListTile(
          leading: Text("Original Lenguaje"),
          title: Text(movie.originalLanguage),
        ),
        ListTile(
          leading: Text("Genre"),
          title: Text("${movie.genreIds[0]} "),
        )
      ],
    ));
  }
}
