import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/no_params.dart';
import '../../../domain/usecases/session_usecase.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final CheckActiveSession _checkActiveSession;
  SessionCubit(this._checkActiveSession) : super(SessionDisabled());

  checkSession() async {
    final response = await _checkActiveSession.call(NoParams());

    response.fold((l) => emit(SessionDisabled()), (r) {
      if (r) {
        emit(SessionActive());
      } else {
        emit(SessionDisabled());
      }
    });
  }
}
