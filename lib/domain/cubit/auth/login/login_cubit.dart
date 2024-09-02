
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_fix_it/data/repositories/auth_repository.dart';

import '../../../preference/share_preference_util.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;
  String? fcmToken;

  LoginCubit({required this.authRepository}) : super(LoginInitial()) {
  }
  void loginUser({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      dynamic authDto = await authRepository.userLogin(
          email: email,
          password: password,
          );
      if (authDto.authData != null) {
        emit(LoginSuccessful(authData: authDto.authData!));
      } else {
        emit(const LoginError(message: "Something went wrong"));
      }
    } catch (e) {
      // print('Login cubit error');
      emit(LoginError(message: e.toString()));
    }
  }
}
