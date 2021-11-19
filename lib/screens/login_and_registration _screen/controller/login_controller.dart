

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app.dart';

class LoginController extends GetxController{

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

  void loginApi(){

  }

}