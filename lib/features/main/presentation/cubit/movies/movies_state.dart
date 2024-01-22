part of 'movies_cubit.dart';

abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final MovieResultsEntity movieEntity;

  MoviesLoaded({required this.movieEntity});
}

class MoviesError extends MoviesState {
  final String message;

  MoviesError({required this.message});
}
