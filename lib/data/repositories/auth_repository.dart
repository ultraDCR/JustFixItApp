import '../network_service.dart';

class AuthRepository {
  final NetworkService networkService;

  AuthRepository({required this.networkService});

  Future<dynamic> userLogin({
    required String email,
    required String password,
    String client = "Android",
  }) async {
    var authResponse = await networkService.userLogin(
      email: email,
      password: password,
      client: client,
    );
    return authResponse;
  }


  Future<dynamic> registerUser({
    required String name,
     String? email,
    required String phone,
    required String token,
    required String password,
    required String confirmPassword,
    required String fcmToken,
    String client = "Android",
  }) async {
    var authResponse = await networkService.registerUser(
        name: name,
        email: email??'',
        phone: phone,
        token: token,
        password: password,
        confirmPassword: confirmPassword,
        fcmToken: fcmToken,
        client: client);
    // var authDto = AuthDto.fromJson(authResponse);
    return authResponse;
  }
}
