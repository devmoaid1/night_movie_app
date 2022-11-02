part of 'movies_bloc.dart';

class MoviesBlocState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final RequestState requestState;
  final String error;
  const MoviesBlocState(
      {this.nowPlayingMovies = const [],
      this.popularMovies = const [],
      this.topRatedMovies = const [],
      this.requestState = RequestState.loading,
      this.error = ''});

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesBlocState {}

class NowPlayingMovies extends MoviesBlocState {
  final List<Movie> movies;

  const NowPlayingMovies({required this.movies});
}

class LoadingState extends MoviesBlocState {}

class ErrorState extends MoviesBlocState {
  final String message;

  const ErrorState({required this.message});
}

class PopularMovies extends MoviesBlocState {
  final List<Movie> movies;

  const PopularMovies({required this.movies});
}

class TopRatedMovies extends MoviesBlocState {
  final List<Movie> movies;

  const TopRatedMovies({required this.movies});
}
