import 'package:equatable/equatable.dart';
import 'package:night_movie_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:night_movie_app/core/usecases/usecases.dart';
import 'package:night_movie_app/features/movies/domain/entites/movie_details.dart';
import 'package:night_movie_app/features/movies/domain/repositories/movie_details_repository.dart';

class GetMovieDetailsUseCase
    implements UseCase<MovieDetails, GetMovieDetailsParams> {
  final MovieDetailsRepository movieDetailsRepository;

  GetMovieDetailsUseCase({required this.movieDetailsRepository});
  @override
  Future<Either<Failure, MovieDetails>> call(params) =>
      movieDetailsRepository.getMovieDetails(id: params.movieId);
}

class GetMovieDetailsParams extends Equatable {
  final String movieId;

  const GetMovieDetailsParams({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
