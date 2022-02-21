import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/res/app_colors.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/screens/login_and_registration%20_screen/login_screen.dart';
import 'package:need_flutter_app/utils/methods.dart';
import 'package:need_flutter_app/utils/picker_handler.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';
import 'package:need_flutter_app/utils/validator/validator.dart';
import 'package:need_flutter_app/widget/app_primary_button.dart';
import 'package:need_flutter_app/widget/app_text_field.dart';
import 'package:need_flutter_app/widget/appbar_without_back.dart';

import '../../widget/custom_appbar.dart';
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
      appBar: appBarCustom(
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
                                () =>
                                Column(
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
                                                padding: const EdgeInsets.all(
                                                    15.0),
                                                child: SizedBox(
                                                  height: 100,
                                                  width: 100,
                                                  child: _loginController
                                                      .profileImage
                                                      .value
                                                      .isNotEmpty
                                                      ? Image.file(
                                                    File(_loginController
                                                        .profileImage.value),
                                                    fit: BoxFit.fill,
                                                  )
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
                            hintText: Strings.firstName,
                            controller: _loginController.firstName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return Strings.nameValidation;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                          C10(),
                          AppTextField(
                            hintText: Strings.lastName,
                            controller: _loginController.lastName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return Strings.lastNameValidation;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                          C10(),
                          AppTextField(
                            hintText: Strings.email,
                            controller: _loginController.email,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp("${Validator.emailPattern}")
                                      .hasMatch(value)) {
                                return Strings.validEmail;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          C10(),
                          AppTextField(
                            hintText: Strings.phone,
                            controller: _loginController.phoneNumber,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp("${Validator.mobilePattern}")
                                      .hasMatch(value))
                                return Strings.phoneValidation;
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                          ),
                          C10(),
                          AppTextField(
                            hintText: Strings.addressOne,
                            controller: _loginController.addOne,
                            validator: (value) {
                              if (value!.isEmpty)
                                return Strings.addressValidation;
                              return null;
                            },
                            keyboardType: TextInputType.streetAddress,
                          ),
                          C10(),
                          AppTextField(
                            hintText: Strings.addressTwo,
                            controller: _loginController.addTwo,
                            validator: (value) {
                              if (value!.isEmpty)
                                return Strings.addressValidation;
                              return null;
                            },
                            keyboardType: TextInputType.streetAddress,
                          ),
                          C10(),
                          AppTextField(
                            hintText: Strings.pinCode,
                            controller: _loginController.pinCode,
                            validator: (value) {
                              if (value!.isEmpty) return Strings.phone;
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          ),
                          C10(),
                          AppTextField(
                            hintText: Strings.city,
                            controller: _loginController.city,
                            validator: (value) {
                              if (value!.isEmpty) return Strings.phone;
                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                          C10(),
                          AppTextField(
                            hintText: Strings.state,
                            controller: _loginController.state,
                            validator: (value) {
                              if (value!.isEmpty) return Strings.phone;
                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                          C10(),
                          GetBuilder<LoginController>(builder: (controller) {
                            return AppTextField(
                              maxLines: 1,
                              passwordVisible: controller.passwordVisibleRegister,
                              hintText: Strings.password,
                              controller: controller.password,
                              validator: (value) {
                                if (value!.isEmpty) return Strings.phone;
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.passwordVisibleLogin
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                ),
                                onPressed: controller.toggleVisibleRegisterPassword,
                              ),
                            );
                          }),

                          C10(),
                          GetBuilder<LoginController>(builder: (controller) {
                            return AppTextField(
                              maxLines: 1,
                              passwordVisible: controller.cPasswordVisibleRegister,
                              hintText: Strings.cPassword,
                              controller: _loginController.confirmPassword,
                              validator: (value) {
                                if (value!.isEmpty) return Strings.phone;
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.passwordVisibleLogin
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                ),
                                onPressed: controller.toggleVisibleRegisterCPassword,
                              ),
                            );
                          }),

                          C10(),
                          SizedBox(
                            width: double.infinity,
                            child: AppPrimaryButton(
                              text: Strings.sighUp,
                              onPressed: _registration,
                            ),
                          ),
                          C10(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: Text(
                                  Strings.alreadyRegister,
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

  void _showPicker(BuildContext context,) {
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
