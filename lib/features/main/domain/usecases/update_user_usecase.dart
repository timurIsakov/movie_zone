import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/entities/app_error.dart';
import 'package:movie_zone/core/usecase/usecase.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';
import 'package:movie_zone/features/main/domain/repository/main_repository.dart';

class UpdateUserUseCase extends UseCase<void, UserEntity> {
  final MainRepository mainRepository;

  UpdateUserUseCase(this.mainRepository);
  @override
  Future<Either<AppError, void>> call(UserEntity params) {
    return mainRepository.updateCurrentUser(params);
  }
}
