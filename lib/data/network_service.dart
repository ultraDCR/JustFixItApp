
import 'package:just_fix_it/data/api_helper.dart';

class NetworkService {
  static NetworkService? _instance;

  NetworkService._();

  static NetworkService get instance {
    return _instance ??= NetworkService._();
  }

  final ApiBaseHelper _helper = ApiBaseHelper();

  //Auth
  Future<dynamic> userLogin({required String email,
    required String password,
    String client = "Android"}) async {
    var loginResponse = await _helper.post(url: loginAPI, body: {
      paramEmail: email,
      paramPassword: password,
      paramClient: "Android",
    });
    return loginResponse;
  }

  Future<dynamic> registerUser({
    required String name,
    String? email,
    required String phone,
    required String token,
    required String password,
    required String confirmPassword,
    required String fcmToken,
    required String client,
  }) async {
    var loginResponse = await _helper.post(url: registerUserAPI, body: {
      paramName: name,
      paramPassword: password,
      paramPhone: phone,
      paramOtp: token,
      paramPasswordConfirmation: confirmPassword,
      paramEmail: email,
      paramClient: client,
      paramFcmToken: fcmToken
    });
    return loginResponse;
  }
}