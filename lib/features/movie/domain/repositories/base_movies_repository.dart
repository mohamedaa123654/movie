import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movie/features/movie/domain/entities/movie_entity.dart';
import 'package:movie/features/movie/domain/entities/recommendations_entity.dart';
import 'package:movie/features/movie/domain/usecases/get_Movie_Details_usecase.dart';
import 'package:movie/features/movie/domain/usecases/get_movie_recommendations_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetailEntity>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure, List<RecommendationsEntity>>> getMovieRecommendations(RecommendationsMovieParameters parameters);

}
