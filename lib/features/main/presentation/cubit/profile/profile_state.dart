part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserEntity userEntity;

  ProfileLoaded({required this.userEntity});
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}
