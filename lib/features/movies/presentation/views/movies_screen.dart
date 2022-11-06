import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/features/movies/presentation/blocs/bloc/movies_bloc.dart';

import '../widgets/now_playing_movies_section.dart';
import '../widgets/popular_section.dart';
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
        create: (context) => Get.find<MoviesBloc>()
          ..add(GetNowPlayingMoviesEvent())
          ..add(GetPopularMoviesEvent())
          ..add(GetTopRatedMoviesEvent()),
        child: const CustomScrollView(
          slivers: [
            // now playing  section
            SliverToBoxAdapter(child: NowPlayingMoviesSection()),

            // popular  section
            SliverToBoxAdapter(
              child: TitleRow(title: "Popular"),
            ),
            SliverToBoxAdapter(child: PopularSection()),

            // top rated section

            SliverToBoxAdapter(
              child: TitleRow(title: "Top Rated"),
            ),
            SliverToBoxAdapter(child: TopRatedSection())
          ],
        ));
  }
}
