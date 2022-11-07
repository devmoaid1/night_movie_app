import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie_app/core/enums/request_state.dart';
import 'package:night_movie_app/features/movies/domain/entites/movie_details.dart';
import 'package:night_movie_app/features/movies/domain/entites/recommended_movie.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_movie_recommendations_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieRecommendedMoviesUseCase getMovieRecommendedMoviesUseCase;
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  MovieDetailsBloc(
      {required this.getMovieDetailsUseCase,
      required this.getMovieRecommendedMoviesUseCase})
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_mapGetMovieDetailsEventToState);
    on<GetMovieRecommendedMoviesEvent>(
        _mapGetMovieRecommendedMoviesEventToState);
  }

  FutureOr<void> _mapGetMovieDetailsEventToState(
      GetMovieDetailsEvent event, Emitter emit) async {
    final result = await getMovieDetailsUseCase(
        GetMovieDetailsParams(movieId: event.movieId));

    result.fold(
        (failure) => emit(state.copyWith(
            movieDetailsState: RequestState.error,
            movieError: "couldn`t fetch movie details")),
        (movieDetails) => state.copyWith(
            movieDetails: movieDetails,
            movieDetailsState: RequestState.loaded));
  }

  FutureOr<void> _mapGetMovieRecommendedMoviesEventToState(
      GetMovieRecommendedMoviesEvent event, Emitter emit) async {
    final result = await getMovieRecommendedMoviesUseCase(
        GetMovieRecommendedMoviesParams(movieId: event.movieId));

    result.fold(
        (failure) => emit(state.copyWith(
            recommendedMoviesState: RequestState.error,
            recommendedMoviesError: "couldn`t fetch movie details")),
        (recommendations) => state.copyWith(
            recommendedMovies: recommendations,
            recommendedMoviesState: RequestState.loaded));
  }
}
