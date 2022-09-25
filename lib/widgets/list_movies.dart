import 'package:flutter/material.dart';
import 'package:movie_catalog_app/models/movie_model.dart';
import 'package:movie_catalog_app/screens/screens.dart';

class ListMovies extends StatelessWidget {
  List<MovieModel> movies;
  int? selectedGenreId;
  ListMovies({super.key, required this.movies, this.selectedGenreId});

  @override
  Widget build(BuildContext context) {
    if (selectedGenreId != -1) {
      movies = movies
          .where((element) => element.genreIds.contains(selectedGenreId))
          .toList();
    }

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(0.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12.withOpacity(0.05))),
            child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SingleMovie(movie: movies[index])));
                },
                title: Text(movies[index].title),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Color.fromARGB(255, 172, 207, 212),
                ),
                leading: Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(movies[index].getCoverImageRoute()),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )),
          );
        });
  }
}
