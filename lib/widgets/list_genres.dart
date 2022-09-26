import 'package:flutter/material.dart';
import 'package:movie_catalog_app/models/genre_model.dart';
import 'package:movie_catalog_app/providers/genre_provider.dart';

import '../providers/db_provider.dart';

class ListGenres extends StatefulWidget {
  final ValueChanged onValueChanged;
  final int selectedGenreId;
  const ListGenres(
      {super.key, required this.onValueChanged, required this.selectedGenreId});

  @override
  State<StatefulWidget> createState() => _ListGenresState();
}

class _ListGenresState extends State<ListGenres> {
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _loadFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            height: 88.5,
            child: _buildGenresListView());
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = GenreProvider();
    await apiProvider.getAllGenres();

    setState(() {
      isLoading = false;
    });
  }

  _buildGenresListView() {
    List<GenreModel> genres;
    return FutureBuilder(
      future: DBProvider.db.getAllGenres(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          genres = snapshot.data;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genres.length,
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 0.0, left: 10),
                child:
                    SingleChildScrollView(child: containerItem(genres[index])),
              );
            },
          );
        }
      },
    );
  }

  Widget containerItem(GenreModel item) {
    return GestureDetector(
      onTap: () {
        widget.onValueChanged(item);
      },
      child: widget.selectedGenreId != item.id
          ? Container(
              width: 110,
              height: 27,
              decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black12.withOpacity(0.05))),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(item.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Josefins Sans - Bold"))))
          : containerItemSelected(item.name),
    );
  }

  Widget containerItemSelected(String item) {
    return Container(
        width: 116,
        height: 32,
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.9),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.red.withOpacity(0.5))),
        child: Align(
            alignment: Alignment.center,
            child: Text(item,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: "Josefins Sans - Bold"))));
  }
}
