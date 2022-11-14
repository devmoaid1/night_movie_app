import 'package:get/get.dart';
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
          return MovieDetailsScreen(id: id);
        })),
  ];
}
