import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecase/base_usecase.dart';
import 'package:movie/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movie/features/movie/domain/repositories/base_movies_repository.dart';

class GetMovieDetailsUsecase extends BaseUsecase<MovieDetailEntity, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetailEntity>> call(MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails( parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;
  const MovieDetailsParameters({required this.movieId});
  
  @override
  List<Object?> get props => [movieId];
}
