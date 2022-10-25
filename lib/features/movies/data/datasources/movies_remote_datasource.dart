import 'package:night_movie_app/core/api/api_provider.dart';
import 'package:night_movie_app/core/constants/app_constants.dart';
import 'package:night_movie_app/features/movies/data/models/movie_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final ApiProvider apiProvider;

  MoviesRemoteDataSourceImpl({required this.apiProvider});
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final result = await apiProvider.getData(AppConstants.nowPlayingEndPoint);
    return List.from(result['results'])
        .map((result) => MovieModel.fromJson(result))
        .toList();
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await apiProvider.getData(AppConstants.popularEndPoint);
    return List.from(result['results'])
        .map((result) => MovieModel.fromJson(result))
        .toList();
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final result = await apiProvider.getData(AppConstants.topRatedEndPoint);
    return List.from(result['results'])
        .map((result) => MovieModel.fromJson(result))
        .toList();
  }
}
