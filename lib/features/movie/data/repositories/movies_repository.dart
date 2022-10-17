import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exceptions.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/features/movie/data/datasources/movie_remote_data_sources.dart';
import 'package:movie/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movie/features/movie/domain/entities/movie_entity.dart';
import 'package:movie/features/movie/domain/entities/recommendations_entity.dart';
import 'package:movie/features/movie/domain/repositories/base_movies_repository.dart';
import 'package:movie/features/movie/domain/usecases/get_Movie_Details_usecase.dart';
import 'package:movie/features/movie/domain/usecases/get_movie_recommendations_usecase.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSources baseMovieRemoteDataSources;
  MoviesRepository(this.baseMovieRemoteDataSources);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSources.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSources.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSources.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetailEntity>> getMovieDetails(MovieDetailsParameters parameters)async {
     final result = await baseMovieRemoteDataSources.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationsEntity>>> getMovieRecommendations(RecommendationsMovieParameters parameters) async{
     final result = await baseMovieRemoteDataSources.getMovieRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
