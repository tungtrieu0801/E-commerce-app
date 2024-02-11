import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userIdkey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userWalletKey = "USERWALLETKEY";
  static String userProfileKey = "USERPROFILEKEY";

  Future<bool> saveUserId(String getUserID) async {
    SharedPreferences preferences  = await SharedPreferences.getInstance();
    return preferences.setString(userIdkey, getUserID);
  }
  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences preferences  = await SharedPreferences.getInstance();
    return preferences.setString(userNameKey, getUserName);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences preferences  = await SharedPreferences.getInstance();
    return preferences.setString(userEmailKey, getUserEmail);
  }

  Future<bool> saveUserWallet(String getUserWallet) async {
    SharedPreferences preferences  = await SharedPreferences.getInstance();
    return preferences.setString(userWalletKey, getUserWallet);
  }

  Future<bool> saveUserpRrofile(String getUserProfile) async {
    SharedPreferences preferences  = await SharedPreferences.getInstance();
    return preferences.setString(userProfileKey, getUserProfile);
  }

  Future<String?>getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userIdkey);
  }

  Future<String?>getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userNameKey);
  }

  Future<String?>getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userEmailKey);
  }

  Future<String?>getUserWallet() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userWalletKey);
  }

  Future<String?>getUserProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userProfileKey);
  }
}