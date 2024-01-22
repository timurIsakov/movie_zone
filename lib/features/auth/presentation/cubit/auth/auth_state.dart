part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignInSuccess extends AuthState {}

class AuthSignUpSuccess extends AuthState {}

class AuthSignInError extends AuthState {
  final String message;

  AuthSignInError({required this.message});
}

class AuthSignUpError extends AuthState {
  final String message;

  AuthSignUpError({required this.message});
}
