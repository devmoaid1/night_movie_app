import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie_app/core/enums/request_state.dart';
import 'package:night_movie_app/core/usecases/usecases.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_top_rated_movies.dart';

import '../../../domain/entites/movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;
  MoviesBloc(
      {required this.getNowPlayingMovies,
      required this.getPopularMovies,
      required this.getTopRatedMovies})
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      await Future.delayed(
        const Duration(seconds: 1),
        () => _mapGetNowPlayingMoviesToState(event, emit),
      );
    });
  }

  void _mapGetNowPlayingMoviesToState(
      GetNowPlayingMoviesEvent event, Emitter emit) async {
    final response = await getNowPlayingMovies(NoParams());

    response.fold(
        (failure) => emit(const MoviesState(
            requestState: RequestState.error,
            error: "something went wrong with now playing movies")),
        (movies) => emit(MoviesState(
            nowPlayingMovies: movies, requestState: RequestState.loaded)));
  }
}
