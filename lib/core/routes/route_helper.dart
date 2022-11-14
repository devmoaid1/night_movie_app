import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/features/movies/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:night_movie_app/features/movies/presentation/blocs/movies_bloc/movies_bloc.dart';
import 'package:night_movie_app/features/movies/presentation/views/all_movies_screen.dart';
import 'package:night_movie_app/features/movies/presentation/views/movie_details_screen.dart';
import 'package:night_movie_app/features/movies/presentation/views/movies_screen.dart';

class RouteHelper {
  static const initialRoute = "/";
  static const movieDetailsRoute = "/movie-details";
  static const allMoviesRoute = "/all-movies";

  static List<GetPage> routes = [
    GetPage(name: initialRoute, page: (() => const MoviesView())),
    GetPage(
        name: movieDetailsRoute,
        page: (() {
          String id = Get.arguments;
          return BlocProvider<MovieDetailsBloc>(
              key: UniqueKey(),
              create: (context) => Get.find<MovieDetailsBloc>()
                ..add(GetMovieDetailsEvent(movieId: id))
                ..add(GetMovieRecommendedMoviesEvent(movieId: id)),
              child: MovieDetailsScreen(id: id));
        })),
    GetPage(
        name: allMoviesRoute,
        page: (() {
          String page = Get.arguments;

          if (page == "Popular") {
            return BlocProvider<MoviesBloc>.value(
                value: Get.find<MoviesBloc>()..add(GetPopularMoviesEvent()),
                child: AllMoviesScreen(
                  page: page,
                ));
          }
          return BlocProvider<MoviesBloc>.value(
              value: Get.find<MoviesBloc>()..add(GetTopRatedMoviesEvent()),
              child: AllMoviesScreen(page: page));
        })),
  ];
}
