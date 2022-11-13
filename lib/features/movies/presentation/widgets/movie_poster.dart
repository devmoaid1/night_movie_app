import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/enums/request_state.dart';
import '../../../../core/widgets/app_image.dart';
import '../blocs/movie_details/movie_details_bloc.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return SizedBox(
              height: MediaQuery.of(context).size.height * 35,
              child: const Center(child: CircularProgressIndicator.adaptive()),
            );

          case RequestState.loaded:
            return const AppImage(
              path: "",
            );

          case RequestState.error:
            return Center(
              child: Text(
                "Something went wrong getting movie details",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
