import 'package:night_movie_app/features/movies/domain/entites/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {super.title,
      super.voteAverage,
      super.releaseDate,
      super.genres,
      super.overview,
      super.posterPath});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> genresData = List.from(json['genres']);

    List<String> genres =
        List<String>.from(genresData.map((data) => data['name'])).toList();

    return MovieDetailsModel(
        title: json['title'],
        overview: json['overview'],
        voteAverage: double.parse(json['vote_average'].toString()),
        posterPath: json['poster_path'],
        releaseDate: DateTime.parse(json['release_date']),
        genres: genres);
  }
}
