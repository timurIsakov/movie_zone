import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/entities/app_error.dart';

abstract class AuthRepository {
  Future<Either<AppError, bool>> signIn(
      {required String email, required String password});
  Future<Either<AppError, bool>> signUp(
      {required String email, required String password, required String name});
  Future<Either<AppError, bool>> checkActiveSession();
}
