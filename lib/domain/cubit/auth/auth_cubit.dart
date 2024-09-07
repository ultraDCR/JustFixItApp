import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_fix_it/domain/preference/share_preference_util.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isAuthenticated: false, token: "")) {
    getUserInfo();
  }

  void setUserInfo(String token, dynamic userInfo) async {
    await SharePreferenceUtils().setToken(token);
    emit(AuthState(isAuthenticated: true, token: token));
  }

  Future<void> getUserInfo() async {
    String token = await SharePreferenceUtils().getToken();
    bool authorize =  false;
    // UserInfo? userInfo = await SharePreferenceUtils().getUserData();

    emit(AuthState(
        isAuthenticated: authorize, token: token));
  }

  void logout() async {
    await SharePreferenceUtils().removeToken();
    emit(AuthState(isAuthenticated: false, token: ""));
  }
}

//
// @override
// AuthState? fromJson(Map<String, dynamic> json) {
//   return AuthState.fromJson(json);
// }
//
// @override
// Map<String, dynamic>? toJson(AuthState state) {
//   return state.toJson();
// }
