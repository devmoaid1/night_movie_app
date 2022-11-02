import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/core/api/api_provider.dart';
import 'package:night_movie_app/core/api/dio_consumer.dart';
import 'package:night_movie_app/core/api/interceptors.dart';
import 'package:night_movie_app/features/movies/data/datasources/movies_remote_datasource.dart';
import 'package:night_movie_app/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:night_movie_app/features/movies/domain/repositories/movies_repository.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:night_movie_app/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:night_movie_app/features/movies/presentation/blocs/bloc/movies_bloc.dart';

void setupLocator() {
  Get.lazyPut(() => Dio());
  Get.lazyPut(() => AppInterceptor());
  Get.lazyPut(() => LogInterceptor());
  Get.lazyPut<ApiProvider>(() => DioConsumer(client: Get.find()));
  Get.lazyPut<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(apiProvider: Get.find()));

  Get.lazyPut<MoviesRepository>(
      () => MoviesRepositoryImpl(moviesRemoteDataSource: Get.find()));

  Get.lazyPut(() => GetNowPlayingMovies(moviesRepository: Get.find()));
  Get.lazyPut(() => GetPopularMovies(moviesRepository: Get.find()));
  Get.lazyPut(() => GetTopRatedMovies(moviesRepository: Get.find()));

  Get.lazyPut(() => MoviesBloc(
      getNowPlayingMovies: Get.find(),
      getPopularMovies: Get.find(),
      getTopRatedMovies: Get.find()));
}
