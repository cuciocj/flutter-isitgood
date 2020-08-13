import 'package:flutter_isitgood/model/movie.dart';

class MovieList {
  int page;
  int totalResults;
  int totalPages;
  List<Movie> list = [];

  MovieList(Map<String, dynamic> data) {
    for (int i = 0; i < data['results'].length; i++) {
      this.list.add(Movie.fromJson(data['results'][i]));
    }
  }
}