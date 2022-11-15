import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:night_movie_app/features/movies/presentation/widgets/single_movie_card.dart';

import '../../../../core/enums/request_state.dart';
import '../blocs/movie_details/movie_details_bloc.dart';

class MovieDetailsSection extends StatelessWidget {
  const MovieDetailsSection({super.key});

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
                    Text(state.movieDetails!.title!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10.h,
                    ),
                    MovieReleaseRow(
                      voteAverage: state.movieDetails!.voteAverage!
                          .toStringAsFixed(1)
                          .toString(),
                      releaseYear:
                          state.movieDetails!.releaseDate!.year.toString(),
                    )
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
