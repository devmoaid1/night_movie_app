import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:night_movie_app/features/movies/domain/entites/recommended_movie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/app_image.dart';
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
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.amber,
          ),
          width: 100.w,
          margin: EdgeInsets.only(right: 5.w, bottom: 5.h),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AppImage(
                placeHolder: Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.55,
                path: AppConstants.baseImageUrl(recommendedMovie != null
                    ? recommendedMovie!.backdropPath ?? ""
                    : movie!.backdropPath),
              )),
        ));
  }
}
