part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class SignUpButtonPressed extends SignupEvent {
  final String fullName;
  final String? email;
  final String address;
  final String password;
  final String confirmPassword;
  final String userType;

  @override
  List<Object> get props => [
        fullName,
        email??'',
        address,
        password,
        confirmPassword,
        userType,
      ];

  const SignUpButtonPressed({
    required this.fullName,
     this.email,
    required this.address,
    required this.password,
    required this.confirmPassword,
    required this.userType,
  });
}
