import 'package:flutter/cupertino.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';
import 'package:movie_zone/features/main/data/model/movie_model.dart';

@immutable
class UserModel extends UserEntity {
  UserModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.password,
      required super.movies});

  factory UserModel.fromEntity({required UserEntity entity}) {
    return UserModel(
        id: entity.id,
        name: entity.name,
        email: entity.email,
        password: entity.password,
        movies: entity.movies);
  }

  factory UserModel.fromJson({required Map<String, dynamic> json}) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      password: json["password"],
      movies:
          List.from(json['movies']).map((e) => MovieModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["id"] = id;
    json["name"] = name;
    json["email"] = email;
    json["password"] = password;
    json["movies"] = List.from(movies)
        .map((e) => MovieModel.fromEntity(e).toJson())
        .toList();

    return json;
  }
}
