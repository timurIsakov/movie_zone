import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/entities/app_error.dart';
import 'package:movie_zone/core/entities/no_params.dart';
import 'package:movie_zone/core/usecase/usecase.dart';
import 'package:movie_zone/features/auth/domain/repository/auth_repository.dart';
//=============== USE CASES ===============//

class LogOutUseCase extends UseCase<void, NoParams> {
  final AuthRepository authRepository;

  LogOutUseCase(this.authRepository);
  @override
  Future<Either<AppError, void>> call(NoParams params) async =>
       authRepository.logOut();
}

class LoginUseCase extends UseCase<bool, LoginUseCaseParams> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);
  @override
  Future<Either<AppError, bool>> call(LoginUseCaseParams params) async {
    final response = await _authRepository.signIn(
        email: params.email, password: params.password);
    return response;
  }
}

class RegisterUseCase extends UseCase<bool, RegisterUseCaseParams> {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);
  @override
  Future<Either<AppError, bool>> call(RegisterUseCaseParams params) async {
    final response = await _authRepository.signUp(
      email: params.email,
      password: params.password,
      name: params.name,
    );
    return response;
  }
}

//=============== PARAMS ===============//
class RegisterUseCaseParams {
  final String email;
  final String password;
  final String name;

  RegisterUseCaseParams(
      {required this.email, required this.password, required this.name});
}

class LoginUseCaseParams {
  final String email;
  final String password;

  LoginUseCaseParams({required this.email, required this.password});
}
