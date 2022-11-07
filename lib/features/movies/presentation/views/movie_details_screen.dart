import 'package:flutter/material.dart';
import 'package:night_movie_app/core/widgets/app_image.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String id;
  const MovieDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            AppImage(
              path: "",
            )
          ],
        ),
      ),
    );
  }
}
