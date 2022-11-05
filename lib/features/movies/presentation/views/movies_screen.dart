import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/core/constants/app_constants.dart';
import 'package:night_movie_app/core/enums/request_state.dart';
import 'package:night_movie_app/features/movies/presentation/blocs/bloc/movies_bloc.dart';

import '../../domain/entites/movie.dart';
import '../widgets/now_playing_movie_card.dart';
import '../widgets/title_row.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MoviesViewBody(),
    );
  }
}

class MoviesViewBody extends StatelessWidget {
  const MoviesViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (context) =>
          Get.find<MoviesBloc>()..add(GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesBlocState>(
        builder: (context, state) {
          if (state.requestState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state.requestState == RequestState.error) {
            return Center(
              child: Text(state.error),
            );
          }

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: NowPlayingMoviesSection(
                nowPlayingMovies: state.nowPlayingMovies,
              )),
              const SliverToBoxAdapter(
                child: TitleRow(title: "Popular"),
              ),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 180.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    itemCount: state.nowPlayingMovies.length,
                    itemBuilder: (context, index) {
                      final movie = state.nowPlayingMovies[index];
                      return Container(
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
                      );
                    }),
              ))
            ],
          );
        },
      ),
    );
  }
}

class NowPlayingMoviesSection extends StatelessWidget {
  final List<Movie> nowPlayingMovies;
  const NowPlayingMoviesSection({super.key, required this.nowPlayingMovies});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: CarouselSlider.builder(
          itemCount: nowPlayingMovies.length,
          itemBuilder: (context, index, realIndex) {
            final movie = nowPlayingMovies[index];
            return NowPlayingMovieCard(
              movie: movie,
            );
          },
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              height: MediaQuery.of(context).size.height * 0.5)),
    );
  }
}
