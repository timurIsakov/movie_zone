import 'package:get_it/get_it.dart';
import 'package:movie_zone/core/api/firebase_api.dart';
import 'package:movie_zone/core/api/local_secure_api.dart';

final locator = GetIt.I;

void setup() {
  //Classes
  locator.registerSingleton<LocalSecureApi>(LocalSecureApi());
  locator.registerSingleton<FirebaseApi>(FirebaseApi(localSecureApi: locator()));
}
