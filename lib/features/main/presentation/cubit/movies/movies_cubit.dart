import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/entities/no_params.dart';
import 'package:movie_zone/features/main/domain/entities/movie_result_entity.dart';

import '../../../domain/usecases/movie_usecase.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MovieUseCase movieUseCase;
  MoviesCubit(this.movieUseCase) : super(MoviesInitial());

  load() async {
    final data = await movieUseCase.call(NoParams());

    data.fold((l) => emit(MoviesError(message: l.errorMessage)),
        (r) => emit(MoviesLoaded(movieEntity: r)));
  }
}
