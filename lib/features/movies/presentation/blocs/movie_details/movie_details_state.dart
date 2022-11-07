part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState? movieDetailsState;
  final String? movieError;
  final List<RecommendedMovie>? recommendedMovies;
  final RequestState? recommendedMoviesState;
  final String? recommendedMoviesError;

  const MovieDetailsState(
      {this.movieDetails = const MovieDetails(),
      this.movieDetailsState = RequestState.loading,
      this.movieError = "",
      this.recommendedMovies = const [],
      this.recommendedMoviesError = "",
      this.recommendedMoviesState = RequestState.loading});

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieError,
    List<RecommendedMovie>? recommendedMovies,
    RequestState? recommendedMoviesState,
    String? recommendedMoviesError,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieError: movieError ?? this.movieError,
      recommendedMovies: recommendedMovies ?? this.recommendedMovies,
      recommendedMoviesError:
          recommendedMoviesError ?? this.recommendedMoviesError,
      recommendedMoviesState:
          recommendedMoviesState ?? this.recommendedMoviesState,
    );
  }

  @override
  List<Object> get props => [
        movieDetails!,
        movieDetailsState!,
        movieError!,
        recommendedMovies!,
        recommendedMoviesError!,
        recommendedMoviesState!
      ];
}
