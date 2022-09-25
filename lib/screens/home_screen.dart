import 'package:flutter/material.dart';
import 'package:movie_catalog_app/providers/genre_provider.dart';
import 'package:movie_catalog_app/providers/movies_provider.dart';
import 'package:movie_catalog_app/widgets/list_genres.dart';
import 'package:movie_catalog_app/widgets/list_movies.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedGenreId = -1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final genreProvider = Provider.of<GenreProvider>(context);

    return Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            'assets/images/black_popcorn.png',
            height: 10,
          ),
          backgroundColor: const Color.fromARGB(255, 172, 207, 212),
          leadingWidth: 35,
          title: Text(
            "Cinema Catalog",
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ListGenres(
              selectedGenreId: _selectedGenreId,
              onValueChanged: (item) {
                int itemSelected = item.id;
                setState(() {
                  _selectedGenreId = itemSelected;
                });
              },
              genres: genreProvider.genres,
            ),
            Expanded(
              child: ListMovies(
                movies: moviesProvider.popularMovies,
                selectedGenreId: _selectedGenreId,
              ),
            ),
          ],
        ));
  }
}
