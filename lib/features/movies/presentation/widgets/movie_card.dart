import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/features/movies/domain/entites/recommended_movie.dart';
import 'package:night_movie_app/features/movies/presentation/widgets/movie_image.dart';

import '../../../../core/routes/route_helper.dart';
import '../../domain/entites/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie? movie;
  final RecommendedMovie? recommendedMovie;
  const MovieCard({super.key, this.movie, this.recommendedMovie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // navigate to product details page
          if (movie != null) {
            Get.toNamed(RouteHelper.movieDetailsRoute,
                arguments: movie!.id.toString());
          } else if (recommendedMovie != null) {
            Get.toNamed(RouteHelper.movieDetailsRoute,
                arguments: recommendedMovie!.id.toString());
          }
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.amber,
            ),
            width: 100.w,
            margin: EdgeInsets.only(right: 5.w, bottom: 5.h),
            child: MovieImage(
              movieImagePath: recommendedMovie != null
                  ? recommendedMovie!.backdropPath ?? ""
                  : movie?.backdropPath ?? "",
              shimmerHeight: MediaQuery.of(context).size.height * 0.55,
              shimmerWidth: 100.w,
              height: MediaQuery.of(context).size.height * 0.55,
              width: 100.w,
            )));
  }
}
