import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../domain/entites/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

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
          child: ExtendedImage.network(
            AppConstants.baseImageUrl(movie.backdropPath),
            cache: true,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
