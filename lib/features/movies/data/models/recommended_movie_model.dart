import 'package:night_movie_app/features/movies/domain/entites/recommended_movie.dart';

class RecommendedMovieModel extends RecommendedMovie {
  const RecommendedMovieModel({super.id, super.backdropPath});

  factory RecommendedMovieModel.fromJson(Map<String, dynamic> json) {
    return RecommendedMovieModel(
        backdropPath: json['backdrop_path'], id: json['id']);
  }
}
