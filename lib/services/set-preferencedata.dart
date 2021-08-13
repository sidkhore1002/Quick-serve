import 'package:shared_preferences/shared_preferences.dart';

class PreferencesData {
  static final String userInfo = "userInfo";

  static Future<bool> setUserLoginData(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userInfo, value);
  }

  static Future<String> getUserLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userInfo);
  }

  static Future<void> clearPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
