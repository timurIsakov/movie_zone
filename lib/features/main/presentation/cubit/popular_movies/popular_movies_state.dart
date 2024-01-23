part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState {}

final class PopularMoviesInitial extends PopularMoviesState {}

final class PopularMoviesLoaded extends PopularMoviesState {
  final MovieResultsEntity movies;

  PopularMoviesLoaded({required this.movies});
}

final class PopularMoviesLoading extends PopularMoviesState {}

final class PopularMoviesError extends PopularMoviesState {
  final String message;

  PopularMoviesError({required this.message});
}
