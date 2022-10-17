part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetailEntity,
    this.movieDetailState = RequestState.loading,
    this.movieDetailMessage = '',
    this.recommendationsEntity = const [],
    this.recommendationsMovieState = RequestState.loading,
    this.recommendationsMovieMessage = '',
  });

  final MovieDetailEntity? movieDetailEntity;
  final RequestState movieDetailState;
  final String movieDetailMessage;

  final List<RecommendationsEntity> recommendationsEntity;
  final RequestState recommendationsMovieState;
  final String recommendationsMovieMessage;

  MovieDetailsState copyWith({
    MovieDetailEntity? movieDetailEntity,
    RequestState? movieDetailState,
    String? movieDetailMessage,
    List<RecommendationsEntity>? recommendationsEntity,
    RequestState? recommendationsMovieState,
    String? recommendationsMovieMessage,
  }) {
    return MovieDetailsState(
      movieDetailEntity: movieDetailEntity ?? this.movieDetailEntity,
      movieDetailState: movieDetailState ?? this.movieDetailState,
      movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
      recommendationsEntity:
          recommendationsEntity ?? this.recommendationsEntity,
      recommendationsMovieState:
          recommendationsMovieState ?? this.recommendationsMovieState,
      recommendationsMovieMessage:
          recommendationsMovieMessage ?? this.recommendationsMovieMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetailEntity,
        movieDetailState,
        movieDetailMessage,
        recommendationsEntity,
        recommendationsMovieMessage,
        recommendationsMovieState,
      ];
}
