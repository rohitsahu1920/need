import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/screens/login_and_registration%20_screen/confirm_password_screen.dart';
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
  final FocusNode otp = FocusNode();

  _verifyOTP() async {
    if (!isFormValid(_formKey)) return;
    Get.to(() => ConfirmPasswordScreen());
    //_loginController.loginApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        title: Strings.verifyOTP,
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
                    const C40(
                      color: Colors.amber,
                    ),
                    const Center(
                      child: Image(
                        image: AssetImage(Assets.login),
                        fit: BoxFit.contain,
                        width: 300,
                        height: 300,
                      ),
                    ),
                    const C40(
                      color: Colors.amber,
                    ),
                    Padding(
                      padding: EdgeInsets.all(Sizes.s15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PinPut(
                            fieldsCount: 4,
                            onSubmit: (value) {

                            },
                            onChanged: (value) {

                            },
                            eachFieldConstraints: const BoxConstraints(
                                minHeight: 50, minWidth: 50),
                            focusNode: otp,
                            controller: _loginController.otpController,
                            submittedFieldDecoration:
                            _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(
                                color: Colors.red,
                              ),
                            ),
                            selectedFieldDecoration: _pinPutDecoration,
                            followingFieldDecoration:
                            _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          const C20(
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: AppPrimaryButton(
                              text: Strings.verifyOTP,
                              onPressed: _verifyOTP,
                            ),
                          ),
                          const C20(color: Colors.amber),
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
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.greyText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: Colors.blueGrey,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

}
