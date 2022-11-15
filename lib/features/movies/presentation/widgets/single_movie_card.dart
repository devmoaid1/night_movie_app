import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entites/movie.dart';
import 'movie_image.dart';

class SingleMovieCard extends StatelessWidget {
  final Movie? movie;
  const SingleMovieCard({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
        margin: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
            color: AppColors.darkGrey, borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150.h,
              width: 100.w,
              child: MovieImage(
                movieImagePath: movie?.backdropPath ?? "",
                shimmerHeight: 150.h,
                shimmerWidth: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.64),
                  child: Text(movie!.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                MovieReleaseRow(
                    voteAverage:
                        movie!.voteAverage.toStringAsFixed(1).toString(),
                    releaseYear: movie!.releaseDate.year.toString(),
                    releaseCardBackGroundColor: Colors.pink),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.64),
                  child: Text(movie!.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MovieReleaseRow extends StatelessWidget {
  const MovieReleaseRow(
      {Key? key,
      required this.releaseYear,
      required this.voteAverage,
      this.releaseCardBackGroundColor = AppColors.darkGrey})
      : super(key: key);

  final Color? releaseCardBackGroundColor;
  final String releaseYear;
  final String voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: releaseCardBackGroundColor),
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
          child: Text(releaseYear,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              )),
        ),
        SizedBox(
          width: 10.w,
        ),
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(voteAverage,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            )),
      ],
    );
  }
}
