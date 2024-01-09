part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignInSuccess extends AuthState {}

class AuthSignUpSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
