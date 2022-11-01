part of 'movies_bloc.dart';

abstract class MoviesBlocState extends Equatable {
  const MoviesBlocState();

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
