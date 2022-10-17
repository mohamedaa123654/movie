import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/usecase/base_usecase.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/features/movie/data/datasources/movie_remote_data_sources.dart';
import 'package:movie/features/movie/data/repositories/movies_repository.dart';
import 'package:movie/features/movie/domain/entities/movie_entity.dart';
import 'package:movie/features/movie/domain/repositories/base_movies_repository.dart';
import 'package:movie/features/movie/domain/usecases/get_now_playing_Movies_usecase.dart';
import 'package:movie/features/movie/domain/usecases/get_popular_Movies_usecase.dart';
import 'package:movie/features/movie/domain/usecases/get_top_rated_Movies_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUsecase getNowPLayingMoviesUseCase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MovieBloc(this.getNowPLayingMoviesUseCase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopulerMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPLayingMoviesUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(state.copyWith(
              nowPlayingMovies: r,
              nowPlayingState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getPopularMovies(
      GetPopulerMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getPopularMoviesUsecase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
              popularMovies: r,
              popularState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedMoviesUsecase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
        (r) => emit(state.copyWith(
              topRatedMovies: r,
              topRatedState: RequestState.loaded,
            )));
  }
}
