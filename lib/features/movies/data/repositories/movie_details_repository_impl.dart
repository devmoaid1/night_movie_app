import 'package:flutter/material.dart';
import 'package:night_movie_app/core/errors/exceptions.dart';
import 'package:night_movie_app/features/movies/data/datasources/movie_details_remote_datasource.dart';
import 'package:night_movie_app/features/movies/domain/entites/recommended_movie.dart';
import 'package:night_movie_app/features/movies/domain/entites/movie_details.dart';
import 'package:night_movie_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:night_movie_app/features/movies/domain/repositories/movie_details_repository.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieDetailsRemoteDataSource movieDetailsDataSource;

  MovieDetailsRepositoryImpl({required this.movieDetailsDataSource});

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      {required String id}) async {
    try {
      final response = await movieDetailsDataSource.getMovieDetails(id: id);
      return Right(response);
    } on ServerException catch (err) {
      debugPrint(err.errorModel.statusMessage);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<RecommendedMovie>>> getMovieRecommendedMovies(
      {required String id}) async {
    try {
      final response =
          await movieDetailsDataSource.getRecommendedMovies(id: id);
      return Right(response);
    } on ServerException catch (err) {
      debugPrint(err.errorModel.statusMessage);
      return Left(ServerFailure());
    }
  }
}
