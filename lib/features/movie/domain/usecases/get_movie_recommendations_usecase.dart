import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecase/base_usecase.dart';
import 'package:movie/features/movie/domain/entities/recommendations_entity.dart';
import 'package:movie/features/movie/domain/repositories/base_movies_repository.dart';

class GetMovieRecommendationsUsecase extends BaseUsecase<List<RecommendationsEntity>, RecommendationsMovieParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetMovieRecommendationsUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<RecommendationsEntity>>> call(RecommendationsMovieParameters parameters) async {
    return await baseMoviesRepository.getMovieRecommendations( parameters);
  }
}

class RecommendationsMovieParameters extends Equatable {
  final int movieId;
  const RecommendationsMovieParameters({required this.movieId});
  
  @override
  List<Object?> get props => [movieId];
}
