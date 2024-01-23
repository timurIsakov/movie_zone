import 'package:get_it/get_it.dart';
import 'package:movie_zone/core/api/firebase_api.dart';
import 'package:movie_zone/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:movie_zone/features/auth/domain/usecases/session_usecase.dart';
import 'package:movie_zone/features/auth/presentation/cubit/session/session_cubit.dart';
import 'package:movie_zone/features/main/data/datasources/main_remote_data_source.dart';
import 'package:movie_zone/features/main/data/repository/main_repository_impl.dart';
import 'package:movie_zone/features/main/domain/repository/main_repository.dart';
import 'package:movie_zone/features/main/presentation/cubit/movies/movies_cubit.dart';
import 'package:movie_zone/features/main/presentation/cubit/profile/profile_cubit.dart';

import '../core/api/api_client.dart';
import '../core/services/secure_storage_service.dart';
import '../features/auth/data/datasources/auth_remote_data_source.dart';
import '../features/auth/data/repository/auth_repository_impl.dart';
import '../features/auth/domain/repository/auth_repository.dart';
import '../features/auth/domain/usecases/auth_usecase.dart';
import '../features/auth/presentation/cubit/auth/auth_cubit.dart';
import '../features/main/domain/usecases/movie_usecase.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.I;

void setup() {
  //Core
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<ApiClient>(
      () => ApiClientImpl(locator(), locator()));

  //----------------------Classes---------------------------//
  locator.registerSingleton<SecureStorageService>(SecureStorageService());
  locator.registerSingleton<FirebaseApi>(FirebaseApi(locator()));

  //----------------------Cubits----------------------------//
  locator.registerFactory(() => AuthCubit(locator(), locator(), locator()));
  locator.registerLazySingleton<SessionCubit>(() => SessionCubit(locator()));
  locator.registerLazySingleton<ProfileCubit>(() => ProfileCubit(locator()));
  locator.registerLazySingleton<MoviesCubit>(() => MoviesCubit(locator()));

  //----------------------Repository-----------------------//
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<MainRepository>(
      () => MainRepositoryImpl(locator()));
  //----------------------DataSources---------------------//
  locator.registerLazySingleton<AuthRemoteDataSources>(
      () => AuthRemoteDataSourcesImpl(locator()));
  locator.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(locator()));
  locator.registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(locator(), locator()));

  //----------------------USE CASES -----------------------//
  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(locator()));
  locator
      .registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(locator()));
  locator.registerLazySingleton<CheckActiveSession>(
      () => CheckActiveSession(locator()));
  locator.registerLazySingleton(() => UserUseCase(locator()));
  locator.registerLazySingleton<LogOutUseCase>(() => LogOutUseCase(locator()));
  locator.registerLazySingleton<MovieUseCase>(() => MovieUseCase(locator()));
}
