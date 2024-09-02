part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitial extends SignupState {
  @override
  List<Object> get props => [];
}

class SignupLoading extends SignupState {
  @override
  List<Object> get props => [];
}

class SignupSuccessful extends SignupState {
  final dynamic authData;
  const SignupSuccessful({required this.authData});
  @override
  List<Object> get props => [authData];
}

class SignupError extends SignupState {
  final String message;
  const SignupError({required this.message});
  @override
  List<Object> get props => [message];
}
