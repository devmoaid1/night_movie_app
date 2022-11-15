import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/movies_bloc/movies_bloc.dart';
import 'movies_handler_widget.dart';

class AllMoviesBody extends StatelessWidget {
  final String page;
  const AllMoviesBody({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(buildWhen: (previous, current) {
      if (page == "popular") {
        return previous.popularState != current.popularState;
      }
      return previous.topRatedState != current.topRatedState;
    }, builder: (context, state) {
      if (page == "Popular") {
        return MoviesHandlerWidget(
            requestState: state.popularState, movies: state.popularMovies);
      }
      return MoviesHandlerWidget(
          requestState: state.topRatedState, movies: state.topRatedMovies);
    });
  }
}
