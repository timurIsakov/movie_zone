import 'package:get_it/get_it.dart';
import 'package:movie_zone/core/api/firebase_api.dart';
import 'package:movie_zone/core/api/local_secure_api.dart';

import '../features/auth/presentation/cubit/auth_cubit.dart';

final locator = GetIt.I;

void setup() {
  //----------------------Classes---------------------------//
  locator.registerSingleton<LocalSecureApi>(LocalSecureApi());
  locator
      .registerSingleton<FirebaseApi>(FirebaseApi(localSecureApi: locator()));
  //----------------------Cubits----------------------------//
  locator.registerFactory(() => AuthCubit(locator()));
}
