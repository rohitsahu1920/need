import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../../res/app_colors.dart';
import '../../res/strings.dart';
import '../../utils/assets.dart';
import '../../utils/methods.dart';
import '../../utils/sizes.dart';
import '../../utils/textstyles.dart';
import '../../utils/ui_helper.dart';
import '../../widget/app_primary_button.dart';
import '../../widget/custom_appbar.dart';
import 'controller/login_controller.dart';
import 'login_screen.dart';

class OTPVerifyScreen extends StatelessWidget {
  OTPVerifyScreen({Key? key}) : super(key: key);

  final _loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();

  _resetPass() async {
    if (!isFormValid(_formKey)) return;
    Get.to(() => OTPVerifyScreen());
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
                          // PinPut(
                          //   fieldsCount: 6,
                          //   selectedFieldDecoration: _pinPutDecoration,
                          //   followingFieldDecoration:
                          //       _pinPutDecoration.copyWith(
                          //     borderRadius: BorderRadius.circular(5.0),
                          //     border: Border.all(
                          //       color: Colors.deepPurpleAccent.withOpacity(.5),
                          //     ),
                          //   ),
                          // ),
                          C20(
                            color: Colors.amber,
                          ),
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
