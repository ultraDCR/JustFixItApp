import 'dart:convert';

import 'package:just_fix_it/data/models/api_response/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceUtils {
  static const String userInfoPref = "user_info";
  static const String tokenPref = "token";
  static const String userTypePref = "user_type";
  static const String isAuthorizePref = "isAuthorize";
  static const String notificationCountPref = "notification_count";
  static const String notificationDataPref = "notification_data";
  static const String newUserDismissPref = "new_user_dismiss";

  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> setToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(tokenPref, token);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await _prefs;
    return (prefs.getString(tokenPref)) ?? "";
  }

  Future<bool?> removeToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.remove(tokenPref);
  }

  Future<String> getUserType() async {
    final SharedPreferences prefs = await _prefs;
    return (prefs.getString(userTypePref)) ?? "";
  }

  Future<bool?> setUserType(String userType) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(userTypePref, userType);
  }

  Future<User?> getUserData() async {
    final SharedPreferences prefs = await _prefs;
    final String? userInfoData = prefs.getString(userInfoPref);

    return (userInfoData != null)
        ? User.fromJson(json.decode(userInfoData))
        : null;
  }

  Future<bool> setUserData(User userInfo) async {
    final SharedPreferences prefs = await _prefs;

    var userString = json.encode(userInfo.toJson());
    return prefs.setString(userInfoPref, userString);
  }



}
