import 'package:flutter/material.dart';
import 'package:movie_catalog_app/models/movie_model.dart';

class ListMovies extends StatelessWidget {
  final List<MovieModel> movies;
  const ListMovies({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
      flex: 1,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return MovieTile(movies[index]);
          }),
    ));
  }

  Widget MovieTile(MovieModel movie) {
    return GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, "myRoute");
        },
        child: ListTile(
            tileColor: Color(0xFF8cb5b8),
            hoverColor: Color(0xFF0e899b),
            selectedTileColor: Color(0xFF0e899b),
            title: Text(movie.title),
            leading: Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.only(bottom: 3),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Container(
                    child: movie.backdropPath != ""
                        ? Text("...")
                        : Image.network(movie.backdropPath!)),
              ),
            )));
  }
}
