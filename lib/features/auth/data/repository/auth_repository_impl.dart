import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/entities/app_error.dart';
import 'package:movie_zone/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:movie_zone/features/auth/domain/repository/auth_repository.dart';

import '../datasources/auth_local_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSources authRemoteDataSources;

  AuthRepositoryImpl(this.authRemoteDataSources, this.localDataSource);

  @override
  Future<Either<AppError, bool>> signIn(
      {required String email, required String password}) async {
    try {
      final response =
          await authRemoteDataSources.signIn(email: email, password: password);
      return Right(response);
    } catch (error) {
      return Left(AppError(
          appErrorType: AppErrorType.api, errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<AppError, bool>> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final response = await authRemoteDataSources.signUp(
          email: email, password: password, name: name);
      return Right(response);
    } catch (error) {
      return Left(AppError(
          appErrorType: AppErrorType.api, errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<AppError, bool>> checkActiveSession() async {
    try {
      final response = await localDataSource.checkActiveSession();
      return Right(response);
    } catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.api,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
