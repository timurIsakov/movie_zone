import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/api/firebase_api.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseApi firebaseApi;
  AuthCubit(this.firebaseApi) : super(AuthInitial());

  signIn({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await firebaseApi.signIn(email: email, password: password);
      emit(AuthSignInSuccess());
    } catch (error) {
      emit(AuthError(message: error.toString()));
    }
  }

  signUp (
      {required String name,
      required String email,
      required String password}) async {
    emit(AuthLoading());

    try {
      await firebaseApi.signUp(email: email, password: password, name: name);
      emit(AuthSignUpSuccess());
    } catch (error) {
      emit(AuthError(message: error.toString()));
    }
  }
}
