import 'dart:convert';
import 'package:get/get.dart';
import 'package:need_flutter_app/dialogs/loading_dialog.dart';
import 'package:need_flutter_app/models/login_response.dart';
import 'package:need_flutter_app/screens/login_and_registration%20_screen/login_screen.dart';
import 'package:need_flutter_app/screens/splash_screen.dart';
import 'package:need_flutter_app/utils/shared_pref_manager/sp_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  final SharedPreferences _prefs = Get.find();

  AuthManager();

  bool isUserLoggedIn() {
    return getLoginData() != null;
  }

  void saveLoginData(LoginResponse loginResponse) {
    _prefs.setString(
      SPKeys.loginUserData.toString(),
      jsonEncode(loginResponse.toJson()),
    );
  }

  LoginResponse? getLoginData() {
    String? tempStr = _prefs.getString(
      SPKeys.loginUserData.toString(),
    );

    try {
      return LoginResponse.fromJson(jsonDecode(tempStr!));
    } catch (e) {
      return null;
    }
  }



  Future<void> logoutUser() async {
    Get.dialog(LoadingDialog());
    await _prefs.remove(SPKeys.loginUserData.toString());
    await _prefs.remove(SPKeys.fcmToken.toString());
    await _prefs.remove(SPKeys.googleAccessToken.toString());
    await _prefs.remove(SPKeys.googleRefreshToken.toString());
    //await _prefs.clear();
    _prefs.setBool(SPKeys.isFirst.value, false);
    Get.offAll(() => SplashScreen());
  }

  Future<void> loginAgain() async {
    Get.dialog(LoadingDialog());
    await _prefs.remove(SPKeys.loginUserData.toString());
    await _prefs.remove(SPKeys.fcmToken.toString());
    await _prefs.remove(SPKeys.googleAccessToken.toString());
    await _prefs.remove(SPKeys.googleRefreshToken.toString());
    //await _prefs.clear();
    _prefs.setBool(SPKeys.isFirst.value, false);
    Get.offAll(() => LoginScreen());
  }
}
