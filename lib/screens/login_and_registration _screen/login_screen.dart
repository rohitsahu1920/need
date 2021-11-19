import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/res/app_colors.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/utils/assets.dart';
import 'package:need_flutter_app/utils/methods.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';
import 'package:need_flutter_app/widget/app_primary_button.dart';
import 'package:need_flutter_app/widget/app_text_field.dart';
import 'package:need_flutter_app/widget/custom_appbar.dart';
import 'package:need_flutter_app/widget/internet_connectivity_wrapper.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatelessWidget {

  final _loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();

  _login() async {
    if (!isFormValid(_formKey)) return;

    _loginController.loginApi();
  }

  @override
  Widget build(BuildContext context) {
    return InternetConnectivityWrapper(
      child: Scaffold(
        appBar: appBarCustom(
          onBackTap: onBackTab,
          color: Colors.black,
          title: Strings.appName,
          textStyle: TextStyles.appBarBold,
          actions: [
            C0(),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Image(
                      image: AssetImage(Assets.login),
                      fit: BoxFit.contain,
                      width: screenWidth,
                    ),
                    Padding(
                      padding: EdgeInsets.all(Sizes.s15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppTextField(
                            controller: _loginController.emailTextController,
                            hintText: Strings.emailOrPhoneNumber,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Text is empty';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          C10(),
                          GetBuilder<LoginController>(
                            builder: (controller) {
                              return AppTextField(
                                controller:
                                _loginController.passwordTextController,
                                hintText: Strings.password,
                                passwordVisible: controller.passwordVisible,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Text is empty';
                                  }
                                  return null;
                                },
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                  onPressed: controller.toggleVisible,
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
                              //Get.to(() => ResetPasswordStartScreen());
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
                          C10(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: Text(
                                  Strings.newUserActivate,
                                ),
                                onTap: () {
                                  //Get.to(() => ActivateUserScreen());
                                },
                              ),
                              C30(),
                              GestureDetector(
                                child: Text(Strings.loginWithOtp),
                                onTap: () {
                                  //Get.to(() => LoginWithPhoneScreen());
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Sizes.s15),
              child: Text(
                Strings.poweredBy,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.greyText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onBackTab(){

  }
}
