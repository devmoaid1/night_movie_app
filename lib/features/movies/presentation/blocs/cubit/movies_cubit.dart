import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie_app/core/usecases/usecases.dart';
import 'package:night_movie_app/features/movies/domain/entites/movie.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_now_playing_movies.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  MoviesCubit({required this.getNowPlayingMovies}) : super(MoviesInitial());

  void getMovies() async {
    final response = await getNowPlayingMovies(NoParams());
    response.fold(
        (failure) => print(failure.runtimeType), (movies) => print(movies[0]));
  }
}
