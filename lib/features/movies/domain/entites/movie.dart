import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;

  const Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.voteAverage,
      required this.backdropPath,
      required this.genreIds});

  @override
  List<Object?> get props =>
      [id, title, backdropPath, genreIds, overview, voteAverage];
}
