import 'dart:async';

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
    on<GetNowPlayingMoviesEvent>(_mapGetNowPlayingMoviesToState);

    on<GetPopularMoviesEvent>(_mapGetPopularMoviesToState);

    on<GetTopRatedMoviesEvent>(_mapGetTopRatedMoviesToState);
  }

  FutureOr<void> _mapGetNowPlayingMoviesToState(
      GetNowPlayingMoviesEvent event, Emitter emit) async {
    final response = await getNowPlayingMovies(NoParams());

    response.fold(
        (failure) => emit(state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingError: "something went wrong with now playing movies")),
        (movies) => emit(state.copyWith(
            nowPlayingMovies: movies, nowPlayingState: RequestState.loaded)));
  }

  FutureOr<void> _mapGetPopularMoviesToState(
      GetPopularMoviesEvent event, Emitter emit) async {
    final response = await getPopularMovies(NoParams());

    response.fold(
        (failure) => emit(state.copyWith(
            popularState: RequestState.error,
            popularError: "something went wrong with popular movies")),
        (movies) => emit(state.copyWith(
            popularMovies: movies, popularState: RequestState.loaded)));
  }

  FutureOr<void> _mapGetTopRatedMoviesToState(
      GetTopRatedMoviesEvent event, Emitter emit) async {
    final response = await getTopRatedMovies(NoParams());

    response.fold(
        (failure) => emit(state.copyWith(
            topRatedState: RequestState.error,
            topRatedError: "something went wrong with Top Rated movies")),
        (movies) => emit(state.copyWith(
            topRatedMovies: movies, topRatedState: RequestState.loaded)));
  }
}
