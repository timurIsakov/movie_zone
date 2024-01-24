import 'package:dartz/dartz.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';
import 'package:movie_zone/features/main/domain/entities/movie_result_entity.dart';
import 'package:movie_zone/features/main/domain/entities/tv_result_entity.dart';

import '../../../../core/entities/app_error.dart';

abstract class MainRepository {
  Future<Either<AppError, MovieResultsEntity>> getMovie();
  Future<Either<AppError, UserEntity>> getCurrentUser();
  Future<Either<AppError, MovieResultsEntity>> getPopularMovies();
  Future<Either<AppError, TvResultEntity>> getTvSeries();
}
