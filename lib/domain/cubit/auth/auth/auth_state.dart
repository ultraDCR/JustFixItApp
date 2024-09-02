part of 'auth_cubit.dart';

class AuthState extends Equatable {
  bool isAuthenticated;
  String? token;

  AuthState({required this.isAuthenticated, this.token});

  @override
  List<Object> get props => [isAuthenticated, token ?? ""];

  @override
  String toString() {
    return 'AuthState{isAuthenticated: $isAuthenticated, token: $token}';
  }

  AuthState copyWith({
    bool? isAuthenticated,
    String? token,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
    );
  }
}
