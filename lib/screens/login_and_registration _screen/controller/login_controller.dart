import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/dialogs/loading_dialog.dart';
import 'package:need_flutter_app/models/login_response.dart';
import 'package:need_flutter_app/repository/login_repository.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:need_flutter_app/utils/auth/auth_manager.dart';
import 'package:need_flutter_app/utils/common.dart';
import 'package:need_flutter_app/utils/methods.dart';

import '../../../app.dart';

class LoginController extends GetxController {
  LoginRepository _loginRepository = Get.put(LoginRepository());
  AuthManager _authManager = Get.find();

  late TextEditingController firstName = TextEditingController();
  late TextEditingController lastName = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController phoneNumber = TextEditingController();
  late TextEditingController addOne = TextEditingController();
  late TextEditingController addTwo = TextEditingController();
  late TextEditingController pinCode = TextEditingController();
  late TextEditingController city = TextEditingController();
  late TextEditingController state = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();

  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  var profileImage = "".obs;



  bool passwordVisibleLogin = false;
  bool passwordVisibleRegister = false;
  bool cPasswordVisibleRegister = false;

  void toggleVisibleLoginPassword() {
    passwordVisibleLogin = !passwordVisibleLogin;
    update();
  }

  void toggleVisibleRegisterPassword() {
    passwordVisibleRegister = !passwordVisibleRegister;
    update();
  }

  void toggleVisibleRegisterCPassword() {
    cPasswordVisibleRegister = !cPasswordVisibleRegister;
    update();
  }

  @override
  void onInit() {
    emailTextController = TextEditingController(
        text: App.instance.devMode ? "rohit6@gmail.com" : "");

    passwordTextController =
        TextEditingController(text: App.instance.devMode ? "Rohit@123" : "");

    super.onInit();
  }

  void loginApi() async {
    //var status = await Permission.location.status;
    try {
      Get.dialog(
        LoadingDialog(),
        barrierDismissible: false,
      );

      LoginResponse loginResponse = await _loginRepository.login(
          email: emailTextController.text, pass: passwordTextController.text);

      _authManager.saveLoginData(loginResponse);

      //emailTextController.clear();
      //passwordTextController.clear();

      if (loginResponse.status == '1') {
        Get.offAll(() => DashBoardScreen());
      } else {
        Common.toast("${loginResponse.status}");
        Get.back();
      }
    } on DioError catch (e) {
      Get.back();
      Common.toast(e.response!.data["Dio Error"]);
    } catch (e) {
      Common.toast(Strings.somethingWentWrong);
      log("LoginController : loginApi Error : ${e.runtimeType} : ${e.toString()}");
      Get.back();
    }
  }

  void registrationApi()  async{
    Get.dialog(
      LoadingDialog(),
      barrierDismissible: false,
    );

    LoginResponse loginResponse = await _loginRepository.login(
        email: emailTextController.text, pass: passwordTextController.text);

  }
}
