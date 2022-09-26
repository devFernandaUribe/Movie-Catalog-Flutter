import 'dart:io';
import 'package:movie_catalog_app/models/genre_model.dart';
import 'package:movie_catalog_app/models/movie_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    _database = await initDB();

    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // deleteDatabase(join(documentsDirectory.path, 'movie_meridian.db'));

    final path = join(documentsDirectory.path, 'movie_meridian.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      // adult INTEGER,video INTEGER
      // await db.execute(
      //     'CREATE TABLE  Movies(id INTEGER PRIMARY KEY, backdrop_path TEXT,original_language TEXT,original_title TEXT,overview TEXT,popularity REAL,postert_path TEXT,release_date TEXT,title TEXT,vote_average REAL,vote_count INTEGER)');

      await db
          .execute('CREATE TABLE  Genres(id INTEGER PRIMARY KEY,name INTEGER)');
    });
  }

  // createMovie(MovieModel newMovie) async {
  //   final db = await database;
  //   final res = await db.insert(
  //     'Movies',
  //     newMovie.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );

  //   return res;
  // }

  // Future<int> deleteAllMovies() async {
  //   final db = await database;
  //   final res = await db.rawDelete('DELETE FROM Movies');

  //   return res;
  // }

  // Future<List<MovieModel>> getAllMovies() async {
  //   final db = await database;
  //   final res = await db.rawQuery("SELECT * FROM Movies");
  //   List<MovieModel> list =
  //       res.isNotEmpty ? res.map((c) => MovieModel.fromMap(c)).toList() : [];
  //   return list;
  // }

  createGenre(GenreModel newGenre) async {
    final db = await database;
    final res = await db.insert('Genres', newGenre.toMap());
    return res;
  }

  Future<int> deleteAllGenres() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Genres');

    return res;
  }

  Future<List<GenreModel>> getAllGenres() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Genres");
    List<GenreModel> list =
        res.isNotEmpty ? res.map((c) => GenreModel.fromMap(c)).toList() : [];
    return list;
  }
}
