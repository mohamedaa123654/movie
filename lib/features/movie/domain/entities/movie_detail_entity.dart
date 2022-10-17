import 'package:equatable/equatable.dart';
import 'package:movie/features/movie/domain/entities/genres_entity.dart';

class MovieDetailEntity extends Equatable {
  final int id;
  final String backdropPath;
  final String title;
  final List<GenresEntity> genres;
  final String overview;
  final double voteAverage;
  final int runtime;
  final String releaseDate;
  MovieDetailEntity({
    required this.runtime,
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genres,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        runtime,
        id,
        title,
        backdropPath,
        genres,
        overview,
        voteAverage,
        releaseDate
      ];
}
