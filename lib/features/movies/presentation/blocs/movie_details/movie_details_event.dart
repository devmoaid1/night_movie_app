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

class GetMovieRecommendedMoviesEvent extends MovieDetailsEvent {
  final String movieId;

  const GetMovieRecommendedMoviesEvent({required this.movieId});
}
