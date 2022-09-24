import 'package:flutter/material.dart';
import 'package:movie_catalog_app/providers/movies_provider.dart';
import 'package:movie_catalog_app/widgets/listMovies.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        body: Container(
            child: Column(
      children: [
        ListMovies(
          movies: moviesProvider.popularMovies,
        ),
      ],
    )));
  }
}
