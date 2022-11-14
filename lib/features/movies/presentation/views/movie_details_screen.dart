import 'package:flutter/material.dart';
import 'package:night_movie_app/core/constants/app_colors.dart';

import '../widgets/movie_description_section.dart';
import '../widgets/movie_details_section.dart';
import '../widgets/movie_poster.dart';
import '../widgets/recommendation_section.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String id;
  const MovieDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueDark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              MoviePoster(),
              MovieDetailsSection(),
              MovieDescriptionSection(),
              RecommendationsSection()
            ],
          ),
        ),
      ),
    );
  }
}
