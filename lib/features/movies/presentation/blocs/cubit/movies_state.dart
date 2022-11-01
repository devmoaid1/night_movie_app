part of 'movies_cubit.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesNowPlaying extends MoviesState {
  final List<Movie> movies;

  const MoviesNowPlaying({required this.movies});
}
