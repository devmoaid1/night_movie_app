import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/app_image.dart';

class MovieImage extends StatelessWidget {
  const MovieImage(
      {Key? key,
      required this.movieImagePath,
      this.fit,
      required this.shimmerHeight,
      required this.shimmerWidth,
      this.width,
      this.height})
      : super(key: key);

  final String movieImagePath;
  final double shimmerHeight;
  final double shimmerWidth;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AppImage(
            placeHolder: Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: shimmerHeight,
                width: shimmerWidth,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            fit: BoxFit.cover,
            width: width,
            height: height,
            path: AppConstants.baseImageUrl(movieImagePath)));
  }
}
