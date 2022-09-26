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
                movie.getCoverImageRoute() != ""
                    ? Image.network(
                        movie.getCoverImageRoute(),
                        fit: BoxFit.cover,
                      )
                    : const Text("..."),
                ListTile(
                  leading: const Text("Title",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                  minLeadingWidth: 120,
                  title: Text(movie.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                ),
                ListTile(
                  leading: const Text("Original Title",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                  minLeadingWidth: 120,
                  title: Text("${movie.originalTitle} ",
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                ),
                ListTile(
                  leading: const Text("Original Lenguaje",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                  minLeadingWidth: 120,
                  title: Text(movie.originalLanguage,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                ),
                ListTile(
                  leading: const Text("Release Date",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                  minLeadingWidth: 120,
                  title: Text("${movie.releaseDate} ",
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                ),
                ListTile(
                  leading: const Text("Vote Average",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                  minLeadingWidth: 120,
                  title: Text("${movie.voteAverage} ",
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                ),
                ListTile(
                  leading: const Text("Vote Count",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                  minLeadingWidth: 120,
                  title: Text("${movie.voteCount} ",
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                ),
                ListTile(
                  leading: const Text("popularity",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                  minLeadingWidth: 120,
                  title: Text("${movie.popularity} ",
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                ),
                ListTile(
                  leading: const Text("Overview",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                  minLeadingWidth: 120,
                  title: Text(movie.overview,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                ),
                ListTile(
                  leading: const Text("Genre",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold")),
                  minLeadingWidth: 120,
                  // title: Text("${movie.genreIds} ",
                  //     style: const TextStyle(
                  //         fontWeight: FontWeight.w900,
                  //         color: Colors.black,
                  //         fontSize: 12,
                  //         fontFamily: "Josefins Sans - Bold")),
                ),
              ],
            )));
  }
}
