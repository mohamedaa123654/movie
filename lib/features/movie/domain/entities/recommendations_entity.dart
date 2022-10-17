import 'package:equatable/equatable.dart';

class RecommendationsEntity extends Equatable {
  final String? backdropPath;
  final int id;
  const RecommendationsEntity(
      { this.backdropPath, required this.id});
  @override
  List<Object?> get props => [backdropPath, id];
}
