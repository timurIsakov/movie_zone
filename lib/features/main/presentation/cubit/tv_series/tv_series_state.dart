part of 'tv_series_cubit.dart';

abstract class TvSeriesState {}

final class TvSeriesInitial extends TvSeriesState {}

final class TvSeriesError extends TvSeriesState {
  final String message;

  TvSeriesError({required this.message});
}

final class TvSeriesLoaded extends TvSeriesState {
  final TvResultEntity movies;

  TvSeriesLoaded({required this.movies});
}

final class TvSeriesLoading extends TvSeriesState {}
