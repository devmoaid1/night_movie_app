import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:night_movie_app/features/movies/presentation/widgets/now_playing_movie_card.dart';

import '../../domain/entites/movie.dart';

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
