import 'package:flutter/material.dart';
import 'package:movie_catalog_app/models/movie_model.dart';

class SingleMovie extends StatelessWidget {
  final MovieModel movie;
  const SingleMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Image.network(
                  movie.getCoverImageRoute(),
                  fit: BoxFit.cover,
                ),
                ListTile(
                  leading: const Text("Title"),
                  minLeadingWidth: 100,
                  title: Text(movie.title),
                ),
                ListTile(
                  leading: const Text("Overview"),
                  minLeadingWidth: 100,
                  title: Text(movie.overview),
                ),
                ListTile(
                  leading: const Text("Original Lenguaje"),
                  minLeadingWidth: 100,
                  title: Text(movie.originalLanguage),
                ),
                ListTile(
                  leading: const Text("Genre"),
                  minLeadingWidth: 100,
                  title: Text("${movie.genreIds[0]} "),
                )
              ],
            )));
  }
}
