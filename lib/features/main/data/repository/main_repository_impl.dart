import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/entities/app_error.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';
import 'package:movie_zone/features/main/data/datasources/main_remote_data_source.dart';
import 'package:movie_zone/features/main/domain/entities/movie_result_entity.dart';
import 'package:movie_zone/features/main/domain/entities/tv_result_entity.dart';
import 'package:movie_zone/features/main/domain/repository/main_repository.dart';

class MainRepositoryImpl extends MainRepository {
  final MainRemoteDataSource mainRemoteDataSource;

  MainRepositoryImpl(this.mainRemoteDataSource);
  @override
  Future<Either<AppError, MovieResultsEntity>> getMovie() async {
    try {
      final response = await mainRemoteDataSource.getMovie();

      return Right(response);
    } catch (error) {
      return Left(AppError(
          appErrorType: AppErrorType.api, errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<AppError, UserEntity>> getCurrentUser() async {
    try {
      final response = await mainRemoteDataSource.getCurrentUser();

      return Right(response);
    } catch (error) {
      return Left(AppError(
          appErrorType: AppErrorType.api, errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<AppError, MovieResultsEntity>> getPopularMovies() async {
    try {
      final response = await mainRemoteDataSource.getPopularMovies();

      return Right(response);
    } catch (error) {
      return Left(AppError(
          appErrorType: AppErrorType.api, errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<AppError, TvResultEntity>> getTvSeries() async {
    try {
      final response = await mainRemoteDataSource.getTvSeries();

      return Right(response);
    } catch (error) {
      return Left(AppError(
          appErrorType: AppErrorType.api, errorMessage: error.toString()));
    }
  }
}
