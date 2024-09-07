
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
    }) async {
    var loginResponse = await _helper.post(url: loginAPI, body: {
      paramEmail: email,
      paramPassword: password,
    });
    return loginResponse;
  }

  Future<dynamic> registerUser({
    required String name,
    String? email,
    required String address,
    required String userType,
    required String password,
    required String confirmPassword,

  }) async {
    var signupResponse = await _helper.post(url: signupAPI, body: {
      paramName: name,
      paramPassword: password,
      paramUserType: userType,
      paramAddress: address,
      paramEmail: email,
    });
    return signupResponse;
  }

  Future<dynamic> getCurrentUser() async {
    var userResponse = await _helper.get(url: getCurrentUserAPI);
    return userResponse;
  }

   Future<dynamic> updateCurrentUser({
     required String name,
     String? email,
     required String address,
}) async {
      var userResponse = await _helper.patch(
          url: updateCurrentUserAPI,
          body: {
            paramAddress : address,
            paramName: name
          }
      );
      return userResponse;
    }

    Future<dynamic> createRequest({
     required String serviceId,
     required String status,
    }) async {
      var userResponse = await _helper.patch(
          url: createRequestAPI,
          body: {
            paramServiceId : serviceId,
            paramStatus: status
          }
      );
      return userResponse;
    }

  Future<dynamic> getServices() async {
    var serviceResponse = await _helper.get(url: servicesAPI);
    return serviceResponse;
  }

  Future<dynamic> getServicesById({required String serviceId}) async {
    var queryUrl = Uri(
        path: servicesAPI,
        queryParameters: {"id": serviceId.toString()});
    var serviceList = await _helper.get(
      url: queryUrl.toString(),
    );
    return serviceList;
  }

  Future<dynamic> addService({
    required String name,
    required String description,
    required String price,
    required String image,

  }) async {
    var signupResponse = await _helper.post(url: servicesAPI, body: {
      paramName: name,
      paramDescription: description,
      paramPrice: price,
      paramImage: image,
    });
    return signupResponse;
  }

  Future<dynamic> updateServices({
    required String serviceId,
    String? name,
    String? description,
    String? price,
    String? image,
  }) async {
    var queryUrl = Uri(
        path: servicesAPI,
        queryParameters: {"id": serviceId.toString()});
    var serviceList = await _helper.put(
      url: queryUrl.toString(),
        body: {
          if (name != null) paramName: name,
          if (description != null) paramDescription: description,
          if (price != null) paramPrice: price,
          if (image != null) paramImage: image,
        }
    );
    return serviceList;
  }

  Future<dynamic> deleteServices({required String serviceId}) async {
    var queryUrl = Uri(
        path: servicesAPI,
        queryParameters: {"id": serviceId.toString()});
    var serviceList = await _helper.delete(
      url: queryUrl.toString(),
    );
    return serviceList;
  }


}