import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:night_movie_app/features/movies/presentation/views/movie_details_screen.dart';

class NightMovieApp extends StatelessWidget {
  const NightMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Night Movie',
            theme: ThemeData(
              fontFamily: "Poppins",
              scaffoldBackgroundColor: const Color(0xff303030),
              primarySwatch: Colors.blue,
            ),
            home: const MovieDetailsScreen(id: "663712"),
          );
        });
  }
}
