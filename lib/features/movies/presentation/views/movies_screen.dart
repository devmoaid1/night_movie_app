import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/core/enums/request_state.dart';
import 'package:night_movie_app/features/movies/presentation/blocs/bloc/movies_bloc.dart';

import '../../domain/entites/movie.dart';

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
    return CarouselSlider.builder(
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
            height: MediaQuery.of(context).size.height * 0.45));
  }
}

class NowPlayingMovieCard extends StatelessWidget {
  final Movie movie;
  const NowPlayingMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ExtendedImage.network(
        movie.backdropPath,
        cache: true,
        fit: BoxFit.fill,
      ),
      Align(
          alignment: Alignment.bottomCenter,
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.circle,
                    color: Colors.redAccent,
                    size: 16.0.h,
                  ),
                  Text(movie.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.sp,
                      )),
                ]))
          ]))
    ]);
  }
}
