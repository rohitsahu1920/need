import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/res/api_keys.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:need_flutter_app/utils/common.dart';
import 'package:need_flutter_app/utils/methods.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../dialogs/loading_dialog.dart';
import '../../../models/api_response.dart';
import '../../../repository/dashboard_repository.dart';
import '../../../repository/login_repository.dart';
import '../../../utils/auth/auth_manager.dart';

class AddNeedController extends GetxController {
  final AuthManager _authManager = Get.find();
  final DashboardRepository _dashboardRepository =
      Get.put(DashboardRepository());
  final LoginRepository _loginRepository = Get.put(LoginRepository());

  final isLoading = true.obs;
  final hasError = false.obs;
  final errorMessage = Strings.wrongMsg.obs;

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController addOne = TextEditingController();
  TextEditingController addTwo = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController city = TextEditingController();

  List<String> dropdownItems = [
    "Select Need type",
    "Food",
    "Clothes",
    "Books",
    "Medical",
    "Shelter",
    "Miscellaneous",
    "Other"
  ];

  var currentSelectedValue = "Select Value";

  String get getCurrentSelectedValue => currentSelectedValue;

  setCurrentSelectedValue(String value) {
    log("setCurrentSelectedValue :: $value");
    currentSelectedValue = value;
    update();
  }

  var imageOne = "".obs;

  setImageOne(String value) {
    imageOne.value = value;
  }

  var imageTwo = "".obs;

  setImageTwo(String value) {
    imageTwo.value = value;
  }

  var imageThree = "".obs;

  setImageThree(String value) {
    imageThree.value = value;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    resetImages();
  }

  void resetImages() {
    imageOne.value = "";
    imageTwo.value = "";
    imageThree.value = "";
    title.text = "";
    description.text = "";
    phoneNumber.text = "";
    addOne.text = "";
    addTwo.text = "";
    pinCode.text = "";
    city.text = "";
  }

  void addNeedAPI() async {
    log("Under Need API method :: 1");
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );

    try {
      if (imageOne.isNotEmpty || imageTwo.isNotEmpty || imageThree.isNotEmpty) {
        bool serviceEnabled;
        LocationPermission permission;

        serviceEnabled = await Geolocator.isLocationServiceEnabled();

        var status = await Permission.location.status;

        log("$status");

        if (status.isGranted) {
          log("Under Need API method :: 2");
          permission = await Geolocator.checkPermission();

          log("Under Need API method :: 3");
          DateTime now = DateTime.now();
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          String productId =
              "${phoneNumber.text}_${now.day}${now.hour}${now.minute}${now.second}";

          Map data = {
            APIKeys.productId: productId,
            APIKeys.publishDate: now.toString(),
            APIKeys.photoOne:
            imageOne.value.isNotEmpty ? productId + "_imageOne.jpeg" : "",
            APIKeys.photoTwo:
            imageTwo.value.isNotEmpty ? productId + "_imageTwo.jpeg" : "",
            APIKeys.photoThree: imageThree.value.isNotEmpty
                ? productId + "_imageThree.jpeg"
                : "",
            APIKeys.lat: position.altitude.toString(),
            APIKeys.long: position.longitude.toString(),
            APIKeys.description: description.text,
            APIKeys.title: title.text,
            APIKeys.category: getCurrentSelectedValue,
            APIKeys.subCategory: "",
            APIKeys.superSubCategory: "",
            APIKeys.phoneNo: _authManager.getLoginData()?.phone,
            APIKeys.alternateNo: phoneNumber.text,
            APIKeys.isActive: "1",
            APIKeys.strike: "0",
            APIKeys.report: "",
            APIKeys.userid: _authManager.getLoginData()?.userid,
            APIKeys.email: _authManager.getLoginData()?.email,
            APIKeys.addOne: addOne.text,
            APIKeys.addTwo: addTwo.text,
            APIKeys.pinCode: pinCode.text,
            APIKeys.city: city.text,
          };

          ApiResponse apiResponse =
          await _dashboardRepository.addNeedRepo(data);
          log("API response :: ${apiResponse.status}");
          if (apiResponse.status == "1") {
            log("Success");

            ApiResponse apiResponseOne = ApiResponse();
            ApiResponse apiResponseTwo = ApiResponse();
            ApiResponse apiResponseThree = ApiResponse();

            if (imageOne.value.isNotEmpty) {
              apiResponseOne = await _loginRepository.upload(
                  productId + "_imageOne.jpeg", imageOne.value);
              log("Image one :: ${apiResponseOne.status}");
            }

            if (imageTwo.value.isNotEmpty) {
              apiResponseTwo = await _loginRepository.upload(
                  productId + "_imageTwo.jpeg", imageTwo.value);
              log("Image Two :: ${apiResponseTwo.status}");
            }

            if (imageThree.value.isNotEmpty) {
              apiResponseThree = await _loginRepository.upload(
                  productId + "_imageThree.jpeg", imageThree.value);
              log("Image Three :: ${apiResponseThree.status}");
            }

            if (apiResponseOne.status == "1" ||
                apiResponseTwo.status == "1" ||
                apiResponseThree.status == "1") {
              Get.back();
              Get.offAll(() => DashBoardScreen());
            }
          }

        } else {
          Get.back();
          if(status.isPermanentlyDenied){
            Common.toast("PLease enable location service");
            openAppSettings();
          }
          if(status.isDenied){
            await Permission.location.request();
          }
          log("PLease enable location service");
        }
      } else {
        Get.back();
        Common.toast("Please select atleast one image");
        log("Please select atleast one image");
      }
    } catch (e) {
      Get.back();
      Common.toast("Something went wrong");
      log("under addNeed catch :: $e");
    }
  }
}
