import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/screens/login_and_registration%20_screen/login_screen.dart';
import 'package:need_flutter_app/widget/custom_appbar.dart';

import '../../res/app_colors.dart';
import '../../res/strings.dart';
import '../../utils/assets.dart';
import '../../utils/methods.dart';
import '../../utils/sizes.dart';
import '../../utils/textstyles.dart';
import '../../utils/ui_helper.dart';
import '../../utils/validator/validator.dart';
import '../../widget/app_primary_button.dart';
import '../../widget/app_text_field.dart';
import 'controller/login_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final _loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();

  _resetPass() async {
    if (!isFormValid(_formKey)) return;

    _loginController.loginApi();
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
                child: Column(
                  children: [
                    C40(color: Colors.amber,),
                    Center(
                      child: Image(
                        image: AssetImage(Assets.login),
                        fit: BoxFit.contain,
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Spacer(),
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
                          C20(color: Colors.amber,),
                          SizedBox(
                            width: double.infinity,
                            child: AppPrimaryButton(
                              text: Strings.sendOTP,
                              onPressed: _resetPass,
                            ),
                          ),
                          C20(color: Colors.amber),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: Text(
                                  Strings.goBackToLogin,
                                ),
                                onTap: () {
                                  Get.to(() => LoginScreen());
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
}
