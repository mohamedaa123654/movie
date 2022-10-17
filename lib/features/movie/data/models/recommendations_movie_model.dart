import 'package:movie/features/movie/domain/entities/recommendations_entity.dart';

class RecommendationsMovieModel extends RecommendationsEntity {
  const RecommendationsMovieModel({super.backdropPath, required super.id});

  factory RecommendationsMovieModel.fromJson(Map<String, dynamic> json) =>
      RecommendationsMovieModel(
        backdropPath:
            json['backdrop_path'] ?? '/hT3OqvzMqCQuJsUjZnQwA5NuxgK.jpg',
        id: json['id'],
      );
}
