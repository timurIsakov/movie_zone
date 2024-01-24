import 'package:movie_zone/features/main/domain/entities/tv_entity.dart';

class TvModel extends TvEntity {
  TvModel({required super.id, required super.title, required super.imageUrl});

  factory TvModel.fromJson({required Map<String, dynamic> json}) {
    return TvModel(
        id: json['id'], title: json['name'], imageUrl: json['poster_path']);
  }
}
