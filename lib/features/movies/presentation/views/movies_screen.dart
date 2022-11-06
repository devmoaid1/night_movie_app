import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/core/enums/request_state.dart';
import 'package:night_movie_app/features/movies/presentation/blocs/bloc/movies_bloc.dart';
import 'package:night_movie_app/features/movies/presentation/widgets/movie_card.dart';

import '../widgets/now_playing_movies_section.dart';
import '../widgets/title_row.dart';
import '../widgets/top_rated_movies_section.dart';

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
      child: BlocBuilder<MoviesBloc, MoviesState>(
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
              // now playing movies
              SliverToBoxAdapter(
                  child: NowPlayingMoviesSection(
                nowPlayingMovies: state.nowPlayingMovies,
              )),

              // popular movies
              const SliverToBoxAdapter(
                child: TitleRow(title: "Popular"),
              ),
              SliverToBoxAdapter(
                  child: FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: 180.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      itemCount: state.nowPlayingMovies.length,
                      itemBuilder: (context, index) {
                        final movie = state.nowPlayingMovies[index];
                        return MovieCard(movie: movie);
                      }),
                ),
              )),

              // top rated section

              const SliverToBoxAdapter(
                child: TitleRow(title: "Top Rated"),
              ),
              const SliverToBoxAdapter(child: TopRatedSection())
            ],
          );
        },
      ),
    );
  }
}
