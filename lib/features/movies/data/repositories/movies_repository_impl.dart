import 'package:flutter/material.dart';
import 'package:night_movie_app/core/errors/exceptions.dart';
import 'package:night_movie_app/features/movies/data/datasources/movies_remote_datasource.dart';
import 'package:night_movie_app/features/movies/domain/entites/movie.dart';
import 'package:night_movie_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:night_movie_app/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDataSource;

  MoviesRepositoryImpl({required this.moviesRemoteDataSource});
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final movies = await moviesRemoteDataSource.getNowPlayingMovies();
      return Right(movies);
    } on ServerException catch (err) {
      return _handleMoviesFailure(err);
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final movies = await moviesRemoteDataSource.getPopularMovies();
      return Right(movies);
    } on ServerException catch (err) {
      return _handleMoviesFailure(err);
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final movies = await moviesRemoteDataSource.getTopRatedMovies();
      return Right(movies);
    } on ServerException catch (err) {
      return _handleMoviesFailure(err);
    }
  }

  dynamic _handleMoviesFailure(ServerException err) {
    debugPrint(err.errorModel.statusMessage);
    return Left(ServerFailure());
  }
}
