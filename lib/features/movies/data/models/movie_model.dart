import 'package:night_movie_app/features/movies/domain/entites/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.overview,
      required super.voteAverage,
      required super.backdropPath,
      required super.releaseDate,
      required super.genreIds});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        voteAverage: double.parse(json['vote_average'].toString()),
        backdropPath: json['backdrop_path'],
        releaseDate: DateTime.parse(json['release_date']),
        genreIds: List<int>.from(json['genre_ids'].map((id) => id)));
  }
}
