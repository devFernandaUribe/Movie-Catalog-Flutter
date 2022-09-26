import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
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
  double yPosition = -300;
  Duration duration = Duration(milliseconds: 1000);
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
          backgroundColor: const Color.fromARGB(255, 172, 207, 212),
          title: RawGestureDetector(
            gestures: {
              SerialTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                  SerialTapGestureRecognizer>(
                () => SerialTapGestureRecognizer(),
                (SerialTapGestureRecognizer instance) {
                  instance.onSerialTapDown = (SerialTapDownDetails details) {
                    if (details.count == 3) {
                      setState(() {
                        yPosition = -20;
                      });
                    }
                    if (details.count == 1) {
                      setState(() {
                        yPosition = -300;
                        duration = Duration(milliseconds: 4000);
                      });
                    }
                  };
                },
              ),
            },
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              height: 50,
              width: 200,
              // color: Colors.grey,
              child: Text(
                "Cinema Catalog",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                ListGenres(
                  selectedGenreId: _selectedGenreId,
                  onValueChanged: (item) {
                    int itemSelected = item.id;
                    setState(() {
                      _selectedGenreId = itemSelected;
                    });
                  },
                ),
                Expanded(
                  child: ListMovies(
                    movies: moviesProvider.popularMovies,
                    selectedGenreId: _selectedGenreId,
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
              bottom: yPosition,
              duration: duration,
              curve: const ElasticOutCurve(),
              child: Image.asset(
                'assets/icon/black_popcorn.png',
                height: 300,
              ),
            )
          ],
        ));
  }
}
