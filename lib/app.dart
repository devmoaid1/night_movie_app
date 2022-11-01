import 'package:flutter/material.dart';
import 'package:night_movie_app/features/movies/presentation/views/movies_screen.dart';

class NightMovieApp extends StatelessWidget {
  const NightMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Night Movie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoviesView(),
    );
  }
}
