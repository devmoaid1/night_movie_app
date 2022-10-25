import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entites/movie.dart';
import '../repositories/movies_repository.dart';

class GetPopularMovies implements UseCase<List<Movie>, NoParams> {
  final MoviesRepository moviesRepository;

  GetPopularMovies({required this.moviesRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) =>
      moviesRepository.getPopularMovies();
}
