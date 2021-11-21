import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/dialogs/loading_dialog.dart';
import 'package:need_flutter_app/models/login_response.dart';
import 'package:need_flutter_app/repository/login_repository.dart';
import 'package:need_flutter_app/res/api_keys.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:need_flutter_app/utils/auth/auth_manager.dart';
import 'package:need_flutter_app/utils/common.dart';
import 'package:need_flutter_app/utils/methods.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../app.dart';

class LoginController extends GetxController {
  LoginRepository _loginRepository = Get.put(LoginRepository());
  AuthManager _authManager = Get.find();

  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  bool passwordVisible = false;

  void toggleVisible() {
    passwordVisible = !passwordVisible;
    update();
  }

  @override
  void onInit() {
    emailTextController = TextEditingController(
        text: App.instance.devMode ? "rohitfr@yopmail.com" : "");

    passwordTextController =
        TextEditingController(text: App.instance.devMode ? "welcome123" : "");

    super.onInit();
  }

  void loginApi() async {
    var status = await Permission.location.status;
    try {
      Get.dialog(
        LoadingDialog(),
        barrierDismissible: false,
      );

      LoginResponse loginResponse = await _loginRepository.login(
          email: emailTextController.text, pass: passwordTextController.text);

      _authManager.saveLoginData(loginResponse);

      emailTextController.clear();
      passwordTextController.clear();

      if (loginResponse.status == '1') {
        Get.offAll(DashBoardScreen());
      } else {
        Common.toast("Status is 0");
      }
    } on DioError catch (e) {
      Get.back();
      Common.toast(e.response!.data["Dio Error"]);
    } catch (e) {
      Common.toast(Strings.somethingWentWrong);
      log("LoginController : loginApi Error : ${e.runtimeType}");
      Get.back();
    }
  }
}
