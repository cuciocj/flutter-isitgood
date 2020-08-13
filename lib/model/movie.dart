import 'package:flutter_isitgood/model/genre.dart';

class Movie {
  int id;
  int voteCount;
  num popularity;
  num voteAverage;
  String name;
  String overview;
  String posterPath;
  String backdropPath;
  String releaseDate;
  List<Genre> genres;

  Movie({
    this.id,
    this.voteCount,
    this.popularity,
    this.voteAverage,
    this.name,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      voteCount: json['vote_count'],
      popularity: json['popularity'],
      voteAverage: json['vote_average'],
      name: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date']
    );
  }
}