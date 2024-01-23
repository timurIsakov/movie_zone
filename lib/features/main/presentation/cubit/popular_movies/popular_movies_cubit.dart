import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/entities/no_params.dart';
import 'package:movie_zone/features/main/domain/entities/movie_result_entity.dart';
import 'package:movie_zone/features/main/domain/usecases/movie_usecase.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final GetPopularMovieUsecase getPopularMovieUsecase;

  PopularMoviesCubit(this.getPopularMovieUsecase)
      : super(PopularMoviesInitial());

  load() async {
    final data = await getPopularMovieUsecase.call(NoParams());

    data.fold((l) => emit(PopularMoviesError(message: l.errorMessage)),
        (r) => emit(PopularMoviesLoaded(movies: r)));
  }
}
