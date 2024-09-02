part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class SignUpButtonPressed extends SignupEvent {
  final String fullName;
  final String phoneNumber;
  final String token;
  final String? email;
  final String password;
  final String confirmPassword;

  @override
  List<Object> get props => [
        fullName,
        phoneNumber,
        token,
        email??'',
        password,
        confirmPassword,
      ];

  const SignUpButtonPressed({
    required this.fullName,
    required this.phoneNumber,
    required this.token,
     this.email,
    required this.password,
    required this.confirmPassword,
  });
}
