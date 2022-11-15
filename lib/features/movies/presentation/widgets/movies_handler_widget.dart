import 'package:flutter/material.dart';

import '../../../../core/enums/request_state.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../domain/entites/movie.dart';
import 'single_movie_card.dart';

class MoviesHandlerWidget extends StatelessWidget {
  final RequestState requestState;
  final List<Movie> movies;
  const MoviesHandlerWidget(
      {super.key, required this.requestState, required this.movies});

  @override
  Widget build(BuildContext context) {
    switch (requestState) {
      case RequestState.loading:
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );

      case RequestState.loaded:
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];

            return SingleMovieCard(
              movie: movie,
            );
          },
        );
      case RequestState.error:
        return const ErrorMessageWidget(
            errorMessage: "Something went wrong fetching movies");
    }
  }
}
