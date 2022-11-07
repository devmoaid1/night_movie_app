import 'package:night_movie_app/core/api/api_provider.dart';
import 'package:night_movie_app/features/movies/domain/entites/movie_details.dart';
import 'package:night_movie_app/features/movies/domain/entites/recommended_movie.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/exceptions.dart';

abstract class MovieDetailsDataSource {
  Future<MovieDetails> getMovieDetails({required String id});
  Future<List<RecommendedMovie>> getRecommendedMovies({required String id});
}

class MovieDetailsDataRemoteDataSource implements MovieDetailsDataSource {
  final ApiProvider apiProvider;

  MovieDetailsDataRemoteDataSource({required this.apiProvider});

  @override
  Future<MovieDetails> getMovieDetails({required String id}) async {
    try {
      final result =
          await apiProvider.getData(AppConstants.movieDetailsEndpoint(id));
      return const MovieDetails();
    } on ServerException catch (err) {
      throw ServerException(errorModel: err.errorModel);
    }
  }

  @override
  Future<List<RecommendedMovie>> getRecommendedMovies({required String id}) {
    // TODO: implement getRecommendedMovies
    throw UnimplementedError();
  }
}
