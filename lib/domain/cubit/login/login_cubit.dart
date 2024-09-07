
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_fix_it/data/repositories/auth_repository.dart';

import '../../preference/share_preference_util.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit({required this.authRepository}) : super(LoginInitial()) {}
  void loginUser({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      dynamic authDto = await authRepository.userLogin(
          email: email,
          password: password,
          );
      if (authDto != null) {
        print(authDto["user_type"]);
        await SharePreferenceUtils().setToken(authDto["token"]);
        await SharePreferenceUtils().setUserType(authDto["user_type"]);

        emit(LoginSuccessful(authData: authDto));
      } else {
        emit(const LoginError(message: "Something went wrong"));
      }
    } catch (e) {

      print('Login cubit error:$e');
      emit(LoginError(message: e.toString()));
    }
  }
}
