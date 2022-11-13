import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/core/constants/app_colors.dart';
import 'package:night_movie_app/features/movies/presentation/blocs/movie_details/movie_details_bloc.dart';

import '../../../../core/enums/request_state.dart';
import '../widgets/movie_poster.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String id;
  const MovieDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsBloc>(
      create: (context) => Get.find<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(movieId: id))
        ..add(GetMovieRecommendedMoviesEvent(movieId: id)),
      child: Scaffold(
        backgroundColor: AppColors.blueDark,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [MoviePoster(), MovieDetailsRow()],
            ),
          ),
        ),
      ),
    );
  }
}

class MovieDetailsRow extends StatelessWidget {
  const MovieDetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return SizedBox(
              height: MediaQuery.of(context).size.height * 35,
              child: const Center(child: CircularProgressIndicator.adaptive()),
            );

          case RequestState.loaded:
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.movieDetails!.title!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.darkGrey),
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 12.w),
                        child: Text(
                            state.movieDetails!.releaseDate!.year.toString(),
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
                      Text(state.movieDetails!.voteAverage.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          )),
                    ],
                  ),
                ],
              ),
            );

          case RequestState.error:
            return Center(
              child: Text(
                "Something went wrong getting movie details",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
