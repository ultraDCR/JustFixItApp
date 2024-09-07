import '../models/api_response/user.dart';
import '../network_service.dart';

class AuthRepository {
  final NetworkService networkService;

  AuthRepository({required this.networkService});

  Future<dynamic> userLogin({
    required String email,
    required String password,
  }) async {
    var authResponse = await networkService.userLogin(
      email: email,
      password: password,
    );
    return authResponse;
  }


  Future<dynamic> registerUser({
    required String name,
     String? email,
    required String address,
    required String userType,
    required String password,
    required String confirmPassword,
  }) async {
    var authResponse = await networkService.registerUser(
        name: name,
        email: email??'',
        address: address,
        userType: userType,
        password: password,
        confirmPassword: confirmPassword,
        );
    // var authDto = AuthDto.fromJson(authResponse);
    return authResponse;
  }

  Future<dynamic> getCurrentUser() async {
    var authResponse = await networkService.getCurrentUser();
    var userDto = User.fromJson(authResponse);

    return userDto;
  }

  Future<dynamic> updateCurrentUser({
    String? email,
    required String name,
    required String address,
  }) async {
    var authResponse = await networkService.updateCurrentUser(
      name: name,
      email: email,
      address: address,
    );
    return authResponse;
  }
}
