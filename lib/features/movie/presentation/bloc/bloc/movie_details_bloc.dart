import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movie/features/movie/domain/entities/recommendations_entity.dart';
import 'package:movie/features/movie/domain/usecases/get_Movie_Details_usecase.dart';
import 'package:movie/features/movie/domain/usecases/get_movie_recommendations_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUsecase, this.getMovieRecommendationsUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetMovieRecommendationEvent>(_getMovieRecommendationEvent);
  }
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetMovieRecommendationsUsecase getMovieRecommendationsUsecase;

  FutureOr<void> _getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUsecase(MovieDetailsParameters(movieId: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            movieDetailState: RequestState.error,
            movieDetailMessage: l.message)),
        (r) => emit(state.copyWith(
              movieDetailEntity: r,
              movieDetailState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getMovieRecommendationEvent(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
  
  final result =
        await getMovieRecommendationsUsecase(RecommendationsMovieParameters(movieId: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            recommendationsMovieState: RequestState.error,
            recommendationsMovieMessage: l.message)),
        (r) => emit(state.copyWith(
              recommendationsEntity: r,
              recommendationsMovieState: RequestState.loaded,
            )));
  }
}
