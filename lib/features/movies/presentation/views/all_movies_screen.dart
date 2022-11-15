import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie_app/core/constants/app_colors.dart';
import 'package:night_movie_app/features/movies/presentation/blocs/movies_bloc/movies_bloc.dart';

import '../../../../core/enums/request_state.dart';
import '../widgets/header_bar.dart';
import '../widgets/single_movie_card.dart';

class AllMoviesScreen extends StatelessWidget {
  final String page;

  const AllMoviesScreen({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueDark,
      appBar: HeaderBar(page: page),
      body: AllMoviesBody(page: page),
    );
  }
}

class AllMoviesBody extends StatelessWidget {
  final String page;
  const AllMoviesBody({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
      if (page == "Popular") {
        switch (state.popularState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );

          case RequestState.loaded:
            return ListView.builder(
              itemCount: state.popularMovies.length,
              itemBuilder: (context, index) {
                final movie = state.popularMovies[index];

                return SingleMovieCard(
                  movie: movie,
                );
              },
            );
          case RequestState.error:
            return const Center(
              child: Text("Something went wrong fetching movies"),
            );
        }
      }

      switch (state.topRatedState) {
        case RequestState.loading:
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );

        case RequestState.loaded:
          return ListView.builder(
            itemCount: state.topRatedMovies.length,
            itemBuilder: (context, index) {
              final movie = state.topRatedMovies[index];

              return SingleMovieCard(
                movie: movie,
              );
            },
          );
        case RequestState.error:
          return const Center(
            child: Text("Something went wrong fetching movies"),
          );
      }
    });
  }
}
