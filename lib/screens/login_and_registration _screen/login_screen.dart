import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/res/app_colors.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/screens/login_and_registration%20_screen/confirm_password_screen.dart';
import 'package:need_flutter_app/screens/login_and_registration%20_screen/registration_screen.dart';
import 'package:need_flutter_app/screens/login_and_registration%20_screen/reset_password_screen.dart';
import 'package:need_flutter_app/utils/assets.dart';
import 'package:need_flutter_app/utils/methods.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';
import 'package:need_flutter_app/utils/validator/validator.dart';
import 'package:need_flutter_app/widget/app_primary_button.dart';
import 'package:need_flutter_app/widget/app_text_field.dart';
import 'package:need_flutter_app/widget/appbar_without_back.dart';

import '../../utils/picker_handler.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatelessWidget {

  final _loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  _login() async {
    if (!isFormValid(_formKey)) return;

    _loginController.loginApi();
  }

  _selectImage() async{
    _loginController.setImageTwo(
        await PickerHandler().pickImageFromGallery());
    log("Image One :: ${_loginController.imageTwo}");
  }

  uploadImage() async{
    _loginController.uploadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithoutBack(
        title: Strings.appName,
        textStyle: TextStyles.appBarBold,
        actions: [
          C0(),
        ],
      ),
      body: Container(
        color: Colors.amber,
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    C10(),
                    const Center(
                      child: Image(
                        image: AssetImage(Assets.login),
                        fit: BoxFit.contain,
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //const Spacer(),
            Padding(
              padding: EdgeInsets.all(Sizes.s15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppTextField(
                    hintText: Strings.email,
                    controller: _loginController.emailTextController,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp("${Validator.emailPattern}")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  C10(),
                  GetBuilder<LoginController>(
                    builder: (controller) {
                      return AppTextField(
                        maxLines: 1,
                        controller:
                        _loginController.passwordTextController,
                        hintText: Strings.password,
                        passwordVisible: controller.passwordVisibleLogin,
                        validator: (value) {
                          if (value!.isEmpty) return Strings.passValidation;
                          return null;
                        },
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.passwordVisibleLogin
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                          onPressed: controller.toggleVisibleLoginPassword,
                        ),
                      );
                    },
                  ),
                  C10(),
                  GestureDetector(
                    child: Text(
                      Strings.forgotPass,
                      textAlign: TextAlign.end,
                    ),
                    onTap: () {
                      Get.to(() => ConfirmPasswordScreen());
                    },
                  ),
                  C10(),
                  SizedBox(
                    width: double.infinity,
                    child: AppPrimaryButton(
                      text: Strings.signIn,
                      onPressed: _login,
                    ),
                  ),
                  const C20(color: Colors.amber),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Text(
                          Strings.newUserRegister,
                        ),
                        onTap: () {
                          Get.to(() => RegistrationScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Sizes.s15),
              child: Text(
                Strings.poweredBy,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.greyText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
