part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final RequestState nowPlayingState;
  final RequestState popularState;
  final RequestState topRatedState;
  final String nowPlayingError;
  final String popularError;
  final String topRatedError;
  const MoviesState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.popularState = RequestState.loading,
    this.topRatedState = RequestState.loading,
    this.nowPlayingError = '',
    this.popularError = '',
    this.topRatedError = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    RequestState? nowPlayingState,
    RequestState? popularState,
    RequestState? topRatedState,
    String? nowPlayingError,
    String? popularError,
    String? topRatedError,
  }) {
    return MoviesState(
        nowPlayingError: nowPlayingError ?? this.nowPlayingError,
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        popularError: popularError ?? this.popularError,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        topRatedError: topRatedError ?? this.topRatedError,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedState: topRatedState ?? this.topRatedState);
  }

  @override
  List<Object> get props => [];
}
