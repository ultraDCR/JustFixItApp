import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../preference/share_preference_util.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final dynamic authRepository;
  SignupBloc(this.authRepository) : super(SignupInitial()) {
    on<SignUpButtonPressed>(_onSignUp);
  }

  FutureOr<void> _onSignUp(
      SignUpButtonPressed event, Emitter<SignupState> emit) async {
    try {
      var response = await authRepository.registerUser(
          name: event.fullName,
          email: event.email??'',
          phone: event.phoneNumber,
          token: event.token,
          password: event.password,
          confirmPassword: event.confirmPassword,);
      if (response.authData != null) {
        emit(SignupSuccessful(authData: response.authData!));
      }
    } catch (e) {
      emit(SignupError(message: e.toString()));
    }
  }
}
