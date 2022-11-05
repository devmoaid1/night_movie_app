import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/app_image.dart';
import '../../domain/entites/movie.dart';

class NowPlayingMovieCard extends StatelessWidget {
  final Movie movie;
  const NowPlayingMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(key: UniqueKey(), children: [
      ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // fromLTRB
                Colors.transparent,
                Colors.black,
                Colors.black,
                Colors.transparent,
              ],
              stops: [0, 0.3, 0.5, 1],
            ).createShader(
              Rect.fromLTRB(0, 0, rect.width, rect.height),
            );
          },
          blendMode: BlendMode.dstIn,
          child: AppImage(
            height: MediaQuery.of(context).size.height * 0.55,
            path: AppConstants.baseImageUrl(movie.backdropPath),
          )),
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
                  Text("Now Playing",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                      )),
                ])),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6),
              child: Text(movie.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  )),
            ),
          ]))
    ]);
  }
}
