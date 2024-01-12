import 'package:movie_zone/core/api/firebase_api.dart';

abstract class AuthRemoteDataSources {
  Future<bool> signIn({required String email, required String password});
  Future<bool> signUp(
      {required String email, required String password, required String name});
}

class AuthRemoteDataSourcesImpl extends AuthRemoteDataSources {
  final FirebaseApi firebaseApi;

  AuthRemoteDataSourcesImpl(this.firebaseApi);
  @override
  Future<bool> signIn({required String email, required String password}) async {
    final result = await firebaseApi.signIn(email: email, password: password);
    return result;
  }

  @override
  Future<bool> signUp(
      {required String email,
      required String password,
      required String name}) async {
    final result =
        await firebaseApi.signUp(email: email, password: password, name: name);
    return result;
  }
}
