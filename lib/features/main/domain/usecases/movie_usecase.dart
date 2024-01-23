import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/entities/app_error.dart';
import 'package:movie_zone/core/entities/no_params.dart';
import 'package:movie_zone/core/usecase/usecase.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';
import 'package:movie_zone/features/main/domain/entities/movie_result_entity.dart';
import 'package:movie_zone/features/main/domain/repository/main_repository.dart';

class MovieUseCase extends UseCase<MovieResultsEntity, NoParams> {
  final MainRepository mainRepository;

  MovieUseCase(this.mainRepository);

  @override
  Future<Either<AppError, MovieResultsEntity>> call(NoParams params) {
    return mainRepository.getMovie();
  }
}

class UserUseCase extends UseCase<UserEntity, NoParams> {
  final MainRepository mainRepository;

  UserUseCase(this.mainRepository);

  @override
  Future<Either<AppError, UserEntity>> call(NoParams params) {
    return mainRepository.getCurrentUser();
  }
}

class GetPopularMovieUsecase extends UseCase<MovieResultsEntity, NoParams> {
  final MainRepository mainRepository;

  GetPopularMovieUsecase(this.mainRepository);

  @override
  Future<Either<AppError, MovieResultsEntity>> call(NoParams params) {
    return mainRepository.getPopularMovies();
  }
}
