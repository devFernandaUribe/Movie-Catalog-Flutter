import 'package:flutter/material.dart';
import 'package:movie_catalog_app/models/genre_model.dart';

class ListGenres extends StatelessWidget {
  final List<GenreModel> genres;
  final ValueChanged onValueChanged;
  final int selectedGenreId;
  const ListGenres(
      {super.key,
      required this.genres,
      required this.onValueChanged,
      required this.selectedGenreId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      height: 88.5,
      child: getAllView(genres, context),
    );

    // Padding(
    //     padding: const EdgeInsets.all(0),
    //     child: SizedBox(
    //         // width: MediaQuery.of(context).size.width,
    //         height: 50.0,
    //         child: ListView.builder(
    //             shrinkWrap: true,
    //             scrollDirection: Axis.horizontal,
    //             itemCount: genres.length,
    //             itemBuilder: (BuildContext context, int index) {
    //               return GestureDetector(
    //                 onTap: () {
    //                   onValueChanged(genres[index].id);
    //                 },
    //                 child: Container(
    //                   alignment: Alignment.center,
    //                   width: MediaQuery.of(context).size.width,
    //                   height: 2,
    //                   decoration: BoxDecoration(
    //                     border: Border.all(),
    //                     color: const Color.fromARGB(154, 224, 143, 129),
    //                   ),
    //                   child: Text(
    //                     genres[index].name,
    //                     style: TextStyle(
    //                         color: Colors.black.withOpacity(0.7),
    //                         fontSize: 15,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                 ),
    //               );
    //             })));
  }

  Widget getAllView(List<GenreModel> genres, BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: genres.length,
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 10),
          child: SingleChildScrollView(child: containerItem(genres[index])),
        );
      },
    );
  }

  Widget containerItem(GenreModel item) {
    return GestureDetector(
      onTap: () {
        onValueChanged(item);
      },
      child: selectedGenreId != item.id
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
