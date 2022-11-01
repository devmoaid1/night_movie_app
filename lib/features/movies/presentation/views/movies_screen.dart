import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/features/movies/presentation/blocs/cubit/movies_cubit.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MoviesCubit>(
        create: (context) => Get.find<MoviesCubit>()..getMovies(),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            return const Center(
              child: Text("Movies View"),
            );
          },
        ),
      ),
    );
  }
}
