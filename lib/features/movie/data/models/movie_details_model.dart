import 'package:movie/features/movie/data/models/genres_models.dart';
import 'package:movie/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movie/features/movie/domain/entities/movie_entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  MovieDetailModel({required super.runtime, required super.id, required super.title, required super.backdropPath, required super.genres, required super.overview, required super.voteAverage, required super.releaseDate});
  
factory MovieDetailModel.fromJson(Map<String, dynamic> json) => MovieDetailModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        genres: List<GenresModel>.from(json['genres'].map((e) => GenresModel.fromJson(e))),
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
        runtime: json['runtime'],
      );
  
}
