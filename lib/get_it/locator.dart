import 'package:get_it/get_it.dart';
import 'package:movie_zone/core/api/firebase_api.dart';

import '../core/services/secure_storage_service.dart';
import '../features/auth/data/datasources/auth_remote_data_source.dart';
import '../features/auth/data/repository/auth_repository_impl.dart';
import '../features/auth/domain/repository/auth_repository.dart';
import '../features/auth/domain/usecases/auth_usecase.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';

final locator = GetIt.I;

void setup() {
  //----------------------Classes---------------------------//
  locator.registerSingleton<SecureStorageService>(SecureStorageService());
  locator.registerSingleton<FirebaseApi>(FirebaseApi());
  //----------------------Cubits----------------------------//
  locator.registerFactory(() => AuthCubit(locator(), locator()));
  //----------------------Repository-----------------------//
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator()));
  //----------------------DataSources---------------------//
  locator.registerLazySingleton<AuthRemoteDataSources>(
      () => AuthRemoteDataSourcesImpl(locator()));
  //----------------------USE CASES -----------------------//
  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(locator()));
  locator.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(locator()));

}
