import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecase/base_usecase.dart';
import 'package:movie/features/movie/domain/entities/movie_entity.dart';
import 'package:movie/features/movie/domain/repositories/base_movies_repository.dart';

class GetTopRatedMoviesUsecase extends BaseUsecase<List<MovieEntity>,NoParameters > {
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParameters noParameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
