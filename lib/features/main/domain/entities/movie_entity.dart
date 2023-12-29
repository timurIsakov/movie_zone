import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String title;
  final String post;
  final String description;
  final String trailerURL;
  final String trailerDuration;
  final DateTime createdAt;

  const MovieEntity(
      {required this.title,
      required this.post,
      required this.description,
      required this.trailerURL,
      required this.trailerDuration,
      required this.createdAt});

  @override
  List<Object?> get props => [
        title,
        post,
        description,
        trailerURL,
        trailerDuration,
        createdAt,
      ];
}
