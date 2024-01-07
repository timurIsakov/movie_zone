import 'package:equatable/equatable.dart';

import '../../../main/domain/entities/movie_entity.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;
  final List<MovieEntity> movies;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.movies,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        movies,
      ];
}
