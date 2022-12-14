import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final BoxFit? fit;
  final String? path;
  final double? height;
  final double? width;
  final Widget? placeHolder;

  const AppImage(
      {super.key,
      this.fit = BoxFit.cover,
      this.height = 20,
      this.width = 20,
      this.placeHolder,
      this.path = ""});

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(path!,
        key: key,
        height: height,
        cache: true,
        fit: fit,
        printError: true, loadStateChanged: (ExtendedImageState state) {
      switch (state.extendedImageLoadState) {
        case LoadState.loading:
          return placeHolder ??
              const Center(
                child: CircularProgressIndicator.adaptive(),
              );

        case LoadState.completed:
          return ExtendedRawImage(
            image: state.extendedImageInfo?.image,
            fit: fit,
          );

        case LoadState.failed:
          return const Icon(Icons.error);
        default:
          return state.completedWidget;
      }
    });
  }
}
