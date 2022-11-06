part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final RequestState requestState;
  final String error;
  const MoviesState(
      {this.nowPlayingMovies = const [],
      this.popularMovies = const [],
      this.topRatedMovies = const [],
      this.requestState = RequestState.loading,
      this.error = ''});

  @override
  List<Object> get props => [];
}
