import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/screens/add_needs_screens/widget/select_image_widget.dart';
import 'package:need_flutter_app/utils/common.dart';
import 'package:need_flutter_app/utils/methods.dart';
import 'package:need_flutter_app/utils/picker_handler.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';
import 'package:need_flutter_app/widget/app_dropdown_fields.dart';
import 'package:need_flutter_app/widget/app_error_widget.dart';
import 'package:need_flutter_app/widget/app_primary_button.dart';
import 'package:need_flutter_app/widget/app_text_field.dart';
import 'package:need_flutter_app/widget/custom_appbar.dart';
import 'controller/add_need_controller.dart';

class AddNeedScreen extends StatelessWidget {
  final AddNeedController _addNeedController = Get.put(AddNeedController());
  final _formKey = GlobalKey<FormState>();

  AddNeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarCustom(
        title: Strings.weNeedYou,
        textStyle: TextStyles.appBarTittle,
      ),
      body: GetX<AddNeedController>(
        dispose: (state) {
          _addNeedController.resetImages();
        },
        initState: (state) {},
        builder: (controller) {
          if (_addNeedController.hasError.value) {
            return AppErrorWidget(
              errorMessage: _addNeedController.errorMessage.value,
            );
          }
          return _body(context);
        },
      ),
    ));
  }

  Widget _body(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Form(
        key: _formKey,
        child: ListView(
          //color: Colors.amber,
          children: [
            C5(),
            Row(
              children: [
                Obx(
                  () => SelectImagesWidget(
                    onTap: () => _showPicker(context, 1),
                    title: "select first \nimage",
                    imagePath: _addNeedController.imageOne.value,
                  ),
                ),
                Obx(
                  () => SelectImagesWidget(
                    onTap: () => _showPicker(context, 2),
                    title: "select second \nimage",
                    imagePath: _addNeedController.imageTwo.value,
                  ),
                ),
                Obx(
                  () => SelectImagesWidget(
                    onTap: () => _showPicker(context, 3),
                    title: "select third \nimage",
                    imagePath: _addNeedController.imageThree.value,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(Sizes.s15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppTextField(
                    prefixIcon: Icon(
                      Icons.title,
                      color: Colors.black,
                    ),
                    hintText: Strings.addNeedTitle,
                    controller: _addNeedController.title,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.addNeedTitleValidation;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  C10(),
                  AppTextField(
                    maxLength: 100,
                    prefixIcon: Icon(
                      Icons.description,
                      color: Colors.black,
                    ),
                    hintText: Strings.addNeedDesc,
                    controller: _addNeedController.description,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.addNeedDescValidation;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  C10(),
                  AppDropdownButtonField(
                    items: _addNeedController.dropdownItems,
                    onChange: (value) {
                      _addNeedController.setCurrentSelectedValue(value);
                    },
                    value: _addNeedController.dropdownItems[0],
                  ),
                  C10(),
                  AppDropdownButtonField(
                    items: _addNeedController.dropdownItems,
                    onChange: (value) {
                      _addNeedController.setCurrentSelectedValue(value);
                    },
                    value: _addNeedController.dropdownItems[0],
                  ),
                  C10(),
                  AppTextField(
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: Colors.black,
                    ),
                    hintText: Strings.mobileNumber,
                    controller: _addNeedController.title,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.addNeedTitleValidation;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  C10(),
                  AppTextField(
                    prefixIcon: Icon(
                      Icons.map,
                      color: Colors.black,
                    ),
                    hintText: Strings.addressOne,
                    controller: _addNeedController.title,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.addNeedTitleValidation;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  C10(),
                  AppTextField(
                    prefixIcon: Icon(
                      Icons.map,
                      color: Colors.black,
                    ),
                    hintText: Strings.addressTwo,
                    controller: _addNeedController.title,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.addNeedTitleValidation;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  C10(),
                  AppTextField(
                    prefixIcon: Icon(
                      Icons.pin_drop,
                      color: Colors.black,
                    ),
                    hintText: Strings.pinCode,
                    controller: _addNeedController.title,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.addNeedTitleValidation;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  C10(),
                  AppTextField(
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Colors.black,
                    ),
                    hintText: Strings.city,
                    controller: _addNeedController.title,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.addNeedTitleValidation;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  C10(),
                  SizedBox(
                    width: double.infinity,
                    child: AppPrimaryButton(
                      text: Strings.submit,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPicker(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () async {
                      switch (index) {
                        case 1:
                          _addNeedController.setImageOne(
                              await PickerHandler().pickImageFromGallery());
                          log("Image One :: ${_addNeedController.imageOne}");
                          break;
                        case 2:
                          _addNeedController.setImageTwo(
                              await PickerHandler().pickImageFromGallery());
                          log("Image Two :: ${_addNeedController.imageTwo}");
                          break;
                        case 3:
                          _addNeedController.setImageThree(
                              await PickerHandler().pickImageFromGallery());
                          log("Image Three :: ${_addNeedController.imageThree}");
                          break;
                        default:
                          Common.toast("Something went wrong");
                      }
                      Get.back();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () async {
                    switch (index) {
                      case 1:
                        _addNeedController.setImageOne(
                            await PickerHandler().pickImageFromCamera());
                        log("Camera One :: ${_addNeedController.imageOne}");
                        break;
                      case 2:
                        _addNeedController.setImageTwo(
                            await PickerHandler().pickImageFromCamera());
                        log("Camera Two :: ${_addNeedController.imageTwo}");
                        break;
                      case 3:
                        _addNeedController.setImageThree(
                            await PickerHandler().pickImageFromCamera());
                        log("Camera Two :: ${_addNeedController.imageThree}");
                        break;
                      default:
                        Common.toast("Something went wrong");
                    }
                    Get.back();
                  },
                ),
              ],
            ),
          );
        });
  }
}
