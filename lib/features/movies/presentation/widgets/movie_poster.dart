import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/core/constants/app_constants.dart';

import '../../../../core/enums/request_state.dart';
import '../../../../core/widgets/app_image.dart';
import '../blocs/movie_details/movie_details_bloc.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous.movieDetailsState != current.movieDetailsState,
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: const Center(child: CircularProgressIndicator.adaptive()),
            );

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 600),
              child: Stack(children: [
                AspectRatio(
                  aspectRatio: 12 / 8,
                  child: AppImage(
                      path: AppConstants.baseImageUrl(
                          state.movieDetails!.posterPath!),
                      fit: BoxFit.fill),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back_ios,
                        color: Colors.white, size: 25.sp),
                  ),
                )
              ]),
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
