import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/core/api/api_provider.dart';
import 'package:night_movie_app/core/api/dio_consumer.dart';
import 'package:night_movie_app/core/api/interceptors.dart';
import 'package:night_movie_app/features/movies/data/datasources/movie_details_remote_datasource.dart';
import 'package:night_movie_app/features/movies/data/datasources/movies_remote_datasource.dart';
import 'package:night_movie_app/features/movies/data/repositories/movie_details_repository_impl.dart';
import 'package:night_movie_app/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:night_movie_app/features/movies/domain/repositories/movies_repository.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:night_movie_app/features/movies/presentation/blocs/movie_details/movie_details_bloc.dart';

import '../features/movies/domain/repositories/movie_details_repository.dart';
import '../features/movies/presentation/blocs/movies_bloc/movies_bloc.dart';

void setupLocator() {
  Get.lazyPut(() => Dio());
  Get.lazyPut(() => AppInterceptor());
  Get.lazyPut(() => LogInterceptor());
  Get.lazyPut<ApiProvider>(() => DioConsumer(client: Get.find()), fenix: true);

  // remote data sources
  Get.lazyPut<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(apiProvider: Get.find()));

  Get.lazyPut<MovieDetailsRemoteDataSource>(
      () => MovieDetailsRemoteDataSourceImpl(apiProvider: Get.find()),
      fenix: true);

  // repositories
  Get.lazyPut<MoviesRepository>(
      () => MoviesRepositoryImpl(moviesRemoteDataSource: Get.find()));

  Get.lazyPut<MovieDetailsRepository>(
      () => MovieDetailsRepositoryImpl(movieDetailsDataSource: Get.find()),
      fenix: true);

  // use cases
  Get.lazyPut(() => GetNowPlayingMovies(moviesRepository: Get.find()));
  Get.lazyPut(() => GetPopularMovies(moviesRepository: Get.find()));
  Get.lazyPut(() => GetTopRatedMovies(moviesRepository: Get.find()));

  Get.lazyPut(() => GetMovieDetailsUseCase(movieDetailsRepository: Get.find()),
      fenix: true);
  Get.lazyPut(
      () =>
          GetMovieRecommendedMoviesUseCase(movieDetailsRepository: Get.find()),
      fenix: true);
  //blocs
  Get.lazyPut(() => MoviesBloc(
      getNowPlayingMovies: Get.find(),
      getPopularMovies: Get.find(),
      getTopRatedMovies: Get.find()));

  Get.lazyPut(
      () => MovieDetailsBloc(
          getMovieDetailsUseCase: Get.find(),
          getMovieRecommendedMoviesUseCase: Get.find()),
      fenix: true);
}
