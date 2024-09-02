import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceUtils {
  static const String userInfoPref = "user_info";
  static const String tokenPref = "token";
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

  Future<bool> setNotificationCount() async {
    final SharedPreferences prefs = await _prefs;
    var count = await getNotificationCount();
    var newCount = count + 1;
    return prefs.setInt(notificationCountPref, newCount);
  }

  Future<int> getNotificationCount() async {
    final SharedPreferences prefs = await _prefs;
    return (prefs.getInt(notificationCountPref)) ?? 0;
  }

  Future<bool?> removeNotificationCount() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.remove(notificationCountPref);
  }

  Future<bool> setNotificationData(String data) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(notificationDataPref, data);
  }

  Future<String?> getNotificationData() async {
    final SharedPreferences prefs = await _prefs;
    return (prefs.getString(notificationDataPref));
  }

  Future<bool?> removeNotificationData() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.remove(notificationDataPref);
  }

}
