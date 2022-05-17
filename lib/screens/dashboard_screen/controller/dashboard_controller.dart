import 'package:get/get.dart';
import 'package:need_flutter_app/models/getdahsoboard_model.dart';
import 'package:need_flutter_app/models/getdahsoboard_model.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/utils/assets.dart';

import '../../../dialogs/loading_dialog.dart';
import '../../../models/getdahsoboard_model.dart';
import '../../../models/getdahsoboard_model.dart';
import '../../../models/getdahsoboard_model.dart';
import '../../../network/urls.dart';
import '../../../repository/dashboard_repository.dart';
import '../../../utils/auth/auth_manager.dart';
import '../../../utils/common.dart';
import '../../../utils/methods.dart';

class DashBoardController extends GetxController with StateMixin{

  final AuthManager _authManager = Get.find();
  final DashboardRepository _dashboardRepository = Get.put(DashboardRepository());

  final isLoading = true.obs;
  final hasError = false.obs;
  final errorMessage = Strings.wrongMsg.obs;

  List<String> imageList = [Assets.donation1,Assets.donation2,Assets.donation3];



  String profileLink = "";

  @override
  void onInit() async{
    String profile = _authManager.getLoginData()?.profile ?? "";
    profileLink = AppUrl.awsImageLink+profile;
    //await getDashboardDetails();

    super.onInit();
  }

  GetDashBoardModel getDashBoardModel = GetDashBoardModel();

  Future<void> getDashboardDetails() async {
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    log("Login data :: ${_authManager.getLoginData()?.profile}");

    try{
     getDashBoardModel =  await _dashboardRepository.getDashboardDetails();

     if(getDashBoardModel.status == "1"){
       Get.back();
       log("getDashboardDetails successfully fetched");
       Common.toast("Success");
     }else{
       Get.back();
       log("Under else part of getDashboardDetails");
       Common.toast("Something went wrong");
     }

    }catch(e){
      Get.back();
      log("Under GetDashBoardDetails catch :: $e");
      Common.toast("Something went wrong");
    }


  }

}