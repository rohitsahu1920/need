

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/res/strings.dart';

class AddNeedController extends GetxController{

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
  setCurrentSelectedValue(String value){
    currentSelectedValue = value;
    update();
  }

  var imageOne = "".obs;
  setImageOne(String value){
    imageOne.value = value;
  }

  var imageTwo = "".obs;
  setImageTwo(String value){
    imageTwo.value = value;
  }

  var imageThree = "".obs;
  setImageThree(String value){
    imageThree.value = value;
  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    resetImages();
  }

  void resetImages(){
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
}