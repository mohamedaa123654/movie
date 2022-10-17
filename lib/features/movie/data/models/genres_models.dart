import 'package:movie/features/movie/domain/entities/genres_entity.dart';

class GenresModel extends GenresEntity{
  GenresModel({required super.id, required super.name});
  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        id: json['id'],
        name: json['name'],
      );
}