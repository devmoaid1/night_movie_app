import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/core/constants/app_colors.dart';
import 'package:night_movie_app/features/movies/presentation/blocs/movie_details/movie_details_bloc.dart';

import '../widgets/movie_poster.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String id;
  const MovieDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsBloc>(
      create: (context) => Get.find<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(movieId: id))
        ..add(GetMovieRecommendedMoviesEvent(movieId: id)),
      child: Scaffold(
        backgroundColor: AppColors.blueDark,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [MoviePoster(), MovieDetailsRow()],
            ),
          ),
        ),
      ),
    );
  }
}

class MovieDetailsRow extends StatelessWidget {
  const MovieDetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
