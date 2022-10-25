import 'package:night_movie_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:night_movie_app/core/usecases/usecases.dart';
import 'package:night_movie_app/features/movies/domain/entites/movie.dart';
import 'package:night_movie_app/features/movies/domain/repositories/movies_repository.dart';

class GetNowPlayingMovies implements UseCase<List<Movie>, NoParams> {
  final MoviesRepository moviesRepository;

  GetNowPlayingMovies({required this.moviesRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) =>
      moviesRepository.getNowPlayingMovies();
}
