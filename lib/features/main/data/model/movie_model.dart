import 'package:movie_zone/features/main/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel(
      {required super.title,
      required super.description,
      required super.time,
      required super.imageUrl,
      required super.createdAt,
      required super.overall});

  factory MovieModel.fromEntity({required MovieEntity entity}) {
    return MovieModel(
        title: entity.title,
        description: entity.description,
        time: entity.time,
        imageUrl: entity.imageUrl,
        createdAt: entity.createdAt,
        overall: entity.overall);
  }

  factory MovieModel.fromJson({required Map<String, dynamic> json}) {
    return MovieModel(
        title: json["title"],
        description: json["description"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        createdAt: json["createdAt"],
        overall: json["overall"]);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["title"] = title;
    json["description"] = description;
    json["time"] = time;
    json["imageUrl"] = imageUrl;
    json["createdAt"] = createdAt;
    json["overall"] = overall;

    return json;
  }
}
