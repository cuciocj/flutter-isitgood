class Movie {
  int id;
  String name = 'hehe';
  String overview = 'overview here';
  String posterPath = 'http://image.tmdb.org/t/p/w780/vBaLz8kZNXYvTjHwrTewkTw3l7k.jpg';
  String backdropPath = 'http://image.tmdb.org/t/p/w780/ApiBzeaa95TNYliSbQ8pJv4Fje7.jpg';

  Movie({
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.backdropPath
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      name: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path']
    );
  }
}