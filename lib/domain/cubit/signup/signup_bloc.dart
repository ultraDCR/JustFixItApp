import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_fix_it/data/repositories/auth_repository.dart';
import '../../preference/share_preference_util.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;
  SignupBloc(this.authRepository) : super(SignupInitial()) {
    on<SignUpButtonPressed>(_onSignUp);
  }

  FutureOr<void> _onSignUp(
      SignUpButtonPressed event, Emitter<SignupState> emit) async {
    try {
      var response = await authRepository.registerUser(
          name: event.fullName,
          email: event.email??'',
          userType: event.userType??'',
          address: event.address,
          password: event.password,
          confirmPassword: event.confirmPassword,

      );
      if (response != null) {
        emit(SignupSuccessful(authData: response));
      }
    } catch (e) {
      emit(SignupError(message: e.toString()));
    }
  }
}
