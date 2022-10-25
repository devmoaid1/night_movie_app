import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final DateTime releaseDate;

  const Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.voteAverage,
      required this.backdropPath,
      required this.releaseDate,
      required this.genreIds});

  @override
  List<Object?> get props =>
      [id, title, backdropPath, genreIds, overview, voteAverage, releaseDate];
}
