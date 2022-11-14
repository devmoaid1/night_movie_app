import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/enums/request_state.dart';
import '../blocs/movie_details/movie_details_bloc.dart';
import 'movie_card.dart';

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous.recommendedMoviesState != current.recommendedMoviesState,
      builder: (context, state) {
        switch (state.recommendedMoviesState) {
          case RequestState.loading:
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: const Center(child: CircularProgressIndicator.adaptive()),
            );

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 600),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("More Like This",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    GridView.builder(
                      primary: true,
                      shrinkWrap: true,
                      itemCount: state.recommendedMovies!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 1,
                              childAspectRatio: 9 / 16,
                              mainAxisSpacing: 1),
                      itemBuilder: (context, index) {
                        final movie = state.recommendedMovies![index];
                        return MovieCard(recommendedMovie: movie);
                      },
                    )
                  ],
                ),
              ),
            );

          case RequestState.error:
            return Center(
              child: Text(
                state.recommendedMoviesError!,
                style: TextStyle(
                  fontSize: 14.sp,
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
