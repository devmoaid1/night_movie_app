part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final String movieId;

  const GetMovieDetailsEvent({required this.movieId});
}

class GetMovieRecommendedMovies extends MovieDetailsEvent {
  final String movieId;

  const GetMovieRecommendedMovies({required this.movieId});
}
