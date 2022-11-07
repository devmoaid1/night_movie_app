import 'package:equatable/equatable.dart';
import 'package:night_movie_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:night_movie_app/core/usecases/usecases.dart';
import 'package:night_movie_app/features/movies/domain/entites/recommended_movie.dart';
import 'package:night_movie_app/features/movies/domain/repositories/movie_details_repository.dart';

class GetMovieRecommendedMoviesUseCase
    implements
        UseCase<List<RecommendedMovie>, GetMovieRecommendedMoviesParams> {
  final MovieDetailsRepository movieDetailsRepository;

  GetMovieRecommendedMoviesUseCase({required this.movieDetailsRepository});
  @override
  Future<Either<Failure, List<RecommendedMovie>>> call(params) =>
      movieDetailsRepository.getMovieRecommendedMovies(id: params.movieId);
}

class GetMovieRecommendedMoviesParams extends Equatable {
  final String movieId;

  const GetMovieRecommendedMoviesParams({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
