import 'package:get_it/get_it.dart';
import 'package:movie/features/movie/data/datasources/movie_remote_data_sources.dart';
import 'package:movie/features/movie/data/repositories/movies_repository.dart';
import 'package:movie/features/movie/domain/repositories/base_movies_repository.dart';
import 'package:movie/features/movie/domain/usecases/get_Movie_Details_usecase.dart';
import 'package:movie/features/movie/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:movie/features/movie/domain/usecases/get_now_playing_Movies_usecase.dart';
import 'package:movie/features/movie/domain/usecases/get_popular_Movies_usecase.dart';
import 'package:movie/features/movie/domain/usecases/get_top_rated_Movies_usecase.dart';
import 'package:movie/features/movie/presentation/bloc/bloc/movie_details_bloc.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Bloc
    sl.registerFactory(() => MovieBloc(sl(),sl(),sl(),));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    ///UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieRecommendationsUsecase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    ///Data Sources
    sl.registerLazySingleton<BaseMovieRemoteDataSources>(
        () => MovieRemoteDataSources());
  }
}
