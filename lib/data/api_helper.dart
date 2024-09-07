import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:just_fix_it/domain/preference/share_preference_util.dart';
import 'package:just_fix_it/shared/exceptions/app_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiBaseHelper {
  Future<dynamic> get({required String url}) async {
    dynamic responseJson;
    try {
      SharedPreferences preference = await SharedPreferences.getInstance();
      String? token = preference.getString(paramToken);
      if (kDebugMode) {
        print("Url: $url");
      }
      // print("api token : $token");
      Map<String, String> header = {"Accept": "application/json"};
      if (token != null) {
        header[paramAuthorization] = "Bearer $token";
      }
      final response =
      await http.get(Uri.parse(baseUrl + url), headers: header);
      if (kDebugMode) {
        print(response.headers);
      }

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getWithHeader(
      {required String url, required Map<String, String> header}) async {
    var responseJson;
    try {
      SharedPreferences preference = await SharedPreferences.getInstance();
      String? token = preference.getString(paramToken);
      if (kDebugMode) {
        print("Url: $url");
      }

      final response = await http.get(Uri.parse(url), headers: header);
      if (kDebugMode) {
        print(response.headers);
      }

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete({required String url}) async {
    var responseJson;
    try {
      SharedPreferences preference = await SharedPreferences.getInstance();
      String? token = preference.getString(paramToken);
      if (kDebugMode) {
        print("Url: $url");
      }

      // print("api token : $token");
      Map<String, String> header = {"Accept": "application/json"};
      if (token != null) {
        header[paramAuthorization] = "Bearer $token";
      }
      final response =
      await http.delete(Uri.parse(baseUrl + url), headers: header);
      if (kDebugMode) {
        print(response.headers);
      }

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post({required String url, Object? body}) async {
    var responseJson;
    try {
      String? token = await SharePreferenceUtils().getToken();
      if (kDebugMode) {
        print("Url: $url");
      }
      if (kDebugMode) {
        print("Body: $body");
      }
      // print("api token : $token");
      Map<String, String> headers = {
        "content-type": "application/json",
        paramAuthorization: "Bearer $token"
      };

      final response = await http.post(Uri.parse(baseUrl + url),
          body: jsonEncode(body), headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put({required String url, Object? body}) async {
    var responseJson;
    try {
      String? token = await SharePreferenceUtils().getToken();
      if (kDebugMode) {
        print("Url: $url");
      }
      if (kDebugMode) {
        print("Body: $body");
      }
      // print("api token : $token");
      Map<String, String> headers = {
        "content-type": "application/json",
        paramAuthorization: "Bearer $token"
      };

      final response = await http.put(Uri.parse(baseUrl + url),
          body: jsonEncode(body), headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> patch({required String url, Object? body}) async {
    var responseJson;
    try {
      String? token = await SharePreferenceUtils().getToken();
      if (kDebugMode) {
        print("Url: $url");
      }
      if (kDebugMode) {
        print("Body: $body");
      }
      // print("api token : $token");
      Map<String, String> headers = {
        "content-type": "application/json",
        paramAuthorization: "Bearer $token"
      };

      final response = await http.patch(Uri.parse(baseUrl + url),
          body: jsonEncode(body), headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }



  Future<dynamic> multiPartPost(
      {required String url,
        Map<String, String>? body,
        required List<String> files,
        required String paramFile}) async {
    var responseJson;

    try {
      String? token = await SharePreferenceUtils().getToken();
      if (kDebugMode) {
        print("Url: $url");
      }
      if (kDebugMode) {
        print("body: $body");
      }
      // print("api token : $token");

      var request = http.MultipartRequest("POST", Uri.parse(baseUrl + url));

      if (body != null) {
        request.fields.addAll(body);
      }
      request.headers.addAll({
        paramAuthorization: "Bearer $token",
        "Accept": "application/json",
      });

      for (var file in files) {
        if (kDebugMode) {
          print(file);
        }
        request.files.add(await http.MultipartFile.fromPath(paramFile, file));
      }

      if (kDebugMode) {
        print(request.files);
      }

      var response = await request.send();
      final res = await http.Response.fromStream(response);
      responseJson = _returnResponse(res);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> multiPartPostWithMultipleListFile({
    required String url,
    Map<String, String>? body,
    required Map<String, List<String>> listFiles,
    required Map<String, List<String>> listString,
  }) async {
    var responseJson;

    try {
      String? token = await SharePreferenceUtils().getToken();
      if (kDebugMode) {
        print("Url: $url");
      }
      if (kDebugMode) {
        print("body: $body");
      }
      // print("api token : $token");

      var request = http.MultipartRequest("POST", Uri.parse(baseUrl + url));

      if (body != null) {
        request.fields.addAll(body);
      }
      request.headers.addAll({
        paramAuthorization: "Bearer $token",
        "Accept": "application/json",
      });

      listFiles.forEach((key, value) async {
        for (var file in value) {
          if (kDebugMode) {
            print(file);
          }
          request.files.add(await http.MultipartFile.fromPath(key, file));
        }
      });

      listString.forEach((key, value) {
        for (var string in value) {
          if (kDebugMode) {
            print(string);
          }
          request.files.add(http.MultipartFile.fromString(key, string));
        }
      });

      if (kDebugMode) {
        print(request.files);
      }

      var response = await request.send();
      final res = await http.Response.fromStream(response);
      responseJson = _returnResponse(res);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> multiPartFieldWithDynamicData({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    var responseJson;

    try {
      String? token = await SharePreferenceUtils().getToken();
      if (kDebugMode) {
        print("Url: $url");
      }
      if (kDebugMode) {
        print("body: $body");
      }
      // print("api token : $token");

      var request = http.MultipartRequest("POST", Uri.parse(baseUrl + url));

      request.headers.addAll({
        paramAuthorization: "Bearer $token",
        "Accept": "application/json",
      });
      if (body != null) {
        // request.fields.addAll(body);
        body.forEach((key, value) {
          if (value is String) {
            request.fields[key] = value;
          } else if (value is bool) {
            request.fields[key] = value ? "1" : "0";
          } else if (value is num) {
            request.fields[key] = value.toString();
          } else if (value is List) {
            for (int i = 0; i < value.length; i++) {
              var listValue = value[i];
              if (kDebugMode) {
                print(listValue);
              }
              request.fields["$key[$i]"] = listValue.toString();
            }
          }
        });
      }
      if (kDebugMode) {
        print(request.fields);
      }

      var response = await request.send();
      final res = await http.Response.fromStream(response);
      responseJson = _returnResponse(res);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        if (kDebugMode) {
          print(responseJson);
        }
        return responseJson;
      case 400:
        var errorJson = json.decode(response.body.toString());
        throw BadRequestException(errorJson[paramMessage]);
      case 401:
      case 403:
        var errorJson = json.decode(response.body.toString());
        SharePreferenceUtils().removeToken();
        throw UnauthorisedException(errorJson[paramMessage]);
      case 412:
        var errorJson = json.decode(response.body.toString());
        throw InvalidRequestException(errorJson[paramMessage]);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<dynamic> getWithURL({required String url}) async {
    var responseJson;
    try {
      SharedPreferences preference = await SharedPreferences.getInstance();
      String? token = preference.getString(paramToken);
      if (kDebugMode) {
        print("Url: $url");
      }
      // print("api token : $token");
      Map<String, String> header = {"Accept": "application/json"};
      // if (token != null) {
      //   header[paramAuthorization] = "Bearer $token";
      // }
      final response = await http.get(Uri.parse(url), headers: header);
      if (kDebugMode) {
        print(response.headers);
      }

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}

const baseUrl = "http://192.168.1.4:3001/";
// const baseUrl = "http://172.16.138.88:3001/";
// const baseUrl = "http://172.16.143.162:3001/";
// //Live



//EndPoints
const homeAPI = "api/home";
const getCurrentUserAPI = "api/user/currentuserdata";
const updateCurrentUserAPI = "api/user/updatecurrentuser";
const loginAPI = "api/auth/login";
const signupAPI = "api/auth/signup";
const servicesAPI = "api/services";
const createRequestAPI = "api/createrequest";
const imageUrl = "${baseUrl}api/services/image/";



const paramToken = "token";
const paramAuthorization = "Authorization";
const paramData = "data";
const paramMessage = "message";

const paramAddress = "address";
const paramAddressTitle = "title";
const paramCityId = "city_id";
const paramIsDefault = "is_default";
const paramName = "fullname";
const paramDescription = "description";
const paramPrice = "price";
const paramImage = "image";
const paramPhone = "phone";
const paramOtp = "token";
const paramPhoneAlt = "phone_alt";
const paramDeliveryAddressId = "delivery_address_id";
const paramEmail = "email";
const paramPassword = "password";
const paramUserType = "user_type";
const paramClient = "client";
const paramFcmToken = "fcm_token";
const paramInitialCode = "initial_code";
const paramPasswordConfirmation = "password_confirmation";
const paramPlatform = 'platform';
const paramServiceId = 'serviceId';
const paramStatus = 'status';