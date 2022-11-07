class MovieDetails {
  final String? posterPath;
  final String? title;
  final double? averageRating;
  final String? overview;
  final List<String>? genres;

  MovieDetails(
      {this.posterPath,
      this.title,
      this.averageRating,
      this.overview,
      this.genres});
}
