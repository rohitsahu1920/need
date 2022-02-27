import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/app_colors.dart';
import '../../res/strings.dart';
import '../../utils/assets.dart';
import '../../utils/methods.dart';
import '../../utils/sizes.dart';
import '../../utils/textstyles.dart';
import '../../utils/ui_helper.dart';
import '../../widget/app_primary_button.dart';
import '../../widget/app_text_field.dart';
import '../../widget/custom_appbar.dart';
import 'controller/login_controller.dart';
import 'login_screen.dart';

class ConfirmPasswordScreen extends StatelessWidget {
  ConfirmPasswordScreen({Key? key}) : super(key: key);
  final _loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();


  _resetPassword() async {
    if (!isFormValid(_formKey)) return;
    Get.to(() => LoginScreen());
    //_loginController.loginApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        title: Strings.resetPass,
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
                child: ListView(
                  children: [
                    C40(
                      color: Colors.amber,
                    ),
                    Center(
                      child: Image(
                        image: AssetImage(Assets.login),
                        fit: BoxFit.contain,
                        width: 300,
                        height: 300,
                      ),
                    ),
                    C40(
                      color: Colors.amber,
                    ),
                    Padding(
                      padding: EdgeInsets.all(Sizes.s15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GetBuilder<LoginController>(
                            builder: (controller) {
                              return AppTextField(
                                maxLines: 1,
                                controller:
                                _loginController.resetPasswordController,
                                hintText: Strings.password,
                                passwordVisible: controller.resetPasswordVisible,
                                validator: (value) {
                                  if (value!.isEmpty) return Strings.passValidation;
                                  return null;
                                },
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.resetPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                  onPressed: controller.toggleResetPassword,
                                ),
                              );
                            },
                          ),
                          C10(),
                          GetBuilder<LoginController>(
                            builder: (controller) {
                              return AppTextField(
                                maxLines: 1,
                                controller:
                                _loginController.resetConfirmPasswordController,
                                hintText: Strings.cPassword,
                                passwordVisible: controller.resetConfirmPasswordVisible,
                                validator: (value) {
                                  if (value!.isEmpty) return Strings.passValidation;
                                  return null;
                                },
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.resetConfirmPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                  onPressed: controller.toggleResetCPassword,
                                ),
                              );
                            },
                          ),
                          C20(
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: AppPrimaryButton(
                              text: Strings.changePassword,
                              onPressed: _resetPassword,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Sizes.s10),
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

}
