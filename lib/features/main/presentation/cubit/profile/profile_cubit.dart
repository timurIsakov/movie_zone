import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/entities/no_params.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';

import '../../../domain/usecases/movie_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserUseCase userUseCase;
  ProfileCubit(this.userUseCase) : super(ProfileInitial());

  load() async {
    final data = await userUseCase.call(NoParams());

    data.fold((l) => emit(ProfileError(message: l.errorMessage)),
        (r) => emit(ProfileLoaded(userEntity: r)));
  }
}
