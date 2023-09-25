import 'dart:io';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/app.dart';
import 'package:need_flutter_app/dialogs/loading_dialog.dart';
import 'package:need_flutter_app/models/api_response.dart';
import 'package:need_flutter_app/repository/login_repository.dart';
import 'package:need_flutter_app/res/api_keys.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:need_flutter_app/screens/login_and_registration%20_screen/login_screen.dart';
import 'package:need_flutter_app/utils/auth/auth_manager.dart';
import 'package:need_flutter_app/utils/common.dart';
import 'package:need_flutter_app/utils/methods.dart';
import 'package:unique_identifier/unique_identifier.dart';

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

  late TextEditingController resetEmail = TextEditingController();

  TextEditingController otpController = TextEditingController();

  TextEditingController resetPasswordController = TextEditingController();
  TextEditingController resetConfirmPasswordController =
      TextEditingController();

  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  var profileImage = "".obs;

  bool passwordVisibleLogin = false;
  bool passwordVisibleRegister = false;
  bool cPasswordVisibleRegister = false;
  bool resetPasswordVisible = false;
  bool resetConfirmPasswordVisible = false;

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

  void toggleResetPassword() {
    resetPasswordVisible = !resetPasswordVisible;
    update();
  }

  void toggleResetCPassword() {
    resetConfirmPasswordVisible = !resetConfirmPasswordVisible;
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

    Get.offAll(() => DashBoardScreen());

    //var status = await Permission.location.status;
    // try {
    //   Get.dialog(
    //     LoadingDialog(),
    //     barrierDismissible: false,
    //   );
    //
    //   LoginResponse loginResponse = await _loginRepository.login(
    //       email: emailTextController.text, pass: passwordTextController.text);
    //
    //   _authManager.saveLoginData(loginResponse);
    //
    //   emailTextController.clear();
    //   passwordTextController.clear();
    //
    //   if (loginResponse.status == '1') {
    //     Get.offAll(() => DashBoardScreen());
    //   } else {
    //     Common.toast("${loginResponse.status}");
    //     Get.back();
    //   }
    // } on DioError catch (e) {
    //   Get.back();
    //   Common.toast(e.response!.data["Dio Error"]);
    // } catch (e) {
    //   Common.toast(Strings.somethingWentWrong);
    //   log("LoginController : loginApi Error : ${e.runtimeType} : ${e.toString()}");
    //   Get.back();
    //  }
  }

  void registrationApi() async {
    Get.dialog(
      LoadingDialog(),
      barrierDismissible: false,
    );

    try {
      Map data = {
        APIKeys.userid: phoneNumber.text + firstName.text + lastName.text,
        APIKeys.firstName: firstName.text,
        APIKeys.lastName: lastName.text,
        APIKeys.profile: profileImage.value,
        APIKeys.email: email.text,
        APIKeys.phone: phoneNumber.text,
        APIKeys.addOne: addOne.text,
        APIKeys.addTwo: addTwo.text,
        APIKeys.pinCode: pinCode.text,
        APIKeys.city: city.text,
        APIKeys.state: state.text,
        APIKeys.ip: await Ipify.ipv4(),
        APIKeys.iemi: kIsWeb ? "" : await UniqueIdentifier.serial,
        APIKeys.androidVersion: kIsWeb
            ? "Web"
            : Platform.isAndroid
                ? "Android"
                : "IOS",
        APIKeys.password: password.text,
        APIKeys.isActive: "1",
        APIKeys.isEmailVerified: "0",
      };

      ApiResponse apiResponse = await _loginRepository.registration(data);

      if(apiResponse.status == "1"){
        Get.to(() => LoginScreen());
      }
      else{
        log("Something went Wrong");
      }

    } on DioError catch (e) {
      Get.back();
      Common.toast(e.response!.data["Dio Error"]);
    } catch (e) {
      Common.toast(Strings.somethingWentWrong);
      log("LoginController : registration Error : ${e.runtimeType} : ${e.toString()}");
      Get.back();
    }
  }

  void resetPassword() async {
    Get.dialog(
      LoadingDialog(),
      barrierDismissible: false,
    );
    try {} catch (e) {}
  }

  void verifyOTP() {
    Get.dialog(
      LoadingDialog(),
      barrierDismissible: false,
    );

    try {} catch (e) {}
  }

  void changePassword() {
    Get.dialog(
      LoadingDialog(),
      barrierDismissible: false,
    );

    try {} catch (e) {}
  }
}
