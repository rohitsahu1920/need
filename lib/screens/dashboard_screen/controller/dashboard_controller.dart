import 'package:get/get.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/utils/assets.dart';

import '../../../network/urls.dart';
import '../../../utils/auth/auth_manager.dart';
import '../../../utils/methods.dart';

class DashBoardController extends GetxController{

  final AuthManager _authManager = Get.find();

  final isLoading = true.obs;
  final hasError = false.obs;
  final errorMessage = Strings.wrongMsg.obs;

  List<String> imageList = [Assets.donation1,Assets.donation2,Assets.donation3];

  String profileLink = "";

  @override
  void onInit() {
    String profile = _authManager.getLoginData()?.profile ?? "";
    profileLink = AppUrl.awsImageLink+profile;
    super.onInit();
  }

  void print(){

    log("Login data :: ${_authManager.getLoginData()?.profile}");

  }

}