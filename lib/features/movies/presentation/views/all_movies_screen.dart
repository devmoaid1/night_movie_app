import 'package:flutter/material.dart';
import 'package:night_movie_app/core/constants/app_colors.dart';

import '../widgets/all_movies_body.dart';
import '../widgets/header_bar.dart';

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
