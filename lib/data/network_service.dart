
import 'package:auto_route/auto_route.dart';
import 'package:just_fix_it/data/api_helper.dart';
import 'package:just_fix_it/shared/constants/enums.dart';

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
      paramFullName: name,
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
            paramFullName: name
          }
      );
      return userResponse;
    }

    Future<dynamic> createRequest({
     required String serviceId,
     required String status,
    }) async {
      var requestResponse = await _helper.post(
          url: createRequestAPI,
          body: {
            paramServiceId : serviceId,
            // paramStatus: status
          }
      );
      return requestResponse;
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
    required ServiceCategory category,

  }) async {
    var signupResponse = await _helper.multiPartPost(url: servicesAPI, body: {
      paramName: name,
      paramDescription: description,
      paramCategory: category.name,
      paramPrice: price,
    },
      files: [image], paramFile: 'image',
    );
    return signupResponse;
  }

  Future<dynamic> updateServices({
    required String serviceId,
    String? name,
    String? description,
    String? price,
    String? image,
    ServiceCategory? category,
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


  Future<dynamic> searchServices({String? serviceName}) async {

    var serviceResponse = await _helper.post(url: searchServiceAPI,
        body: {
          "query" : serviceName
        }
    );
    return serviceResponse;
  }

 Future<dynamic> searchServicesByCategory({required String serviceType}) async {

    var serviceResponse = await _helper.post(url: searchServiceByCategoryAPI, body: {"query": serviceType });
    return serviceResponse;
  }


 Future<dynamic> getServiceRequestHistory() async {

    var serviceResponse = await _helper.get(url: serviceRequestHistoryAPI);
    return serviceResponse;
  }



 Future<dynamic> getProviderServiceRequest() async {

    var serviceResponse = await _helper.get(url: providerServiceRequestAPI);
    return serviceResponse;
  }


 Future<dynamic> approveServiceRequest({required String requestId}) async {
   var url = "$approveRequestAPI/$requestId";

    var serviceResponse = await _helper.patch(url: url);
    return serviceResponse;
  }

 Future<dynamic> cancelServiceRequest({required String requestId}) async {
    var url = "$cancelRequestAPI/$requestId";
    var serviceResponse = await _helper.patch(url: url );
    return serviceResponse;
  }


}