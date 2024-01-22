import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/entities/no_params.dart';

import '../../../domain/usecases/auth_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogOutUseCase logOutUseCase;

  AuthCubit(this.loginUseCase, this.registerUseCase, this.logOutUseCase)
      : super(AuthInitial());

  signIn({required String email, required String password}) async {
    emit(AuthLoading());

    final data = await loginUseCase(
        LoginUseCaseParams(email: email, password: password));
    data.fold((l) => emit(AuthSignInError(message: l.errorMessage)),
        (r) => emit(AuthSignInSuccess()));
  }

  signUp(
      {required String email,
      required String password,
      required String name}) async {
    emit(AuthLoading());

    final data = await registerUseCase(
        RegisterUseCaseParams(email: email, password: password, name: name));
    data.fold((l) => emit(AuthSignUpError(message: l.errorMessage)),
        (r) => emit(AuthSignUpSuccess()));
  }

  logOut() async => await logOutUseCase.call(NoParams());
}
