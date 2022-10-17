import 'package:dio/dio.dart';
import 'package:movie/core/error/exceptions.dart';
import 'package:movie/core/network/api_constance.dart';
import 'package:movie/core/network/error_message_model.dart';
import 'package:movie/core/utils/app_constants.dart';
import 'package:movie/features/movie/data/models/movie_details_model.dart';
import 'package:movie/features/movie/data/models/movie_model.dart';
import 'package:movie/features/movie/data/models/recommendations_movie_model.dart';
import 'package:movie/features/movie/domain/usecases/get_Movie_Details_usecase.dart';
import 'package:movie/features/movie/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:movie/features/movie/domain/usecases/get_now_playing_Movies_usecase.dart';
import 'package:movie/features/movie/presentation/bloc/bloc/movie_details_bloc.dart';

abstract class BaseMovieRemoteDataSources {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationsMovieModel>> getMovieRecommendation(RecommendationsMovieParameters parameters);
}

class MovieRemoteDataSources extends BaseMovieRemoteDataSources {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  
  @override
  Future<MovieDetailModel> getMovieDetails(MovieDetailsParameters parameters) async{
    final response = await Dio().get(ApiConstants.MovieDetailPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data )
           ;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  
  @override
  Future<List<RecommendationsMovieModel>> getMovieRecommendation(RecommendationsMovieParameters parameters) async {
   final response = await Dio().get(ApiConstants.MovieRecommendationsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return List<RecommendationsMovieModel>.from((response.data['results'] as List)
          .map((e) => RecommendationsMovieModel.fromJson(e)));
           
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
