class AppConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String imageUrl = "https://image.tmdb.org/t/p/w500";
  static const String apiKey = "8a5052eb3234c5237a8a55cb3486fc78";

  // endpoints
  static const String nowPlayingEndPoint = "/movie/now_playing";
  static const String popularEndPoint = "/movie/popular";
  static const String topRatedEndPoint = "/movie/top_rated";
  static movieDetailsEndpoint(String movieId) => "/movie/$movieId";
  static recommendedMoviesEndpoint(String movieId) =>
      "/movie/$movieId/recommendations";

  static baseImageUrl(String path) => "$imageUrl$path";
}
