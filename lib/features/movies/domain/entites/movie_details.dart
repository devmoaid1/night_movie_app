import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String? posterPath;
  final String? title;
  final double? voteAverage;
  final String? overview;
  final DateTime? releaseDate;
  final List<String>? genres;

  const MovieDetails(
      {this.posterPath,
      this.title,
      this.voteAverage,
      this.releaseDate,
      this.overview,
      this.genres});

  @override
  List<Object?> get props =>
      [title, voteAverage, releaseDate, genres, overview, posterPath];
}
