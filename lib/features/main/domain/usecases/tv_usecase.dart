import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/entities/app_error.dart';
import 'package:movie_zone/core/entities/no_params.dart';
import 'package:movie_zone/core/usecase/usecase.dart';
import 'package:movie_zone/features/main/domain/entities/tv_result_entity.dart';
import 'package:movie_zone/features/main/domain/repository/main_repository.dart';

class GetTvUseCase extends UseCase<TvResultEntity, NoParams> {
  final MainRepository mainRepository;

  GetTvUseCase(this.mainRepository);
  @override
  Future<Either<AppError, TvResultEntity>> call(NoParams params) {
    return mainRepository.getTvSeries();
  }
}
