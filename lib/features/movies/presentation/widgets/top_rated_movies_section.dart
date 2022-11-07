import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:night_movie_app/core/enums/request_state.dart';

import '../blocs/bloc/movies_bloc.dart';
import 'movie_card.dart';

class TopRatedSection extends StatelessWidget {
  const TopRatedSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      key: UniqueKey(),
      buildWhen: (previous, current) =>
          previous.topRatedState != current.topRatedState,
      builder: (context, state) {
        switch (state.topRatedState) {
          case RequestState.loading:
            return SizedBox(
              height: 180.h,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 180.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    itemCount: state.topRatedMovies.length,
                    itemBuilder: (context, index) {
                      final movie = state.topRatedMovies[index];
                      return MovieCard(movie: movie);
                    }),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 180.h,
              child: Center(
                child: Text(state.topRatedError),
              ),
            );
        }
      },
    );
  }
}
