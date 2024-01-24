import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/entities/no_params.dart';
import 'package:movie_zone/features/main/domain/entities/tv_result_entity.dart';
import 'package:movie_zone/features/main/domain/usecases/tv_usecase.dart';

part 'tv_series_state.dart';

class TvSeriesCubit extends Cubit<TvSeriesState> {
  final GetTvUseCase getTvUseCase;

  TvSeriesCubit(this.getTvUseCase) : super(TvSeriesInitial());

  load() async {
    final data = await getTvUseCase.call(NoParams());

    data.fold((l) => emit(TvSeriesError(message: l.errorMessage)),
        (r) => emit(TvSeriesLoaded(movies: r)));
  }
}
