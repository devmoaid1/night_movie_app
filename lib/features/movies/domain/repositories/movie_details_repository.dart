import 'package:dartz/dartz.dart';
import 'package:night_movie_app/features/movies/domain/entites/movie_details.dart';
import 'package:night_movie_app/features/movies/domain/entites/recommended_movie.dart';

import '../../../../core/errors/failures.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieDetails>> getMovieDetails({required String id});
  Future<Either<Failure, List<RecommendedMovie>>> getMovieRecommendedMovies(
      {required String id});
}
