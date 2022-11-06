import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/enums/request_state.dart';
import '../blocs/bloc/movies_bloc.dart';
import 'now_playing_movie_card.dart';

class NowPlayingMoviesSection extends StatelessWidget {
  const NowPlayingMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        switch (state.nowPlayingState) {
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
              child: CarouselSlider.builder(
                  itemCount: state.nowPlayingMovies.length,
                  itemBuilder: (context, index, realIndex) {
                    final movie = state.nowPlayingMovies[index];
                    return NowPlayingMovieCard(
                      movie: movie,
                    );
                  },
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      height: MediaQuery.of(context).size.height * 0.5)),
            );
          case RequestState.error:
            return SizedBox(
              height: 180.h,
              child: Center(
                child: Text(state.nowPlayingError),
              ),
            );
        }
      },
    );
  }
}
