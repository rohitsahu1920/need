import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/res/app_colors.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/utils/methods.dart';
import 'package:need_flutter_app/utils/picker_handler.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';
import 'package:need_flutter_app/utils/validator/validator.dart';
import 'package:need_flutter_app/widget/app_primary_button.dart';
import 'package:need_flutter_app/widget/app_text_field.dart';
import 'package:need_flutter_app/widget/appbar_without_back.dart';

import 'controller/login_controller.dart';

class RegistrationScreen extends StatelessWidget {
  final _loginController = Get.put(LoginController());

  RegistrationScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  _registration() async {
    if (!isFormValid(_formKey)) return;

    _loginController.registrationApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithoutBack(
        title: Strings.registration,
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
                    Padding(
                      padding: EdgeInsets.all(Sizes.s15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Obx(
                            () => Column(
                              children: [
                                GestureDetector(
                                  onTap: () => _showPicker(context),
                                  child: Column(
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(60.0),
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 5),
                                        child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: _loginController
                                                      .profileImage
                                                      .value
                                                      .isNotEmpty
                                                  ? Image.file(File(
                                                      _loginController
                                                          .profileImage.value),fit: BoxFit.fill,)
                                                  : Icon(
                                                      Icons.person_rounded,
                                                      size: 32,
                                                      color: Colors.black,
                                                    ),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => _showPicker(context),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      Strings.setProfileImage,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          C15(),
                          AppTextField(
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
                          AppTextField(
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
                          AppTextField(
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
                                controller:
                                    _loginController.passwordTextController,
                                passwordVisible: controller.passwordVisible,
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return Strings.passValidation;
                                  return null;
                                },
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
                              onPressed: _registration,
                            ),
                          ),
                          C10(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: Text(
                                  Strings.newUserRegister,
                                ),
                                onTap: () {
                                  //Get.to(() => ActivateUserScreen());
                                },
                              ),
                              C30(),
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

  void _showPicker(
    BuildContext context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: Text(Strings.photoLibrary),
                    onTap: () async {
                      _loginController.profileImage.value =
                          await PickerHandler().pickImageFromGallery();
                      Get.back();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: Text(Strings.camera),
                  onTap: () async {
                    _loginController.profileImage.value =
                        await PickerHandler().pickImageFromCamera();
                    Get.back();
                  },
                ),
              ],
            ),
          );
        });
  }
}
