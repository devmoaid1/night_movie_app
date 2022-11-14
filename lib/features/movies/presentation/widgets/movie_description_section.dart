import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/enums/request_state.dart';
import '../blocs/movie_details/movie_details_bloc.dart';

class MovieDescriptionSection extends StatelessWidget {
  const MovieDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous.movieDetailsState != current.movieDetailsState,
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 600),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.movieDetails!.overview!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("Genres : ${state.movieDetails!.genres!.join(",")}",
                        style: TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: 14.sp,
                        )),
                  ],
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
