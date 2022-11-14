import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/core/constants/app_colors.dart';
import 'package:night_movie_app/features/movies/domain/entites/movie.dart';
import 'package:night_movie_app/features/movies/presentation/blocs/movies_bloc/movies_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/enums/request_state.dart';
import '../../../../core/widgets/app_image.dart';

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

class SingleMovieCard extends StatelessWidget {
  final Movie movie;
  const SingleMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
        margin: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
            color: AppColors.darkGrey, borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150.h,
              width: 100.w,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AppImage(
                      placeHolder: Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: 150.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      fit: BoxFit.cover,
                      // width: 50.w,
                      path:
                          AppConstants.baseImageUrl(movie.backdropPath ?? ""))),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.64),
                  child: Text(movie.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.pink),
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
                      child: Text(movie.releaseDate.year.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          )),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(movie.voteAverage.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.64),
                  child: Text(movie.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderBar({
    Key? key,
    required this.page,
  }) : super(key: key);

  final String page;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.black.withOpacity(0.3),
      leading: InkWell(
        onTap: () => Get.back(),
        child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 25.sp),
      ),
      title: Text(
        "$page Movies",
        style: TextStyle(color: Colors.white, fontSize: 16.sp),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(Get.width, 80.h);
}
